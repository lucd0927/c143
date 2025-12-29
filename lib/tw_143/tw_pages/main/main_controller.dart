import 'package:c143/tw_143/tw_pages/guide/guide_test_animated.dart';
import 'package:get/get.dart';


class MainController extends GetxController {
  static MainController get to => Get.find();
  final curMainNavIndex = 0.obs;
  static const int treeIndex = 0;
  static const int quizIndex = 1;
  static const int wheelIndex = 2;
  static const int cashIndex = 3;
  void resetIndex(int index) {
    curMainNavIndex.value = index;

    OverlayGuideTestAnim().show();

    if (index == cashIndex) {

    } else if (index == quizIndex) {

    } else if (index == wheelIndex) {

    }
  }
}