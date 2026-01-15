import 'package:c143/tw_143/tw_common/overlay/overlay_get.dart';
import 'package:c143/tw_base/tw_ad/guiyin/package.dart';
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

  static int get initSpinNum => TwPackageABC143.isPackageB() ? 5 : 3;

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
  var curEveryDaySpinB = TwEnumBtnClickStatus.wait.name.obs;
  var curEveryMoneyRainB = TwEnumBtnClickStatus.wait.name.obs;

  var curTreeLevel = TwEnumBtnClickStatus.wait.name.obs;
  var curWaterCount = TwEnumBtnClickStatus.wait.name.obs;
  var curFertilizeCount = TwEnumBtnClickStatus.wait.name.obs;
  var curLianxuLoginCount = TwEnumBtnClickStatus.wait.name.obs;

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
    tmpSpinNum = 30;
    curTwSpinNum = tmpSpinNum.obs;
    curClickDailyCheck = tmpClickDailyCheck.obs;
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
