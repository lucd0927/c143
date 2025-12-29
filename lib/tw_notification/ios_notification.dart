import 'dart:math';

import 'package:c143/tw_base/tw_ad/guiyin/package.dart';
import 'package:c143/tw_base/tw_configgg/config.dart';
import 'package:c143/tw_base/tw_gj/loggggg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:permission_handler/permission_handler.dart';



const local_ios = "c132iosnotificationcount";

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

class TwNotificationIos {
  static final TwNotificationIos _instance = TwNotificationIos._();

  TwNotificationIos._();

  factory TwNotificationIos() {
    return _instance;
  }

  static bool _clickTz = false;

  static bool get clickTz => _clickTz;

  static String title = "";
  static String contentC143 = "";

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final IOSFlutterLocalNotificationsPlugin _plugin =
      IOSFlutterLocalNotificationsPlugin();

  initNotificationCount() async {
    final String payload = "local";
  }

  List get contents => [
    {"title": "", "content": " Your \$1,000 Has Arrived!"},
    {"title": "", "content": " ⚠️ \$1,000 missing"},
    {"title": "", "content": "Action Required: Finish Your Payout"},
    {"title": "", "content": "Payment Received: \$50.00"},
    {
      "title": "",
      "content": "Come back now or lose your chance to cash out \$1,000.",
    },
    {
      "title": "",
      "content":
          "We are about to cancel your pending reward. Is this a mistake? Tap to reclaim your spins.",
    },
    {"title": "", "content": "Oops? We added too many spins..."},
    {"title": "", "content": "You forgot to unwrap this"},
    {"title": "", "content": "Your daily \$1,000 payout limit is ready."},
    {"title": "", "content": "Private Room Invitation"},
  ];

  // void setTzCount(int value, SharedPreferences sp) =>
  //     sp.setInt(local_ios, value);
  //
  // int getTzCount(SharedPreferences sp) => sp.getInt(local_ios) ?? 0;

  init() async {

    await requestNotificationPermission();

    initNotificationCount();

    twLooog("=initNotification====init===");

    const InitializationSettings initSettings = InitializationSettings(
      iOS: DarwinInitializationSettings(
        // B. 中断级别：时效性 (穿透专注模式)
        // InterruptionLevel.timeSensitive,
      ),
    );

    await flutterLocalNotificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        // 点击通知回调
        twLooog("点击通知 onDidReceiveNotificationResponse: ${response.payload}");
        tongsongdianji(response.id);
      },
      onDidReceiveBackgroundNotificationResponse: backgroundNotfication,
    );
    NotificationAppLaunchDetails? notificationAppLaunchDetails = await _plugin
        .getNotificationAppLaunchDetails();
    twLooog(
      "=initNotification====getNotificationAppLaunchDetails==notificationAppLaunchDetails:$notificationAppLaunchDetails=",
    );

    if (notificationAppLaunchDetails != null) {
      NotificationResponse? notificationResponse =
          notificationAppLaunchDetails.notificationResponse;
      bool didNotificationLaunchApp =
          notificationAppLaunchDetails.didNotificationLaunchApp ?? false;
      _clickTz = didNotificationLaunchApp;
      twLooog(
        "点击通知 notificationAppLaunchDetails: didNotificationLaunchApp:${didNotificationLaunchApp} id:${notificationResponse?.id} data:${notificationResponse?.payload}",
      );
      if (didNotificationLaunchApp) {
        tongsongdianji(notificationResponse?.id);
      }
    }
    dingshi();

    fcm();
    lock();
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

  Future<bool> requestNotificationPermission() async {
    final status = await Permission.notification.status;

    if (status.isGranted) {
      // 已授权
      return true;
    }

    if (status.isPermanentlyDenied) {
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

  DarwinNotificationDetails notificationDetails2() {
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

  Future<void> dingshi() async {
    twLooog("==initNotification=_repeatNotification=");
    int length = contents.length;
    contents.shuffle();
    int random = Random().nextInt(length);
    String baioti = "TreeWorld";
    String baiotiA = "TreeWorld";
    String contentA = "Come join the quiz!";
    String neirong = contents[0]['content'];
    String neirong1 = contents[1]['content'];
    String neirong2 = contents[2]['content'];
    String neirong3 = contents[3]['content'];
    _plugin.periodicallyShowWithDuration(
      gudingC143,
      TwPackageAB.isPackageB() ? baioti : baiotiA,
      TwPackageAB.isPackageB() ? neirong : contentA,
      notificationDetails: notificationDetails2(),
      TwConfigggg.hasDeeevv() ? Duration(minutes: 1) : Duration(minutes: 25),
    );

    _plugin.periodicallyShowWithDuration(
      answerNotiC143,
      TwPackageAB.isPackageB() ? baioti : baiotiA,
      TwPackageAB.isPackageB() ? neirong1 : contentA,
      notificationDetails: notificationDetails2(),
      TwConfigggg.hasDeeevv() ? Duration(minutes: 2) : Duration(minutes: 40),
    );
    _plugin.periodicallyShowWithDuration(
      jianchaNotiC143,
      TwPackageAB.isPackageB() ? baioti : baiotiA,
      TwPackageAB.isPackageB() ? neirong2 : contentA,
      notificationDetails: notificationDetails2(),
      TwConfigggg.hasDeeevv() ? Duration(minutes: 3) : Duration(minutes: 60),
    );

    _plugin.periodicallyShowWithDuration(
      zhifuNotifiC143,
      TwPackageAB.isPackageB() ? baioti : baiotiA,
      TwPackageAB.isPackageB() ? neirong3 : contentA,
      notificationDetails: notificationDetails2(),
      TwConfigggg.hasDeeevv() ? Duration(minutes: 4) : Duration(minutes: 80),
    );
  }

  Future<void> fcm() async {}

  int unlockId = 805;

  Future<void> lock() async {}

  Future<bool> checkNotificationPermission() async {
    bool result = await Permission.notification.isGranted;
    twLooog("==requestNotificationPermission=result:$result");
    return result;
  }
}
