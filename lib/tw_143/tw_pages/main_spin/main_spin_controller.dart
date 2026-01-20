import 'package:c143/tw_143/tw_common/overlay/overlay_get.dart';
import 'package:c143/tw_143/tw_pages/main_tree/main_tree_controller.dart';
import 'package:c143/tw_base/tw_ad/guiyin/package.dart';
import 'package:c143/tw_base/tw_configgg/config.dart';
import 'package:c143/tw_base/tw_gj/logC143.dart';
import 'package:c143/tw_base/tw_gj/login_trackC143.dart';
import 'package:c143/tw_hive/twhiveC143.dart';
import 'package:get/get.dart';

enum TwEnumBtnClickStatus {
  wait("wait"),
  waitClick("waitClick"),
  end("end");

  final String name;

  const TwEnumBtnClickStatus(this.name);
}

class MainSpinController extends GetxController {
  static MainSpinController get to => Get.find();

  static int get initSpinNum => TwPackageABC143.isPackageB() ? 3 : 3;

  static String get twkeySpinNum =>
      TwPackageABC143.isPackageB() ? "asfsafas655656Bbb" : "asfsafas655656Aaa";

  static String get twkeyClickDailyCheck =>
      TwPackageABC143.isPackageB() ? "fg646456ghjyh" : "fg646456ghjyhAaaa";

  static String get twkeywinbig =>
      TwPackageABC143.isPackageB() ? "twkeywinbig" : "twkeywinbigAaaa";
  var box = TwHive.box;

  var curTwSpinNum = 0.obs;

  var curClickDailyCheck = false.obs;
  var curWinbigCount = 3.obs;

  var curClickDailyCheckB = TwEnumBtnClickStatus.wait.name.obs;
  var curEveryDayLookAdCountB = TwEnumBtnClickStatus.wait.name.obs;
  var curEveryDayCollectSunB = TwEnumBtnClickStatus.wait.name.obs;
  var curEveryDaySpinB = 0.obs;
  var curEveryMoneyRainB = 0.obs;
  var curTreeLevel = TwEnumBtnClickStatus.wait.name.obs;
  var curWaterCount = TwEnumBtnClickStatus.wait.name.obs;
  var curFertilizeCount = TwEnumBtnClickStatus.wait.name.obs;
  var curLianxuLoginCount = TwEnumBtnClickStatus.wait.name.obs;

  static String get twkeycurClickDailyCheckB => "twkeyClickDailyCheckB111";

  static String get twkeycurEveryDayLookAdCountB =>
      "curEveryDayLookAdCountB5644aa";

  static String get twkeycurEveryDayCollectSunB =>
      "curEveryDayCollectSunB5644aa";

  static String get twkeycurEveryDaySpinB => "curEveryDaySpinB5644aa";

  static String get twkeycurEveryMoneyRainB => "curEveryMoneyRainB5644aa";

  static String get twkeycurTreeLevel => "curTreeLevel5644aa";

  static String get twkeycurWaterCount => "curWaterCount5644aa";

  static String get twkeycurFertilizeCount => "curFertilizeCount5644aa";

  static String get twkeycurLianxuLoginCount => "curLianxuLoginCount5644aa";

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    bool tmpClickDailyCheck = box.get(twkeyClickDailyCheck) ?? false;

    int tmpSpinNum = box.get(twkeySpinNum) ?? initSpinNum;
    if (TwLoginnnTrackC143.isFirstLoginToday) {
      if (tmpSpinNum < initSpinNum) {
        tmpSpinNum = initSpinNum;
      }
      tmpClickDailyCheck = false;
    }
    // if(TwConfigggg.hasDeeevv()){
    //   tmpSpinNum = 30;
    // }
    curTwSpinNum = tmpSpinNum.obs;
    curClickDailyCheck = tmpClickDailyCheck.obs;

    initTask();
  }

  initTask() {
    String tmptwkeycurClickDailyCheckB =
        box.get(twkeycurClickDailyCheckB) ??
        TwEnumBtnClickStatus.waitClick.name;
    String tmptwkeycurEveryDayLookAdCountB =
        box.get(twkeycurEveryDayLookAdCountB) ?? TwEnumBtnClickStatus.wait.name;
    String tmptwkeycurEveryDayCollectSunB =
        box.get(twkeycurEveryDayCollectSunB) ?? TwEnumBtnClickStatus.wait.name;

    int tmptwkeycurEveryDaySpinB = box.get(twkeycurEveryDaySpinB) ?? 0;
    int tmptwkeycurEveryMoneyRainB = box.get(twkeycurEveryMoneyRainB) ?? 0;
    String tmptwkeycurTreeLevel =
        box.get(twkeycurTreeLevel) ?? TwEnumBtnClickStatus.wait.name;
    String tmptwkeycurWaterCount =
        box.get(twkeycurWaterCount) ?? TwEnumBtnClickStatus.wait.name;
    String tmptwkeycurFertilizeCount =
        box.get(twkeycurFertilizeCount) ?? TwEnumBtnClickStatus.wait.name;
    String tmptwkeycurLianxuLoginCount =
        box.get(twkeycurLianxuLoginCount) ?? TwEnumBtnClickStatus.wait.name;

    if (TwLoginnnTrackC143.isFirstLoginToday) {
      tmptwkeycurClickDailyCheckB = TwEnumBtnClickStatus.waitClick.name;
      tmptwkeycurEveryDayLookAdCountB = TwEnumBtnClickStatus.wait.name;
      tmptwkeycurEveryDayCollectSunB = TwEnumBtnClickStatus.wait.name;

      tmptwkeycurEveryDaySpinB = 0;
      tmptwkeycurEveryMoneyRainB = 0;
    }

    curClickDailyCheckB = tmptwkeycurClickDailyCheckB.obs;
    curEveryDayLookAdCountB = tmptwkeycurEveryDayLookAdCountB.obs;
    curEveryDayCollectSunB = tmptwkeycurEveryDayCollectSunB.obs;

    curEveryDaySpinB = tmptwkeycurEveryDaySpinB.obs;

    curEveryMoneyRainB = tmptwkeycurEveryMoneyRainB.obs;

    if (tmptwkeycurTreeLevel == TwEnumBtnClickStatus.wait.name) {
      int curLevel = MainTreeController.to.curLevel.value;
      if (curLevel >= 5) {
        tmptwkeycurTreeLevel = TwEnumBtnClickStatus.waitClick.name;
      }
    }

    curTreeLevel = tmptwkeycurTreeLevel.obs;
    curWaterCount = tmptwkeycurWaterCount.obs;
    curFertilizeCount = tmptwkeycurFertilizeCount.obs;
    curLianxuLoginCount = tmptwkeycurLianxuLoginCount.obs;
  }

  onDailyCheckB() {
    var tmpcurClickDailyCheckB = curClickDailyCheckB.value;
    if (tmpcurClickDailyCheckB == TwEnumBtnClickStatus.waitClick.name) {
      String name = TwEnumBtnClickStatus.end.name;
      box.put(twkeycurClickDailyCheckB, name);
      curClickDailyCheckB.value = name;

      _onAddMoney(10);
    }
  }

  onUnlockTreeLevel5() {
    var tmpcurClickDailyCheckB = curTreeLevel.value;
    if (tmpcurClickDailyCheckB == TwEnumBtnClickStatus.waitClick.name) {
      String name = TwEnumBtnClickStatus.end.name;
      box.put(twkeycurTreeLevel, name);
      curTreeLevel.value = name;
      _onAddMoney(100);

    }
  }

  _onAddMoney(double _coins){
    bool showSun = MainTreeController.to.showMoneyStatusSunIcon();
    bool showFlower = MainTreeController.to.showMoneyStatusFlowerIcon();
    if(showSun){
      _coins = _coins/MainTreeController.stageBeisuNum;
    }else if(showFlower){
      _coins = _coins/MainTreeController.stageBeisu2Num;
    }
    MainTreeController.to.onAddMoneyyyy(_coins);
  }

  onSpinCount() {
    int count = -1;
    curEveryDaySpinB.value = count;
    box.put(twkeycurEveryDaySpinB, count);
    _onAddMoney(10);
  }

  onCashRainClaim() {
    int count = -1;
    curEveryMoneyRainB.value = count;
    box.put(twkeycurEveryMoneyRainB, count);
    _onAddMoney(10);
  }

  onCashRainCount() {
    int tmpcurEveryDaySpinB = curEveryMoneyRainB.value;
    int tmp2 = tmpcurEveryDaySpinB + 1;
    curEveryMoneyRainB.value = tmp2;
    box.put(twkeycurEveryMoneyRainB, tmp2);
    twLooog("==onCashRain:$tmp2====");
  }

  _onAddSpinCount() {
    int tmpcurEveryDaySpinB = curEveryDaySpinB.value;
    int tmp2 = tmpcurEveryDaySpinB + 1;
    curEveryDaySpinB.value = tmp2;
    box.put(twkeycurEveryDaySpinB, tmp2);
    twLooog("==_onAddSpinCount:$tmp2====");
  }

  subWinbigCount() {
    int curN = curWinbigCount.value;

    int tmpCurNnnn = curN - 1;
    if (tmpCurNnnn <= 0) {
      tmpCurNnnn = 0;
    }
    curWinbigCount.value = tmpCurNnnn;
  }

  resetWinbigCount() {
    curWinbigCount.value = 3;
  }

  bool hasClickWinBigFirst() {
    return box.get(twkeywinbig) ?? false;
  }

  saveClickWinBigFirst() {
    box.put(twkeywinbig, true);
  }

  clickDailyCheck(double coins) {
    OverlayGetCoins().show(
      coins: coins,
      onBtn: () {},
      onClose: () {},
      type: TwEnumGetCoinsType.wheelMoney,
    );
    curClickDailyCheck.value = true;
    box.put(twkeyClickDailyCheck, true);
  }

  subSpinNum() {
    int tmpSpinNum = curTwSpinNum.value;

    int tmpSpinNum2 = tmpSpinNum - 1;
    if (tmpSpinNum2 <= 0) {
      tmpSpinNum2 = 0;
    } else {
      _onAddSpinCount();
    }

    curTwSpinNum.value = tmpSpinNum2;
    box.put(twkeySpinNum, tmpSpinNum2);
  }

  addSpinNum() {
    int tmpSpinNum = curTwSpinNum.value;

    int tmpSpinNum2 = tmpSpinNum + 1;
    if (tmpSpinNum2 <= 0) {
      tmpSpinNum2 = 0;
    }

    curTwSpinNum.value = tmpSpinNum2;
    box.put(twkeySpinNum, tmpSpinNum2);
  }
}
