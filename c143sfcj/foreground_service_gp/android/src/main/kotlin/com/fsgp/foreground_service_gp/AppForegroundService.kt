package com.fsgp.foreground_service_gp


import android.Manifest
import android.app.ForegroundServiceStartNotAllowedException
import android.app.PendingIntent
import android.app.Service
import android.content.Intent
import android.os.Build
import android.os.IBinder
import android.widget.RemoteViews
import androidx.annotation.RequiresPermission
import androidx.core.app.NotificationChannelCompat
import androidx.core.app.NotificationCompat
import androidx.core.app.NotificationManagerCompat
import android.graphics.Color

class AppForegroundService : Service() {

    companion object {
        const val CHANNEL_ID = "my_foreground_channel"
        const val NOTIFY_ID = 1001
        const val SERVICE_ID = 1002
        var sIsRunning = false
    }

    override fun onCreate() {
        super.onCreate()
        sIsRunning = true
    }
    override fun onTimeout(startId: Int, fgsType: Int) {
        //Fix: ForegroundServiceDidNotStopInTimeException on Android 15.
        println("===foreground=onTimeout====")
        stopSelf()
        super.onTimeout(startId, fgsType)
    }

    @RequiresPermission(Manifest.permission.POST_NOTIFICATIONS)
    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {

        try {

            val title = intent?.getStringExtra("title") ?: "TreeWorld"
            val content = intent?.getStringExtra("content") ?: "My Cash = \$1000"
            val imgNameBg = intent?.getStringExtra("imgNameBg") ?: ""
            val imgNameSmall = intent?.getStringExtra("imgNameSmall") ?: ""
            // 可以从 intent 获取颜色值，或者使用硬编码的颜色
            val contentTextColor = intent?.getIntExtra("contentTextColor", Color.BLACK) ?: Color.BLACK

            println("===foreground=onStartCommand===title:${title}==content:$content= contentTextColor:$contentTextColor")
            val remoteViews = RemoteViews(packageName, R.layout.noti_c)
            remoteViews.setTextViewText(R.id.title, title)
            remoteViews.setTextViewText(R.id.content, content)
            // 设置 R.id.content 的文本颜色
            remoteViews.setTextColor(R.id.content, contentTextColor) // 这里设置文本颜色
            val notiBgResId = applicationContext.resources.getIdentifier(imgNameBg, "drawable", packageName)
            if (notiBgResId != 0) {
                remoteViews.setImageViewResource(R.id.noti_bg, notiBgResId)
            }
            val leftImageResId = applicationContext.resources.getIdentifier(imgNameSmall, "drawable", packageName)
            if (leftImageResId != 0) {
                remoteViews.setImageViewResource(R.id.left_img, leftImageResId)
            }


            val clickIntent =
                applicationContext.packageManager.getLaunchIntentForPackage(packageName)?.apply {
                    putExtra("fix_tx", "android")
                } ?: Intent().apply {
                    setPackage(packageName)
                    addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
                    putExtra("fix_tx", "android")
                }
            val smallIconResId =
                applicationContext.resources.getIdentifier("ic_launcher", "mipmap", packageName)
                    .takeIf { it != 0 }
                    ?: applicationInfo.icon.takeIf { it != 0 }
                    ?: android.R.drawable.sym_def_app_icon
            val pendingIntent = PendingIntent.getActivity(
                this,
                0,
                clickIntent,
                PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
            )
            val notification = NotificationCompat.Builder(this, CHANNEL_ID)
                .setSmallIcon(smallIconResId)
                .setAutoCancel(false)
                .setPriority(NotificationCompat.PRIORITY_DEFAULT)
                .setOngoing(true)
                .setOnlyAlertOnce(true)
                .setSound(null)
                .setCategory(NotificationCompat.CATEGORY_SERVICE)
                .setCustomContentView(remoteViews)
                .setCustomBigContentView(remoteViews)
                .setContentIntent(pendingIntent)
                .build()

            val nmc = NotificationManagerCompat.from(applicationContext)
            nmc.createNotificationChannel(
                NotificationChannelCompat.Builder(
                    CHANNEL_ID,
                    NotificationManagerCompat.IMPORTANCE_DEFAULT
                )
                    .setName("Foreground Service")
                    .setSound(null, null)
                    .setLightsEnabled(false)
                    .setShowBadge(false)
                    .build()
            )


            startForeground(NOTIFY_ID, notification)


        } catch (e: Exception) {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S
                && e is ForegroundServiceStartNotAllowedException
            ) {
                println("===foreground=onStartCommand===app in background===ForegroundServiceStartNotAllowedException:${e.message}")
                // App not in a valid state to start foreground service
                // (e.g. started from bg)
            } else {
                println("===foreground=onStartCommand===Exception:${e.message}")
            }
            stopSelf()
            return START_NOT_STICKY
        }



        return START_STICKY
    }

    override fun onBind(intent: Intent?): IBinder? = null

    override fun onDestroy() {
        super.onDestroy()
        sIsRunning = false
    }

}
