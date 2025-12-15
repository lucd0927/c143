import 'dart:math';

import 'package:c143/gen/assets.gen.dart';
import 'package:c143/tw_base/tw_ad/guiyin/package.dart';
import 'package:c143/tw_base/tw_gj/loggggg.dart';
import 'package:c143/tw_hive/twhive.dart';
import 'package:get/get.dart';

class MainTreeController extends GetxController {
  static MainTreeController get to => Get.find();

  static const double maxCoinNum = 5000;
  var box = TwHive.box;

  // current money
  var curMoneyyyy = (0.0).obs;

  // current level
  var curLevel = 1.obs;

  var curWaterCount = 0.obs;
  var curShifeiCount = 0.obs;

  static String get twKeyMoneyyyy =>
      TwPackageAB.isPackageB() ? "twKeyMoneyyyyBbbb" : "twKeyMoneyyyy";

  static String get twKeyLevelll =>
      TwPackageAB.isPackageB() ? "twKeyLevelllbbbb" : "twKeyLevelll";

  static String get twKeyWaterCount =>
      TwPackageAB.isPackageB() ? "twKeyWaterCountBbbb" : "twKeyWaterCount";

  static String get twKeyShifeiCount =>
      TwPackageAB.isPackageB() ? "twKeyShifeiCountBbbb" : "twKeyShifeiCount";

  static const List<int> waterCounts = [1, 20, 60];
  static const List<int> shifeiCounts = [1, 5, 15];

  String treeIcon(){
    String tmpTreeIcon = Assets.twimg.mainTree1.path;
    int curLevvvv = curLevel.value;
    if(curLevvvv == 1){
      tmpTreeIcon = Assets.twimg.mainTree1.path;
    }else if(curLevvvv == 2){
      tmpTreeIcon = Assets.twimg.mainTree2.path;
    }else if(curLevvvv == 3){
      tmpTreeIcon = Assets.twimg.mainTree3.path;
    }else if(curLevvvv == 4){
      tmpTreeIcon = Assets.twimg.mainTree4.path;
    }else if(curLevvvv >= 5){
      tmpTreeIcon = Assets.twimg.mainTree5.path;
    }

    return tmpTreeIcon;
  }

  double curLevelProgress() {
    double progress = 0;
    int curLevellll = _jisuanLevel();
    int tmpCurWaterCount = curWaterCount.value;
    int tmpCurShifeiCount = curShifeiCount.value;

    if (curLevellll == 1) {
      progress = 0;
    } else if (curLevellll == 2) {
      double waterPro = (waterCounts[0] - tmpCurWaterCount ) / waterCounts[1];
      double shifeiPro =
          (shifeiCounts[0] -tmpCurShifeiCount) / shifeiCounts[1];

      bool whichD = waterPro >= shifeiPro;
      progress = whichD ? waterPro : shifeiPro;
    } else if (curLevellll == 3) {
      double waterPro =
          (waterCounts[0] + waterCounts[1] -tmpCurWaterCount ) / waterCounts[2];
      double shifeiPro =
          (shifeiCounts[0] + shifeiCounts[1] -tmpCurShifeiCount ) /
          shifeiCounts[2];

      bool whichD = waterPro >= shifeiPro;
      progress = whichD ? waterPro : shifeiPro;
    } else if (curLevellll >= 4) {
      double waterPro =
          (tmpCurWaterCount -
              -waterCounts[0] -
              waterCounts[1] -
              waterCounts[2]) /
          waterCounts[2];
      double shifeiPro =
          (tmpCurShifeiCount -
              -shifeiCounts[0] -
              shifeiCounts[1] -
              shifeiCounts[2]) /
          shifeiCounts[2];
      bool whichD = waterPro >= shifeiPro;
      progress = whichD ? waterPro : shifeiPro;
    }
    twLooog("=======curLevellll:$curLevellll progress:$progress");
    return progress;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    double tmpMmm = box.get(twKeyMoneyyyy) ?? 0.0;
    curMoneyyyy = tmpMmm.obs;

    int tmpWaterCount = box.get(twKeyWaterCount) ?? 0;
    curWaterCount = tmpWaterCount.obs;
    int tmpShifeiCount = box.get(twKeyShifeiCount) ?? 0;
    curShifeiCount = tmpShifeiCount.obs;

    int tmpLevelll = _jisuanLevel();
    curLevel = tmpLevelll.obs;
  }

  int _jisuanLevel() {
    int tmpCurWaterCount = curWaterCount.value;

    int waterCountStage1 = waterCounts[0];
    int waterCountStage2 = waterCounts[1];
    int waterCountStage3 = waterCounts[2];
    int waterLevelStage2 = waterCountStage1 + waterCountStage2;
    int waterLevelStage3 =
        waterCountStage1 + waterCountStage2 + waterCountStage3;
    int waterLevel = 1;
    twLooog(
      "=====waterLevelStage2:$waterLevelStage2 waterLevelStage3:$waterLevelStage3 ",
    );
    if (tmpCurWaterCount == 1) {
      waterLevel = 2;
    } else if (tmpCurWaterCount > waterCountStage1 &&
        tmpCurWaterCount <= waterLevelStage2) {
      waterLevel = 3;
    } else if (tmpCurWaterCount > waterCountStage1 &&
        tmpCurWaterCount <= waterLevelStage3) {
      waterLevel = 4;
    } else if (tmpCurWaterCount > waterLevelStage3) {
      waterLevel = 5;
    }

    int tmpCurShifeiCount = curShifeiCount.value;
    int shifeiLevel = 1;
    int shifeiCountStage1 = shifeiCounts[0];
    int shifeiCountStage2 = shifeiCounts[1];
    int shifeiCountStage3 = shifeiCounts[2];

    int shifeilevelStage2 = shifeiCountStage1 + shifeiCountStage2;
    int shifeilevelStage3 =
        shifeiCountStage1 + shifeiCountStage2 + shifeiCountStage3;
    if (tmpCurShifeiCount == 1) {
      shifeiLevel = 2;
    } else if (tmpCurShifeiCount > shifeiCountStage1 &&
        tmpCurShifeiCount <= shifeilevelStage2) {
      shifeiLevel = 3;
    } else if (tmpCurShifeiCount > shifeiCountStage1 &&
        tmpCurShifeiCount <= shifeilevelStage3) {
      shifeiLevel = 4;
    } else if (tmpCurShifeiCount > shifeilevelStage3) {
      shifeiLevel = 5;
    }

    int curMax = max(waterLevel, shifeiLevel);
    twLooog(
      "=====curlevel:$curMax waterLevel:$waterLevel shifeiLevel:$shifeiLevel  tmpCurWaterCount:$tmpCurWaterCount tmpCurShifeiCount:$tmpCurShifeiCount",
    );
    return curMax;
  }

  onAddShiFeiCount() {
    int tmpCurMmm = curShifeiCount.value;

    int tmpCurmmm2 = tmpCurMmm + 1;
    box.put(twKeyShifeiCount, tmpCurmmm2);
    curShifeiCount.value = tmpCurmmm2;

    int tmpL  =_jisuanLevel();
    curLevel.value = tmpL;
  }

  onAddWaterCount() {
    int tmpCurMmm = curWaterCount.value;

    int tmpCurmmm2 = tmpCurMmm + 1;

    box.put(twKeyWaterCount, tmpCurmmm2);
    curWaterCount.value = tmpCurmmm2;
    int tmpL  =_jisuanLevel();
    curLevel.value = tmpL;
  }

  onAddMoneyyyy(double monnn) {
    double tmpCurMmm = curMoneyyyy.value;

    double tmpCurmmm2 = tmpCurMmm + monnn;

    box.put(twKeyMoneyyyy, tmpCurmmm2);
    curMoneyyyy.value = tmpCurmmm2;
  }
}
