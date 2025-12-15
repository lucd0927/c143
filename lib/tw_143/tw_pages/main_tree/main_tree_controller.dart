import 'package:c143/tw_hive/twhive.dart';
import 'package:get/get.dart';

class MainTreeController extends GetxController {
  static MainTreeController get to => Get.find();

  static const double maxCoinNum = 5000;
  var box = TwHive.box;
  var curMoneyyyy = (0.0).obs;

  static const String twKeyMoneyyyy = "twKeyMoneyyyy";

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    double tmpMmm = box.get(twKeyMoneyyyy) ?? 0.0;
    curMoneyyyy = tmpMmm.obs;

  }

  onAddMoneyyyy(double monnn) {
    double tmpCurMmm = curMoneyyyy.value;

    double tmpCurmmm2 = tmpCurMmm + monnn;

    box.put(twKeyMoneyyyy, tmpCurmmm2);
    curMoneyyyy.value = tmpCurmmm2;
  }
}
