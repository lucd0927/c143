import 'package:c143/tw_143/tw_pages/guide/guide11_homebonus.dart';
import 'package:c143/tw_143/tw_pages/guide/guide14_highligth.dart';
import 'package:c143/tw_143/tw_pages/guide/guide15_coin_to_sun.dart';
import 'package:c143/tw_143/tw_pages/guide/guide16_highligthend.dart';
import 'package:c143/tw_143/tw_pages/guide/guide1_water.dart';
import 'package:c143/tw_143/tw_pages/guide/guide7_rank.dart';
import 'package:c143/tw_143/tw_pages/guide/guide8_quiz1.dart';
import 'package:c143/tw_143/tw_pages/guide/guide9_quiz2.dart';
import 'package:c143/tw_143/tw_pages/guide/guide_test_animated.dart';
import 'package:c143/tw_143/tw_pages/main_tree/main_tree_controller.dart';
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

    // OverlayGuide11HomeBonus().show();

    // bool result =MainTreeController.to.overlayPortalController.isShowing;
    // if(result){
    //   MainTreeController.to.overlayPortalController.hide();
    // }else{
    //   MainTreeController.to.overlayPortalController.show();
    // }
    // OverlayGuide14HighLight().show();
    // OverlayGuide15CoinToSun().show();
    // OverlayGuide16HighLightEnd().show();

    if (index == cashIndex) {

    } else if (index == quizIndex) {

    } else if (index == wheelIndex) {

    }else if (index == treeIndex) {
      // OverlayGuide7Rank().show();
    }
  }
}