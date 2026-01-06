import 'dart:math';

import 'package:c143/tw_base/tw_ad/guiyin/package.dart';
import 'package:c143/tw_base/tw_configgg/config.dart';
import 'package:c143/tw_base/tw_gj/loggggg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:permission_handler/permission_handler.dart';

const local_iosc143 = "c143iosnotificationcount";

const int gudingC143 = 6890;
const int jianchaNotiC143 = 6891;
const int answerNotiC143 = 6892;
const int zhifuNotifiC143 = 6893;

@pragma('vm:entry-point')
backgroundNotfication(NotificationResponse notif) async {
  WidgetsFlutterBinding.ensureInitialized();
  // SharedPreferences sp = await SharedPreferences.getInstance();
  // SSNotificationIos().setTzCount(SSNotificationIos().getTzCount(sp), sp);
}

class TwNotificationIosC143 {
  static final TwNotificationIosC143 _instance = TwNotificationIosC143._();

  TwNotificationIosC143._();

  factory TwNotificationIosC143() {
    return _instance;
  }

  static bool _clickTzC143 = false;

  static bool get clickTz => _clickTzC143;

  static String titleC143 = "";
  static String contentC143 = "";

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPluginC143 =
      FlutterLocalNotificationsPlugin();

  final IOSFlutterLocalNotificationsPlugin _pluginC143 =
      IOSFlutterLocalNotificationsPlugin();



  List get contentsC143 => [
    {
      "title": "",
      "content": "Come back now or lose your chance to coin out 1,000.",
    },

    {
      "title": "",
      "content": "Come back now or lose your chance to coin out 1,000.",
    },

    {
      "title": "",
      "content": "Come back now or lose your chance to coin out 1,000.",
    },

    {
      "title": "",
      "content": "Come back now or lose your chance to coin out 1,000.",
    },

    {
      "title": "",
      "content": "Come back now or lose your chance to coin out 1,000.",
    },
  ];

  // void setTzCount(int value, SharedPreferences sp) =>
  //     sp.setInt(local_ios, value);
  //
  // int getTzCount(SharedPreferences sp) => sp.getInt(local_ios) ?? 0;

  initC143() async {
    await requestNotificationPermissionC143();


    twLooog("=initNotification====init===");

    const InitializationSettings initSettingsC143 = InitializationSettings(
      iOS: DarwinInitializationSettings(
        // B. 中断级别：时效性 (穿透专注模式)
        // InterruptionLevel.timeSensitive,
      ),
    );

    await flutterLocalNotificationsPluginC143.initialize(
      initSettingsC143,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        // 点击通知回调
        twLooog("点击通知 onDidReceiveNotificationResponse: ${response.payload}");
        tongsongdianji(response.id);
      },
      onDidReceiveBackgroundNotificationResponse: backgroundNotfication,
    );
    NotificationAppLaunchDetails? notificationAppLaunchDetails = await _pluginC143
        .getNotificationAppLaunchDetails();
    twLooog(
      "=initNotification====getNotificationAppLaunchDetails==notificationAppLaunchDetails:$notificationAppLaunchDetails=",
    );

    if (notificationAppLaunchDetails != null) {
      NotificationResponse? notificationResponse =
          notificationAppLaunchDetails.notificationResponse;
      bool didNotificationLaunchApp =
          notificationAppLaunchDetails.didNotificationLaunchApp ?? false;
      _clickTzC143 = didNotificationLaunchApp;
      twLooog(
        "点击通知 notificationAppLaunchDetails: didNotificationLaunchApp:${didNotificationLaunchApp} id:${notificationResponse?.id} data:${notificationResponse?.payload}",
      );
      if (didNotificationLaunchApp) {
        tongsongdianji(notificationResponse?.id);
      }
    }
    dingshiC143();

  }

  tongsongdianji(int? tuisongid) {
    String payload = "";
    twLooog("====tongsongdianji==tzid:$tuisongid==");
    if (tuisongid == gudingC143) {
      payload = "fix";
    } else if (tuisongid == jianchaNotiC143) {
      payload = "sign";
    } else if (tuisongid == answerNotiC143) {
      payload = "quiz";
    } else if (tuisongid == zhifuNotifiC143) {
      payload = "paypel";
    } else {
      payload = "fix";
    }
    payload = "time_sensitive";
    // SSEventReporttttt.all_noti_c(source_from: payload);
  }

  Future<bool> requestNotificationPermissionC143() async {
    final statusC143 = await Permission.notification.status;

    if (statusC143.isGranted) {
      // 已授权
      return true;
    }

    if (statusC143.isPermanentlyDenied) {
      // iOS：用户点过“不允许”
      // Android：拒绝并勾选“不再询问”
      return false;
    }

    // 第一次请求（主要针对 Android / iOS 首次）
    bool result = true;
    PermissionStatus permissionStatus = await Permission.notification.request();
    result = permissionStatus == PermissionStatus.granted;
    twLooog("==requestNotificationPermission=result:$result");
    return result;
  }

  String pushIcon = "tzimg1";

  DarwinNotificationDetails notificationDetails2C143() {
    return DarwinNotificationDetails(
      // B. 中断级别：时效性 (穿透专注模式)
      interruptionLevel: InterruptionLevel.timeSensitive,
      // badgeNumber: 1,

      // E. 确保前台也能展示
      presentAlert: true,
      presentSound: true,
      presentBanner: true,
    );
  }

  Future<void> dingshiC143() async {
    twLooog("==initNotification=_repeatNotification=");
    int length = contentsC143.length;
    contentsC143.shuffle();
    int random = Random().nextInt(length);
    String baiotiC143 = "TreeWorld";
    String baiotiAC143 = "TreeWorld";
    String contentAC143 = "Come join the quiz!";
    String neirongC143 = contentsC143[0]['content'];
    String neirong1C143 = contentsC143[1]['content'];
    String neirong2C143 = contentsC143[2]['content'];
    String neirong3C143 = contentsC143[3]['content'];
    _pluginC143.periodicallyShowWithDuration(
      gudingC143,
      TwPackageAB.isPackageB() ? baiotiC143 : baiotiAC143,
      TwPackageAB.isPackageB() ? neirongC143 : contentAC143,
      notificationDetails: notificationDetails2C143(),
      TwConfigggg.hasDeeevv() ? Duration(minutes: 1) : Duration(minutes: 25),
    );

    _pluginC143.periodicallyShowWithDuration(
      answerNotiC143,
      TwPackageAB.isPackageB() ? baiotiC143 : baiotiAC143,
      TwPackageAB.isPackageB() ? neirong1C143 : contentAC143,
      notificationDetails: notificationDetails2C143(),
      TwConfigggg.hasDeeevv() ? Duration(minutes: 2) : Duration(minutes: 40),
    );
    _pluginC143.periodicallyShowWithDuration(
      jianchaNotiC143,
      TwPackageAB.isPackageB() ? baiotiC143 : baiotiAC143,
      TwPackageAB.isPackageB() ? neirong2C143 : contentAC143,
      notificationDetails: notificationDetails2C143(),
      TwConfigggg.hasDeeevv() ? Duration(minutes: 3) : Duration(minutes: 60),
    );

    _pluginC143.periodicallyShowWithDuration(
      zhifuNotifiC143,
      TwPackageAB.isPackageB() ? baiotiC143 : baiotiAC143,
      TwPackageAB.isPackageB() ? neirong3C143 : contentAC143,
      notificationDetails: notificationDetails2C143(),
      TwConfigggg.hasDeeevv() ? Duration(minutes: 4) : Duration(minutes: 80),
    );
  }





  Future<bool> checkNotificationPermission() async {
    bool result = await Permission.notification.isGranted;
    twLooog("==requestNotificationPermission=result:$result");
    return result;
  }
}
