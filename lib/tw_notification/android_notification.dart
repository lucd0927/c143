import 'dart:math';

import 'package:c143/tw_base/tw_gj/logC143.dart';
import 'package:c143/tw_base/tw_configgg/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';

// import 'package:firebase_messaging/firebase_messaging.dart';

// 顶层方法（不能在类里）
// @pragma('vm:entry-point')
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   pbLog("后台收到 FCM 消息: ${message.messageId}");
//   // 这里可以做数据处理、存储、触发本地通知等
// }

@pragma('vm:entry-point')
void backgourdListener(NotificationResponse ntftRse) {
  WidgetsFlutterBinding.ensureInitialized();
  // ignore: avoid_print
  print(
    '点击通知 notificationTapBackground (${ntftRse.id}) action tapped: '
    '${ntftRse.actionId} with'
    ' payload: ${ntftRse.payload}',
  );
}

class TwNotificationC143 {
  static final TwNotificationC143 _instanceC143 = TwNotificationC143._();

  TwNotificationC143._();

  factory TwNotificationC143() {
    return _instanceC143;
  }

  static bool _dianjTzzzzC143 = false;

  static bool get clickTz => _dianjTzzzzC143;

  static String baioti = "";
  static String neirong = "";

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPluginC143 =
      FlutterLocalNotificationsPlugin();
  AndroidFlutterLocalNotificationsPlugin
  androidFlutterLocalNotificationsPlugin =
      AndroidFlutterLocalNotificationsPlugin();

  tzNumC143() async {
    final String payload = "local";
    try {
      int localN = await AndroidFlutterLocalNotificationsPlugin()
          .extractMessageReceivedNum("local");
      twLooog("==initNotificationCount==localcount:$localN==");
      if (localN > 0) {
        for (int i = 0; i < localN; i++) {
          // PBMaiDian.inform_p(veinKeyValue: "local");
        }
      }

      int fcmNnnn = await AndroidFlutterLocalNotificationsPlugin()
          .extractMessageReceivedNum("fcm");
      twLooog("==initNotificationCount==fcmcount:$fcmNnnn==");
      if (fcmNnnn > 0) {
        for (int i = 0; i < localN; i++) {
          // PBMaiDian.inform_p(veinKeyValue: "fcm");
        }
      }

      int lockNnnn = await AndroidFlutterLocalNotificationsPlugin()
          .extractMessageReceivedNum("unlock");
      twLooog("==initNotificationCount==unlockcount:$lockNnnn==");
      if (lockNnnn > 0) {
        for (int i = 0; i < localN; i++) {
          // PBMaiDian.inform_p(veinKeyValue: "unlock");
        }
      }
    } catch (e) {
      twLooog("===initNotificationCount==error:$e=");
    }
  }

  List get contents => [
    {
      "title": "Cash Bonus!",
      "content":
          "\$10 Bonus Ready! Tap to Open App → Shake Tree & Cash Out Fast!",
    },

    {"title": "Cash-Out So Close!", "content": "Tap more, Earn more!"},
    {"title": "Cash-Out So Close!", "content": "Ad Value Up! Claim Rewards!"},

    {
      "title": "Cash Out Pending",
      "content": "You have \$1,000 waiting! Tap to claim to PayPal!",
    },

    {
      "title": "You Can Cash Out!",
      "content":
          "Balance over \$1,000! Tap here to cash out & turn earnings into REAL CASH!",
    },

    {
      "title": "Cash Out Pending",
      "content": "You have \$1,000 waiting! Tap to claim to PayPal!",
    },

    {"title": "You Can Cash Out!", "content": "Open App → Grow & Cash Out!"},
  ];

  List get imgTz => [
    "c143n_img",
    "c143n_img",
    "c143n_img",
    "c143n_img",
    "c143n_img",
    "c143n_img",
    "c143n_img",
    "c143n_img",
    "c143n_img",
    "c143n_img",
  ];

  List<T> getRandomNMinus3C143<T>(List<T> source) {
    if (source.length <= 3) {
      throw ArgumentError('数组长度必须大于 3');
    }

    final list = List<T>.from(source); // 拷贝一份，避免修改原数组
    list.shuffle(Random()); // 随机打乱
    return list.sublist(0, 3);
  }

  init() async {
    await requestNotificationPermission();
    tzNumC143();

    int length = contents.length;
    int random = Random().nextInt(length);
    int length2 = imgTz.length;
    int random2 = Random().nextInt(length2);
    pushIcon = imgTz[random2];
    baioti = contents[random]['title'];
    neirong = contents[random]['content'];

    twLooog("=initNotification====init===");
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher'); // 通知图标

    const InitializationSettings initSettings = InitializationSettings(
      android: androidSettings,
    );

    await flutterLocalNotificationsPluginC143.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        // 点击通知回调
        print("点击通知 onDidReceiveNotificationResponse: ${response.payload}");
        String payload = response.payload ?? "local";
        tongsongdianji(response.id);
      },
      onDidReceiveBackgroundNotificationResponse: backgourdListener,
    );
    NotificationAppLaunchDetails? notificationAppLaunchDetails =
        await AndroidFlutterLocalNotificationsPlugin()
            .getNotificationAppLaunchDetails();
    twLooog(
      "=initNotification====getNotificationAppLaunchDetails==notificationAppLaunchDetails:$notificationAppLaunchDetails=",
    );

    if (notificationAppLaunchDetails != null) {
      NotificationResponse? notificationResponse =
          notificationAppLaunchDetails.notificationResponse;
      bool didNotificationLaunchApp =
          notificationAppLaunchDetails.didNotificationLaunchApp ?? false;
      _dianjTzzzzC143 = didNotificationLaunchApp;
      print(
        "点击通知 notificationAppLaunchDetails: didNotificationLaunchApp:${didNotificationLaunchApp} id:${notificationResponse?.id} data:${notificationResponse?.payload}",
      );
      if (didNotificationLaunchApp) {
        tongsongdianji(notificationResponse?.id);
      }
    }
    List newContents = getRandomNMinus3C143(contents);
    List tzimages = getRandomNMinus3C143(imgTz);
    print("=====newContents:$newContents");
    dingshhhhiC143(
      id: C143dingshitzid,
      minutes: TwConfigggg.hasDeeevv() ? 1 : 28,
      title: newContents[0]['title'],
      content: newContents[0]['content'],
      tzimage: tzimages[0],
    );
    dingshhhhiC143(
      id: C143dingshitzid2,
      minutes: TwConfigggg.hasDeeevv() ? 2 : 58,
      title: newContents[1]['title'],
      content: newContents[1]['content'],
      tzimage: tzimages[1],
    );
    dingshhhhiC143(
      id: C143dingshitzid3,
      minutes: TwConfigggg.hasDeeevv() ? 3 : 80,
      title: newContents[2]['title'],
      content: newContents[2]['content'],
      tzimage: tzimages[2],
    );
    fcmtongzhi();
    jiesoutzC143();
  }

  tongsongdianji(int? tuisongid) {
    String payload = "";
    print("====tongsongdianji==tzid:$tuisongid==");
    if (tuisongid == unlockId) {
      payload = "unlock";
    } else if (tuisongid == C143dingshitzid ||
        tuisongid == C143dingshitzid2 ||
        tuisongid == C143dingshitzid3) {
      payload = "local";
    } else {
      payload = "fcm";
    }
    // PBMaiDian.launch_page(veinKeyValue: "push");
    // PBMaiDian.inform_c(veinKeyValue: payload);
  }

  Future<bool> requestNotificationPermission() async {
    bool result = await Permission.notification.isGranted;

    if (await Permission.notification.isDenied) {
      PermissionStatus permissionStatus = await Permission.notification
          .request();
      result = permissionStatus == PermissionStatus.granted;
    }
    twLooog("==requestNotificationPermission=result:$result");
    return result;
  }

  int C143dingshitzid = 5696;
  int C143dingshitzid2 = 5697;
  int C143dingshitzid3 = 5698;
  String pushIcon = "tzimg1";

  Future<void> dingshhhhiC143({
    required int id,
    required int minutes,

    required String title,
    required String content,
    required String tzimage,
  }) async {
    twLooog("==initNotification=_repeatNotification===id:$id minutes:$minutes");
    //自定义通知ID
    // id = dingshitzid;

    AndroidNotificationDetails details = AndroidNotificationDetails(
      'channelId:$id',
      'repeat:$id',
      styleInformation: BeautyStyleInformation(
        title,
        content,
        tzimage,
        'Go Earn',
        'ic_launcher',
      ),
      priority: Priority.high,
      importance: Importance.high,
      //“groupKey”：防止通知被系统折叠
      groupKey: "$id",
    );
    await AndroidFlutterLocalNotificationsPlugin().periodicallyShowWithDuration(
      id,
      title,
      content,
      //间隔时长根据需求设置
      Duration(minutes: minutes),
      notificationDetails: details,
      scheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
      payload: "local",
    );
  }

  Future<void> fcmtongzhi() async {
    try {
      bool? result = await AndroidFlutterLocalNotificationsPlugin()
          .subscribeToTopic(
            "c143_treeworld",
            AndroidNotificationDetails(
              'fcm_tree',
              'fcm_notification',
              styleInformation: BeautyStyleInformation(
                '',
                '',
                pushIcon,
                'Go Earn',
                'ic_launcher',
              ),
              priority: Priority.high,
              importance: Importance.high,
            ),
          );
      twLooog("==initNotification=_subscribeFcmTopic===$result");
    } catch (e) {
      twLooog("==initNotification=_subscribeFcmTopic=error==$e");
    }
  }

  int unlockId = 805;

  Future<void> jiesoutzC143() async {
    //自定义通知ID
    int id = unlockId;
    int length = contents.length;
    int random = Random().nextInt(length);

    var tttttt = contents[random]['title'];
    var ccccc = contents[random]['content'];
    await AndroidFlutterLocalNotificationsPlugin().showBroadcastNotification(
      id,
      tttttt,
      ccccc,
      //两次发送解锁通知的间隔，根据需求设置
      TwConfigggg.hasDeeevv() ? Duration(seconds: 5) : Duration(seconds: 5),
      'android.intent.action.USER_PRESENT',
      AndroidNotificationDetails(
        'lock_tree',
        'unlock:$id',
        priority: Priority.high,
        importance: Importance.max,
        styleInformation: BeautyStyleInformation(
          tttttt,
          ccccc,
          pushIcon,
          'Go Earn',
          'ic_launcher',
        ),
        //“groupKey”：防止通知被系统折叠
        groupKey: "$id",
      ),
      'unlock',
    );
  }

  Future<bool> checkNotificationPermission() async {
    bool result = await Permission.notification.isGranted;
    twLooog("==requestNotificationPermission=result:$result");
    return result;
  }
}
