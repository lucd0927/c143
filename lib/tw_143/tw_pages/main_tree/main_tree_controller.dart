import 'dart:async';
import 'dart:math';

import 'package:c143/gen/assets.gen.dart';
import 'package:c143/tw_base/tw_ad/guiyin/package.dart';
import 'package:c143/tw_base/tw_gj/loggggg.dart';
import 'package:c143/tw_base/tw_gj/time_left.dart';
import 'package:c143/tw_hive/twhive.dart';
import 'package:c143/tw_views/pb_tushi.dart';
import 'package:get/get.dart';


enum TwEnumTreeType{
  fertilize("fertilize"),
  spin("spin"),
  coin("coin"),
  sun("sun"),
  coin_rain("coin_rain"),
  water("water");
  final String name;
  const TwEnumTreeType(this.name);
}

class MainTreeController extends GetxController {
  static MainTreeController get to => Get.find();

  static const double maxCoinNum = 5000;

  static const String twkeyGuideProgress = "MainTreeController_twkeyGuideProgress";

  var box = TwHive.box;

  // current money
  var curMoneyyyy = (0.0).obs;

  // current level
  var curLevel = 1.obs;

  var curStageWaterCount = 0.obs;
  var curStageShifeiCount = 0.obs;
  var curFertilizeLeftTime = "".obs;
  static String get twKeyMoneyyyy =>
      TwPackageAB.isPackageB() ? "twKeyMoneyyyyBbbb" : "twKeyMoneyyyy";

  static String get twKeyLevelll =>
      TwPackageAB.isPackageB() ? "twKeyLevelllbbbb" : "twKeyLevelll";

  static String get twKeyWaterCount =>
      TwPackageAB.isPackageB() ? "twKeyWaterCountBbbb" : "twKeyWaterCount";

  static String get twKeyShifeiCount =>
      TwPackageAB.isPackageB() ? "twKeyShifeiCountBbbb" : "twKeyShifeiCount";

  static String get twkeyTimeLeftFertilize =>
      TwPackageAB.isPackageB() ? "sdg4545uyioy3445" : "sdg4545uyioy344578ew";


  TimeLeft _fertilizeLeftTime = TimeLeft(twkeyTimeLeft: twkeyTimeLeftFertilize);

  static const List<int> waterCounts = [1, 20, 60, 80];
  static const List<int> shifeiCounts = [1, 5, 15, 20];

  String treeIcon() {
    String tmpTreeIcon = Assets.twimg.mainTree1.path;
    int curLevvvv = curLevel.value;
    if (curLevvvv == 1) {
      tmpTreeIcon = Assets.twimg.mainTree1.path;
    } else if (curLevvvv == 2) {
      tmpTreeIcon = Assets.twimg.mainTree2.path;
    } else if (curLevvvv == 3) {
      tmpTreeIcon = Assets.twimg.mainTree3.path;
    } else if (curLevvvv == 4) {
      tmpTreeIcon = Assets.twimg.mainTree4.path;
    } else if (curLevvvv >= 5) {
      tmpTreeIcon = Assets.twimg.mainTree5.path;
    }

    return tmpTreeIcon;
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

    int tmpLevelll = _jisuanLevel(hasResetStageCount: false);
    curLevel = tmpLevelll.obs;

    _fertilizeLeftTime.initLeftTimer(hasFirst: true);
    // _fertilizeLeftTime.textLeftTime;
    String tmpFertilizeTime = _fertilizeLeftTime.leftTimeToHHmmss();
    curFertilizeLeftTime = tmpFertilizeTime.obs;
    Timer.periodic(Duration(seconds: 1), (timer) {
      String tmpFertilizeTime2 = _fertilizeLeftTime.leftTimeToHHmmss();
      // twLooog("tmpFertilizeTime2:$tmpFertilizeTime2");
      curFertilizeLeftTime.value = tmpFertilizeTime2;
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
    }

    return curMax;
  }

  onAddShiFeiCount() {
    bool canClick = true;
    if(curFertilizeLeftTime.value.isEmpty && canClick){
      canClick = false;
      int tmpCurMmm = curStageShifeiCount.value;

      int tmpCurmmm2 = tmpCurMmm + 1;
      box.put(twKeyShifeiCount, tmpCurmmm2);
      curStageShifeiCount.value = tmpCurmmm2;

      int tmpL = _jisuanLevel();
      curLevel.value = tmpL;

      _fertilizeLeftTime.resetLeftTime();
      canClick = true;
    }else{
      twToast(text: "You can claim it after the countdown ends");
    }



  }

  resetWaterAndShifeiCount() {
    twLooog("====resetWaterAndShifeiCount");
    curStageShifeiCount.value = 0;
    curStageWaterCount.value = 0;
    box.put(twKeyShifeiCount, 0);
    box.put(twKeyWaterCount, 0);
  }

  onAddWaterCount() {
    int tmpCurMmm = curStageWaterCount.value;

    int tmpCurmmm2 = tmpCurMmm + 1;

    box.put(twKeyWaterCount, tmpCurmmm2);
    curStageWaterCount.value = tmpCurmmm2;
    int tmpL = _jisuanLevel();
    curLevel.value = tmpL;
  }

  onAddMoneyyyy(double monnn) {
    double tmpCurMmm = curMoneyyyy.value;

    double tmpCurmmm2 = tmpCurMmm + monnn;

    box.put(twKeyMoneyyyy, tmpCurmmm2);
    curMoneyyyy.value = tmpCurmmm2;
  }


  topTextChange(){

  }








}
