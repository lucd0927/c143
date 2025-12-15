
import 'package:get/get.dart';
import 'package:c143/tw_base/tw_ad/dialooooo/ad_limit.dart';
import 'package:c143/tw_base/tw_gj/login_trackkkk.dart';
import 'package:c143/tw_base/tw_gj/loggggg.dart';
import 'package:c143/tw_hive/twhive.dart';


import 'fengkkkong.dart';

class TwFengkAds {
  static final TwFengkAds _instance = TwFengkAds._();

  factory TwFengkAds() {
    return _instance;
  }

  TwFengkAds._(){
    initCount();
  }

  var box = TwHive.box;

  String kLookAdCount = "kLookAdCount";

  // 观看广告次数
  int get lookAdCount {
    int count = box.get(kLookAdCount) ?? 0;

    return count;
  }

  String kLookAdRvCount = "kLookAdRvCount";

  int get lookAdRvCount {
    int count = box.get(kLookAdRvCount) ?? 0;
    return count;
  }

  // rv 两次调用时间
  int millRewordShow = -1;

  // rv 两次调用时间 记录次数
  int dangerRewordCountShow = 0;

  //RV 从播放到收到关闭回调时间
  int millRewordClose = -1;

  //RV 从播放到收到关闭回调时间 记录次数
  int dangerRewordCountClose = 0;

  // 记录是否触发危险
  bool hasDanger = false;

  initCount() {
    twLooog("==FKAds===initCount===");
    if (TwLoginnnTrackkkk.isFirstLoginToday) {
      int count = 0;
      box.put(kLookAdCount, count);
      box.put(kLookAdRvCount, count);
    }
  }

  bool showDangerWidthInter() {
    bool fkDanger = TwFengk.hasDanger;
    twLooog("插屏==风控======fkDanger=$fkDanger=hasDanger:$hasDanger");
    if (hasDanger || fkDanger) {
      return true;
    }
    bool result = TwFengk.needUibehavior();
    twLooog("插屏==风控==showDangerWidthInter=needUibehavior==需要检测:$result");
    if (!result) {
      return false;
    }
    bool ad_daily_show_danger = ad_daily_show();
    twLooog("插屏==风控======ad_daily_show:$ad_daily_show_danger");
    if (ad_daily_show_danger) {
      return true;
    }
    // 现金金额达到提现门槛,视频数少于n次
    bool wrong_deem_ad_less_danger = wrong_deem_ad_less();
    twLooog("激励==风控======wrong_deem_ad_less====:$wrong_deem_ad_less_danger");
    if (wrong_deem_ad_less_danger) {
      return true;
    }
    return false;
  }

  // 返回激励广告是否被封控
  bool showDangerWidthRv() {
    // 是否被封控
    bool fkDanger = TwFengk.hasDanger;
    twLooog("激励==风控======fkDanger=$fkDanger=hasDanger:$hasDanger");
    if (hasDanger || fkDanger) {
      return true;
    }

    bool result = TwFengk.needUibehavior();
    twLooog("激励==风控======needUibehavior==需要检测:$result");
    if (!result) {
      return false;
    }

    // 每日广告观看数上限
    bool ad_daily_show_danger = ad_daily_show();
    twLooog("激励==风控======ad_daily_show:$ad_daily_show_danger");
    if (ad_daily_show_danger) {
      return true;
    }
    int curTime = DateTime.now().millisecondsSinceEpoch;
    if (millRewordClose < 0) {
      millRewordClose = curTime;
    }
    // 现金金额达到提现门槛,视频数少于n次

    bool wrong_deem_ad_less_danger = wrong_deem_ad_less();
    twLooog("激励==风控======wrong_deem_ad_less====:$wrong_deem_ad_less_danger");
    if (wrong_deem_ad_less_danger) {
      return true;
    }

    //  用户观看90次RV(不包含插屏)，未到提现门槛
    bool ad_more_danger = wrong_deem_ad_more();
    twLooog("激励==风控======wrong_deem_ad_more====ad_more_danger:$ad_more_danger");
    if (ad_more_danger) {
      return true;
    }
    // // /两次rv间隔时间小于30s，3次以上
    // bool ad_short_show_danger = ad_short_show();
    // pbLog(
    //   "激励==风控======ad_short_show====ad_short_show_danger:$ad_short_show_danger",
    // );
    // if (ad_short_show_danger) {
    //   return true;
    // }
    return false;
  }

  bool ad_short_close() {
    bool result = TwFengk.needUibehavior();
    twLooog(
      "====ad_short_close=需要检测:$result  millRewordClose:$millRewordClose",
    );
    if (!result) {
      return false;
    }
    int curTime = DateTime.now().millisecondsSinceEpoch;
    if (millRewordClose < 0) {
      millRewordClose = curTime;
    } else {
      int diff = curTime - millRewordClose;
      var tuple2 = TwFengk.behavior_ad_short_close();
      int firebaseDiff = tuple2.item1 * 1000;
      twLooog(
        "====ad_short_close=需要检测:相隔多少毫秒：$diff。firebaseDiff：$firebaseDiff dangerRewordCountClose:$dangerRewordCountClose",
      );
      if (diff < firebaseDiff) {
        dangerRewordCountClose = dangerRewordCountClose + 1;
        int count = tuple2.item2;
        twLooog(
          "====ad_short_close=count:$count dangerRewordCountClose:$dangerRewordCountClose",
        );
        if (count <= dangerRewordCountClose) {
          hasDanger = true;
          TwFengk.risk_chance(value: "ad_short_close");
          return true;
        }
      }
      millRewordClose = curTime;
    }

    return false;
  }

  //  用户观看N次RV(不包含插屏)，未到提现门槛
  bool wrong_deem_ad_more() {
    bool result = TwFengk.needUibehavior();
    twLooog("===wrong_deem_ad_more==需要检测:$result");
    if (!result) {
      return false;
    }
    int count = lookAdRvCount;
    count = count + 1;
    box.put(kLookAdRvCount, count);

    int allCount = TwFengk.behavior_wrong_deem_ad_more();
    // todo:一定要改
    // bool hasInitWithdrawTask = !XianjinController.to.hasInitWithdrawTask();
    bool hasInitWithdrawTask = false;
    twLooog(
      "===wrong_deem_ad_more==allCount:$allCount  count:$count 提现门槛：$hasInitWithdrawTask",
    );
    if (allCount < count && hasInitWithdrawTask) {
      hasDanger = true;
      TwFengk.risk_chance(value: "wrong_deem_ad_more");
      return true;
    }

    return false;
  }

  bool ad_short_show() {
    bool result = TwFengk.needUibehavior();
    twLooog("=ad_short_show1====需要检测:$result millRewordShow:$millRewordShow");
    if (!result) {
      return false;
    }

    int curTime = DateTime.now().millisecondsSinceEpoch;
    if (millRewordShow < 0) {
      // dangerRewordCountShow = dangerRewordCountShow + 1;
      millRewordShow = curTime;
    } else {
      int diff = curTime - millRewordShow;
      var tuple2 = TwFengk.behavior_ad_short_show();
      int firebaseDiff = tuple2.item1 * 1000;
      twLooog("===ad_short_show2==diff:$diff  firebaseDiff:$firebaseDiff");
      if (diff < firebaseDiff) {
        dangerRewordCountShow = dangerRewordCountShow + 1;
        int count = tuple2.item2;
        twLooog(
          "===ad_short_show==dangerRewordCountShow:$dangerRewordCountShow count：$count",
        );
        if (count < dangerRewordCountShow) {
          TwFengk.risk_chance(value: "ad_short_show");
          hasDanger = true;
          return true;
        }
      }
      millRewordShow = curTime;
    }

    return false;
  }

  // 每日广告观看数上限
  bool ad_daily_show() {
    int count = lookAdCount;
    count = count + 1;
    box.put(kLookAdCount, count);

    int allCount = TwFengk.behavior_ad_daily_show();
    twLooog("==ad_daily_show=====allCount:$allCount count:$count");
    if (allCount < count) {
      if (!hasDanger) {
        TwFengk.see_you_tomorrow();
        showTomorrowDialog();
      }
      TwFengk.risk_chance(value: "ad_daily_show");

      hasDanger = true;
      return true;
    }
    return false;
  }

  String kDangerWithdrawCount = "kDangerWithdrawCount";

  int get dangerWithdrawCount {
    int count = box.get(kDangerWithdrawCount) ?? 0;
    return count;
  }

  bool wrong_deem_ad_less() {
    // todo: 一定要改
    // double curMoney = EarnController.to.curAllMoneyAZunashiAJinZhuan;
    // bool hasInitWithdrawTask = XianjinController.to.hasInitWithdrawTask();
    // double minWithdrawMoney = EarnController.minWithdrawMoney;

    double curMoney = 0;
    bool hasInitWithdrawTask = false;
    double minWithdrawMoney = 1000;

    bool result = TwFengk.needUibehavior();

    twLooog("=====wrong_deem_ad_less=需要检测:$result  curMoney:$curMoney");
    if (!result) {
      return false;
    }
    int count = dangerWithdrawCount;
    count = count + 1;
    box.put(kDangerWithdrawCount, count);
    // bool hasSaveCardId = CashController.to.hasSaveCardId();
    // double minWithdrawMoney = HomeController.to.maxMoney;
    twLooog(
      "=====wrong_deem_ad_less=minWithdrawMoney:$minWithdrawMoney curMoney：$curMoney hasInitWithdrawTask:$hasInitWithdrawTask",
    );
    if (curMoney >= minWithdrawMoney || hasInitWithdrawTask) {
      int allCount = TwFengk.behavior_wrong_deem_ad_less();
      twLooog("=====wrong_deem_ad_less=allCount:$allCount  count:$count");
      if (allCount >= count) {
        TwFengk.risk_chance(value: "wrong_deem_ad_less");
        hasDanger = true;
        return true;
      }
    }

    return false;
  }

  showTomorrowDialog() {
    //todo: 添加对话框
    // showSeeYouTomorrowDialog(onSubmit: () {}, onClose: () {});
    showAdLimitDialog(Get.context!, onBtn: (){}, onClose: () {});
  }
}
