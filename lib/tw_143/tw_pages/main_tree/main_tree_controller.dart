import 'dart:async';
import 'dart:math';

import 'package:c143/gen/assets.gen.dart';
import 'package:c143/tw_143/tw_common/overlay/overlay_lot_water.dart';
import 'package:c143/tw_143/tw_pages/guide/guide14_highligth.dart';
import 'package:c143/tw_143/tw_pages/guide/guide15_coin_to_sun.dart';
import 'package:c143/tw_base/tw_ad/ads_idddddC143.dart';
import 'package:c143/tw_base/tw_ad/base_ads.dart';
import 'package:c143/tw_base/tw_ad/guiyin/package.dart';
import 'package:c143/tw_base/tw_gj/logC143.dart';
import 'package:c143/tw_base/tw_gj/number_extend.dart';
import 'package:c143/tw_base/tw_gj/time_left.dart';
import 'package:c143/tw_hive/twhiveC143.dart';
import 'package:c143/tw_views/animated_fly.dart';
import 'package:c143/tw_views/pb_tushi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

enum TwEnumTreeType {
  fertilize("fertilize"),
  spin("spin"),
  coin("coin"),
  coinGuide("coinGuide"),
  sun("sun"),
  coin_rain("coin_rain"),
  water("water");

  final String name;

  const TwEnumTreeType(this.name);
}

class MainTreeController extends GetxController {
  static MainTreeController get to => Get.find();

  static double get maxCoinNum => TwPackageABC143.isPackageB() ? 1000 : 5000;

  static double get stageB1Num => 100;

  static String get twkeyGuideProgress => TwPackageABC143.isPackageB()
      ? "MainTreeController_twkeyGuideProgressBbb"
      : "MainTreeController_twkeyGuideProgress";

  static String get guide1 =>
      TwPackageABC143.isPackageB() ? "guide1Bbb" : "guide1Aaaa";

  static String get guide2 =>
      TwPackageABC143.isPackageB() ? "guide2Bbb" : "guide2Aaaa";

  static String get guide3 =>
      TwPackageABC143.isPackageB() ? "guide3Bbb" : "guide3Aaaa";

  static String get guide4 =>
      TwPackageABC143.isPackageB() ? "guide4Bbb" : "guide4Aaaa";

  static String get guide5 =>
      TwPackageABC143.isPackageB() ? "guide5Bbb" : "guide5Aaaa";

  static String get guide6 =>
      TwPackageABC143.isPackageB() ? "guide6Bbb" : "guide6Aaaa";

  static String get guide7 =>
      TwPackageABC143.isPackageB() ? "guide7Bbb" : "guide7Aaaa";

  static String get guide8 =>
      TwPackageABC143.isPackageB() ? "guide8Bbb" : "guide8Aaaa";

  static String get guide9 =>
      TwPackageABC143.isPackageB() ? "guide9Bbb" : "guide9Aaaa";

  static String get guide10 =>
      TwPackageABC143.isPackageB() ? "guide10Bbb" : "guide10Aaaa";

  static String get guide11 =>
      TwPackageABC143.isPackageB() ? "guide11Bbb" : "guide11Aaaa";

  static String get guide12 =>
      TwPackageABC143.isPackageB() ? "guide12Bbb" : "guide12Aaaa";

  static String get guide13 =>
      TwPackageABC143.isPackageB() ? "guide13Bbb" : "guide13Aaaa";

  static String get guide14 =>
      TwPackageABC143.isPackageB() ? "guide14Bbb" : "guide14Aaaa";

  static String get guide15 =>
      TwPackageABC143.isPackageB() ? "guide15Bbb" : "guide15Aaaa";

  static String get guide16 =>
      TwPackageABC143.isPackageB() ? "guide16Bbb" : "guide16Aaaa";

  String? guideIndexData() {
    String key = twkeyGuideProgress;
    var data = box.get(key);
    return data;
  }

  saveGuideIndexData(String value) {
    String key = twkeyGuideProgress;
    box.put(key, value);
  }

  OverlayPortalController overlayPortalController = OverlayPortalController();

  var box = TwHive.box;

  // current money
  var curMoneyyyy = (0.0).obs;

  // current level
  var curLevel = 1.obs;

  var curStageWaterCount = 0.obs;
  var curStageShifeiCount = 0.obs;
  var curFertilizeLeftTime = "".obs;
  var curLeftTimeCoin1 = "".obs;
  var curLeftTimeCoin2 = "".obs;
  var curLeftTimeCoin3 = "".obs;

  static String get twKeyMoneyyyy =>
      TwPackageABC143.isPackageB() ? "twKeyMoneyyyyBbbb" : "twKeyMoneyyyy";

  static String get twKeyLevelll =>
      TwPackageABC143.isPackageB() ? "twKeyLevelllbbbb" : "twKeyLevelll";

  static String get twKeyWaterCount =>
      TwPackageABC143.isPackageB() ? "twKeyWaterCountBbbb" : "twKeyWaterCount";

  static String get twKeyShifeiCount => TwPackageABC143.isPackageB()
      ? "twKeyShifeiCountBbbb"
      : "twKeyShifeiCount";

  static String get twkeyTimeLeftFertilize => TwPackageABC143.isPackageB()
      ? "sdg4545uyioy3445"
      : "sdg4545uyioy344578ew";

  static String get twkeyTimeLeftCoin1 => TwPackageABC143.isPackageB()
      ? "twkeyTimeLeftCoin1"
      : "twkeyTimeLeftCoin1Aaaa";

  static String get twkeyTimeLeftCoin2 => TwPackageABC143.isPackageB()
      ? "twkeyTimeLeftCoin2"
      : "twkeyTimeLeftCoin2Aaaa";

  static String get twkeyTimeLeftCoin3 => TwPackageABC143.isPackageB()
      ? "twkeyTimeLeftCoin3"
      : "twkeyTimeLeftCoin3Aaaa";

  static const List<int> waterCounts = [1, 20, 60, 80];
  static const List<int> shifeiCounts = [1, 5, 15, 20];
  static double get stage1Num =>  TwPackageABC143.isPackageB()?90: 1000;
  static double get stage2Num =>TwPackageABC143.isPackageB()?900: 2000;

  double leftMonn() {
    double curMonn = MainTreeController.to.curMoneyyyy.value;

    curMonn = curMonn.toAsFixedFloor(2);
    double left = MainTreeController.stageB1Num - curMonn;

    if (left <= 0) {
      left = 0;
    }

    return left;
  }

  bool showMoneyStatusSunIcon() {
    double monnn = MainTreeController.to.curMoneyyyy.value;
    double stage1 = MainTreeController.stage1Num;
    if(stage1 <= monnn && monnn <= stageB1Num){
      return true;
    }

    double stage2 = MainTreeController.stage2Num;
    bool showSun = stage2 <= monnn;
    return showSun;
  }

  //
  String treeChildrenMoneyIcon() {
    bool showSun = showMoneyStatusSunIcon();
    String tmpTreeIcon = showSun ? Assets.twimg.mainSun.path : Assets.twimg.mainCoin.path;
    if(TwPackageABC143.isPackageB()){
      tmpTreeIcon = showSun ? Assets.twimg.mainSun.path : Assets.twimgB.moneyFloating.path;
    }

    return tmpTreeIcon;
  }


  String moneyIconSmall() {
    String tmpTreeIcon = Assets.twimg.coin.path;
    if(TwPackageABC143.isPackageB()){
      tmpTreeIcon = Assets.twimgB.money.path;
    }

    return tmpTreeIcon;
  }

  EnumTwLottttieJson lottieType() {
    EnumTwLottttieJson type = EnumTwLottttieJson.coin1;
    int curLevvvv = curLevel.value;
    bool hasB = TwPackageABC143.isPackageB();
    if (curLevvvv == 1) {
      type = hasB ? EnumTwLottttieJson.monn1 : EnumTwLottttieJson.coin1;
    } else if (curLevvvv == 2) {
      type = hasB ? EnumTwLottttieJson.monn2 : EnumTwLottttieJson.coin2;
    } else if (curLevvvv == 3) {
      type = hasB ? EnumTwLottttieJson.monn3 : EnumTwLottttieJson.coin3;
    } else if (curLevvvv == 4) {
      type = hasB ? EnumTwLottttieJson.monn4 : EnumTwLottttieJson.coin4;
    } else if (curLevvvv >= 5) {
      type = hasB ? EnumTwLottttieJson.monn5 : EnumTwLottttieJson.coin5;
    }

    return type;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    double tmpMmm = box.get(twKeyMoneyyyy) ?? 0.0;
    curMoneyyyy = tmpMmm.obs;

    int tmpWaterCount = box.get(twKeyWaterCount) ?? 0;
    curStageWaterCount = tmpWaterCount.obs;
    int tmpShifeiCount = box.get(twKeyShifeiCount) ?? 0;

    curStageShifeiCount = tmpShifeiCount.obs;

    int tmpLevelll = box.get(twKeyLevelll) ?? 1;
    // int tmpLevelll = _jisuanLevel(hasResetStageCount: false);
    curLevel = tmpLevelll.obs;

    initCutdownTimer();
  }

  final TimeLeft _fertilizeLeftTime = TimeLeft(
    twkeyTimeLeft: twkeyTimeLeftFertilize,
    maxSeconds: 60 * 10,
  );
  final TimeLeft _coinLeftTime1 = TimeLeft(twkeyTimeLeft: twkeyTimeLeftCoin1);
  final TimeLeft _coinLeftTime2 = TimeLeft(twkeyTimeLeft: twkeyTimeLeftCoin2);
  final TimeLeft _coinLeftTime3 = TimeLeft(twkeyTimeLeft: twkeyTimeLeftCoin3);

  resetCoin1Time() {
    _coinLeftTime1.resetLeftTime();
  }

  resetCoin2Time() {
    _coinLeftTime2.resetLeftTime();
  }

  resetCoin3Time() {
    _coinLeftTime3.resetLeftTime();
  }

  initCutdownTimer() {
    _fertilizeLeftTime.initLeftTimer(hasFirst: true);
    _coinLeftTime1.initLeftTimer(hasFirst: true);
    _coinLeftTime2.initLeftTimer(hasFirst: true);
    _coinLeftTime3.initLeftTimer(hasFirst: true);
    // _fertilizeLeftTime.textLeftTime;
    String tmpFertilizeTime = _fertilizeLeftTime.leftTimeToHHmmss();
    String tmpcoinLeftTime1 = _coinLeftTime1.leftTimeToHHmmss();
    String tmpcoinLeftTime2 = _coinLeftTime2.leftTimeToHHmmss();
    String tmpcoinLeftTime3 = _coinLeftTime3.leftTimeToHHmmss();
    curFertilizeLeftTime = tmpFertilizeTime.obs;
    curLeftTimeCoin1 = tmpcoinLeftTime1.obs;
    curLeftTimeCoin2 = tmpcoinLeftTime2.obs;
    curLeftTimeCoin3 = tmpcoinLeftTime3.obs;
    Timer.periodic(Duration(seconds: 1), (timer) {
      String tmpFertilizeTime2 = _fertilizeLeftTime.leftTimeToHHmmss();
      // twLooog("tmpFertilizeTime2:$tmpFertilizeTime2");
      curFertilizeLeftTime.value = tmpFertilizeTime2;

      String tmp_coinLeftTime1 = _coinLeftTime1.leftTimeToHHmmss();
      curLeftTimeCoin1.value = tmp_coinLeftTime1;

      String tmp_coinLeftTime2 = _coinLeftTime2.leftTimeToHHmmss();
      curLeftTimeCoin2.value = tmp_coinLeftTime2;

      String tmp_coinLeftTime3 = _coinLeftTime3.leftTimeToHHmmss();
      curLeftTimeCoin3.value = tmp_coinLeftTime3;
    });
  }

  double curLevelProgress() {
    double progress = 0;
    int curLevellll = curLevel.value;
    int tmpCurWaterCount = curStageWaterCount.value;
    int tmpCurShifeiCount = curStageShifeiCount.value;
    int curStageAllWaterCount = 1;
    int curStageAllShifeiCount = 1;
    if (curLevellll == 1) {
      curStageAllWaterCount = waterCounts[0];
      curStageAllShifeiCount = shifeiCounts[0];
    } else if (curLevellll == 2) {
      curStageAllWaterCount = waterCounts[1];
      curStageAllShifeiCount = shifeiCounts[1];
    } else if (curLevellll == 3) {
      curStageAllWaterCount = waterCounts[2];
      curStageAllShifeiCount = shifeiCounts[2];
    } else if (curLevellll == 4) {
      curStageAllWaterCount = waterCounts[3];
      curStageAllShifeiCount = shifeiCounts[3];
    } else if (curLevellll > 4) {
      curStageAllWaterCount = waterCounts[3];
      curStageAllShifeiCount = shifeiCounts[3];
    }

    double waterPro = tmpCurWaterCount / curStageAllWaterCount;
    double shifeiPro = tmpCurShifeiCount / curStageAllShifeiCount;
    progress = max(waterPro, shifeiPro);

    // twLooog(
    //   "=====curLevelProgress==curLevellll:$curLevellll progress:$progress shifeiPro:$shifeiPro waterPro:$waterPro curStageAllWaterCount:$curStageAllWaterCount curStageAllShifeiCount:$curStageAllShifeiCount",
    // );
    if (progress <= 0) {
      progress = 0;
    } else if (progress >= 1) {
      progress = 1;
    }
    return progress;
  }

  int _jisuanLevel({bool hasResetStageCount = true}) {
    // cur level
    int tmpCurLevel = curLevel.value;

    int tmpCurWaterCount = curStageWaterCount.value;

    int waterCountStage1 = waterCounts[0];
    int waterCountStage2 = waterCounts[1];
    int waterCountStage3 = waterCounts[2];
    int waterCountStage4 = waterCounts[3];

    int nextWaterLevel = tmpCurLevel;

    if (tmpCurLevel == 1) {
      if (tmpCurWaterCount == 0) {
        nextWaterLevel = 1;
      } else if (tmpCurWaterCount >= waterCountStage1) {
        nextWaterLevel = 2;
      }
    } else if (tmpCurLevel == 2) {
      if (tmpCurWaterCount >= waterCountStage2) {
        nextWaterLevel = 3;
      }
    } else if (tmpCurLevel == 3) {
      if (tmpCurWaterCount >= waterCountStage3) {
        nextWaterLevel = 4;
      }
    } else if (tmpCurLevel == 4) {
      if (tmpCurWaterCount >= waterCountStage4) {
        nextWaterLevel = 5;
      }
    }

    int tmpCurShifeiCount = curStageShifeiCount.value;
    int nextShifeiLevel = 1;
    int shifeiCountStage1 = shifeiCounts[0];
    int shifeiCountStage2 = shifeiCounts[1];
    int shifeiCountStage3 = shifeiCounts[2];
    int shifeiCountStage4 = shifeiCounts[3];

    if (tmpCurLevel == 1) {
      if (tmpCurShifeiCount == 0) {
        nextShifeiLevel = 1;
      } else if (tmpCurShifeiCount >= shifeiCountStage1) {
        nextShifeiLevel = 2;
      }
    } else if (tmpCurLevel == 2) {
      if (tmpCurShifeiCount >= shifeiCountStage2) {
        nextShifeiLevel = 3;
      }
    } else if (tmpCurLevel == 3) {
      if (tmpCurShifeiCount >= shifeiCountStage3) {
        nextShifeiLevel = 4;
      }
    } else if (tmpCurLevel == 4) {
      if (tmpCurShifeiCount >= shifeiCountStage4) {
        nextShifeiLevel = 5;
      }
    }

    int curMax = max(nextWaterLevel, nextShifeiLevel);
    twLooog(
      "=====curlevel:$curMax waterLevel:$nextWaterLevel shifeiLevel:$nextShifeiLevel  tmpCurWaterCount:$tmpCurWaterCount tmpCurShifeiCount:$tmpCurShifeiCount",
    );
    twLooog(
      "=====hasResetStageCount:$hasResetStageCount tmpCurLevel:$tmpCurLevel nextShifeiLevel:$nextShifeiLevel",
    );

    if (hasResetStageCount && tmpCurLevel != curMax) {
      resetWaterAndShifeiCount();
      box.put(twKeyLevelll, curMax);
    }

    return curMax;
  }

  onAddShiFeiCount({required VoidCallback onEnd, bool showAd = true}) async {
    if (curFertilizeLeftTime.value.isNotEmpty) {
      twToast(text: "You can claim it after the countdown ends");
      return;
    }

    if (showAd) {
      // bool result = await TwCommonAds().showInterstitialAd(adPosId: TwAdsPosId.test);
      // if(!result){
      //   _resetTreeGrownStatus();
      //   onEnd();
      //   return;
      // }
    }

    if (canClickWater) {
      canClickWater = false;

      OverlayLotWater().show(
        onEnd: () {
          curHasWatering.value = true;
          Timer(Duration(milliseconds: 2000), () {
            if (curFertilizeLeftTime.value.isEmpty) {
              int tmpCurMmm = curStageShifeiCount.value;

              int tmpCurmmm2 = tmpCurMmm + 1;
              box.put(twKeyShifeiCount, tmpCurmmm2);
              curStageShifeiCount.value = tmpCurmmm2;

              int tmpL = _jisuanLevel();
              curLevel.value = tmpL;

              _fertilizeLeftTime.resetLeftTime();
            } else {}

            _resetTreeGrownStatus();
            onEnd();
          });
        },
      );
    }
  }

  resetWaterAndShifeiCount() {
    twLooog("====resetWaterAndShifeiCount");
    curStageShifeiCount.value = 0;
    curStageWaterCount.value = 0;
    box.put(twKeyShifeiCount, 0);
    box.put(twKeyWaterCount, 0);
  }

  var curHasWatering = false.obs;
  bool canClickWater = true;

  onAddWaterCount({required VoidCallback onEnd, bool showAd = true}) async {
    if (canClickWater) {
      canClickWater = false;
      if (showAd) {
        bool result = await TwCommonAds().showInterstitialAd(
          adPosId: TwAdsPosId.test,
        );
        if (!result) {
          _resetTreeGrownStatus();
          onEnd();
          return;
        }
      }

      OverlayLotWater().show(
        onEnd: () {
          curHasWatering.value = true;
          Timer(Duration(milliseconds: 2000), () {
            int tmpCurMmm = curStageWaterCount.value;

            int tmpCurmmm2 = tmpCurMmm + 1;

            box.put(twKeyWaterCount, tmpCurmmm2);
            curStageWaterCount.value = tmpCurmmm2;
            int tmpL = _jisuanLevel();
            curLevel.value = tmpL;
            _resetTreeGrownStatus();
            onEnd();
          });
        },
      );
    }
  }

  _resetTreeGrownStatus() {
    curHasWatering.value = false;
    canClickWater = true;
  }

  bool showStage2() {
    double monnn = MainTreeController.to.curMoneyyyy.value;
    double stage2 = MainTreeController.stage2Num;
    bool showSun = stage2 <= monnn;
    return showSun;
  }

  onAddMoneyyyy(double monnn, {VoidCallback? onEnd}) {
    overlayCoinMain.showWithSize(
      childSize: TwPackageABC143.isPackageB()
          ? Size(24.w, 24.w)
          : Size(20.w, 20.w),
      heroChild: Image.asset(
        MainTreeController.to.moneyIconSmall(),
        width: 24.w,
        height: 24.w,
        fit: BoxFit.fill,
      ),
      showTargetWidget: true,
      onEnd: () {
        _onAddMoney(monnn, onEnd: onEnd);
      },
    );
  }

  void _onAddMoney(double monnn, {required VoidCallback? onEnd}) {
    double tmpCurMmm = curMoneyyyy.value;

    double tmpCurmmm2 = tmpCurMmm + monnn;
    tmpCurmmm2 = tmpCurmmm2.toAsFixedFloor(2);
    box.put(twKeyMoneyyyy, tmpCurmmm2);
    curMoneyyyy.value = tmpCurmmm2;
    onEnd?.call();
    String? data = guideIndexData();
    twLooog("======guideIndexData:$data tmpCurmmm2:$tmpCurmmm2");
    // if (tmpCurmmm2 >= stage2Num && data == MainTreeController.guide14) {
    //   OverlayGuide15CoinToSun().show();
    // } else if (tmpCurmmm2 >= stage1Num && data == MainTreeController.guide13) {
    //   OverlayGuide14HighLight().show();
    // }
  }

  static Map<EnumTwLottttieJson, LottieComposition> _kLottie_vCompo = {};

  static LottieComposition? composition(EnumTwLottttieJson type) {
    return _kLottie_vCompo[type];
  }

  static initComposition() {
    // AssetLottie(Assets.lottiejson.bghightligth).load().then((value) {
    //   _kLottie_vCompo[EnumTwLottttieJson.bghightligth] = value;
    // });
    // AssetLottie(Assets.lottiejson.water).load().then((value) {
    //   _kLottie_vCompo[EnumTwLottttieJson.water] = value;
    // });
  }
}

enum EnumTwLottttieJson {
  water,
  coin1,
  coin2,
  coin3,
  coin4,
  coin5,
  monn1,
  monn2,
  monn3,
  monn4,
  monn5,
  gesture,
  bghightligth,
}
