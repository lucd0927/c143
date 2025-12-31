import 'package:c143/tw_143/tw_pages/guide/guide1_water.dart';
import 'package:c143/tw_143/tw_pages/guide/guide7_rank.dart';
import 'package:c143/tw_143/tw_pages/guide/guide8_quiz1.dart';
import 'package:c143/tw_143/tw_pages/guide/guide9_quiz2.dart';
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
    // OverlayGuide8Quiz1().show(
    //   coins: 100,
    //   onBtn: (v) {
    //   },
    // );

    // OverlayGuide9Quiz2().show(
    //   coins: 100,
    //   onBtn: (v) {
    //   },
    // );
    // OverlayGuideTestAnim().show();
    // OverlayGuide1Water().show();
    // OverlayGuide7Rank().show();
    // OverlayGuide8Quiz1().show(coins: 100);
    if (index == cashIndex) {

    } else if (index == quizIndex) {

    } else if (index == wheelIndex) {

    }else if (index == treeIndex) {
      // OverlayGuide7Rank().show();
    }
  }
}