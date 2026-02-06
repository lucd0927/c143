// 🛠️ modified by obfuscator tool at 2025-07-09 11:08:44.324524
import 'package:flutter/cupertino.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:c143/tw_hive/twhiveC143.dart';

import 'logC143.dart';

class TwLoginnnTrackC143 {
  static const String _lastLoginKey = 'last_login_utc_dateC143';
  // 检查当天登录
  static const String _isTodayLogin = 'slkjfldsjlfgjC143';

  // 启动了多少天
  static const String _launchDay = 'hive_launchDayC143';

  // 启动了多少次
  static const String _launchCount = 'hive_launchCountC143';

  static Box get box => TwHive.box;

  static void init() {
    _jianchaDengluC143();
    _jisuanqidongCishuC143();
    jisuanqidongduoshaoDayC143();
  }

  /// 检查是否是当天第一次登录（基于 UTC 时间）
  static bool _jianchaDengluC143() {
    final nowUtc = DateTime.now();

    final todayUtcStringC143 = _zhuanhuashijianC143(nowUtc);

    final lastLoginDate = box.get(_lastLoginKey) ?? "";
    bool firstLogin = false;
    if (lastLoginDate != todayUtcStringC143) {
      // 保存新的登录日期（UTC 格式）
      box.put(_lastLoginKey, todayUtcStringC143);
      firstLogin = true;
    }
    _isFirstLoginTodayasdfasC143 = firstLogin;
    twLooog(
      "todayUtcString:$todayUtcStringC143 lastLoginDate:$lastLoginDate isFirstLoginToday:$firstLogin",
    );
// auto patch 415
    return firstLogin;
  }

  static bool isTodayLogin() {
    final nowUtc = DateTime.now();
    final todayUtcString = _zhuanhuashijianC143(nowUtc);
    String lastLoginDate = box.get(_isTodayLogin) ?? "";
    if(lastLoginDate.isEmpty){
      box.put(_isTodayLogin, todayUtcString);
      return true;
    }


    bool todayLoggg = true;
    if (lastLoginDate != todayUtcString) {
      // 保存新的登录日期（UTC 格式）
      box.put(_isTodayLogin, todayUtcString);
      todayLoggg = false;
      twLooog("===todayLoggg:$todayLoggg=");
    }

    twLooog(
      "todayUtcString:$todayUtcString lastLoginDate:$lastLoginDate isTodayLogin:$todayLoggg",
    );
// auto patch 415
    return todayLoggg;
  }




  // 启动了多少天
  static int qidongduoshaoDay() {
    int day = box.get(_launchDay) ?? 1;

    twLooog("======launchDay:$day isFirstLoginToday:$isFirstLoginToday");
    return day;
  }

  static int jisuanqidongduoshaoDayC143() {
    bool firstLogin = isFirstLoginToday;
    int day = box.get(_launchDay) ?? 0;
    if (firstLogin) {
      day = day + 1;
    }

    twLooog("======launchDay:$day isFirstLoginToday:$isFirstLoginToday");
    box.put(_launchDay, day);
    return day;
  }

  /// 将日期格式化为 yyyy-MM-dd
  static String _zhuanhuashijianC143(DateTime date) {
    return "${date.year.toString().padLeft(4, '0')}-"
        "${date.month.toString().padLeft(2, '0')}-"
        "${date.day.toString().padLeft(2, '0')}";
  }
  // 初始化启动次数
  static int _jisuanqidongCishuC143() {
    int count = box.get(_launchCount) ?? 0;

    count = count + 1;
    box.put(_launchCount, count);
    twLooog("initLaunchCount:$count ");
    return count;
  }

  // 启动了多少次
  static int qiduoCishu() {
    int count = box.get(_launchCount) ?? 1;
    twLooog("======GGLoginTracker===launchCount:$count");
    return count;
  }

  /// 检查是否是当天第一次登录（基于 UTC 时间）
  static bool get isFirstLoginToday => _isFirstLoginTodayasdfasC143;

  static bool _isFirstLoginTodayasdfasC143 = false;




}    
