import 'package:c143/tw_base/tw_ad/guiyin/package.dart';
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

  static String get twKeyMoneyyyy =>
      TwPackageAB.isPackageB() ? "twKeyMoneyyyyBbbb" : "twKeyMoneyyyy";

  static String get twKeyLevelll =>
      TwPackageAB.isPackageB() ? "twKeyLevelllbbbb" : "twKeyLevelll";

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    double tmpMmm = box.get(twKeyMoneyyyy) ?? 0.0;
    curMoneyyyy = tmpMmm.obs;

    int tmpLevelll = box.get(twKeyLevelll) ?? 1;
    curLevel = tmpLevelll.obs;
  }

  onAddMoneyyyy(double monnn) {
    double tmpCurMmm = curMoneyyyy.value;

    double tmpCurmmm2 = tmpCurMmm + monnn;

    box.put(twKeyMoneyyyy, tmpCurmmm2);
    curMoneyyyy.value = tmpCurmmm2;
  }
}
