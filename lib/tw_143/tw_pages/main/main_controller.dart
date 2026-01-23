import 'package:c143/tw_143/tw_common/event.dart';
import 'package:c143/tw_143/tw_common/overlay/overlay_get_sun.dart';
import 'package:c143/tw_143/tw_common/overlay/overlay_hongbaoyu.dart';
import 'package:c143/tw_143/tw_pages/guide/guide0_bguide.dart';
import 'package:c143/tw_143/tw_pages/guide/guide11_homebonus.dart';
import 'package:c143/tw_143/tw_pages/guide/guide14_highligth.dart';
import 'package:c143/tw_143/tw_pages/guide/guide15_coin_to_sun.dart';
import 'package:c143/tw_143/tw_pages/guide/guide16_highligthend.dart';
import 'package:c143/tw_143/tw_pages/guide/guide1_water.dart';
import 'package:c143/tw_143/tw_pages/guide/guide3b_trust.dart';
import 'package:c143/tw_143/tw_pages/guide/guide7_rank.dart';
import 'package:c143/tw_143/tw_pages/guide/guide8_quiz1.dart';
import 'package:c143/tw_143/tw_pages/guide/guide9_quiz2.dart';
import 'package:c143/tw_143/tw_pages/guide/guide_old.dart';
import 'package:c143/tw_143/tw_pages/guide/guide_test_animated.dart';
import 'package:c143/tw_143/tw_pages/main_cash/main_cash_controller.dart';
import 'package:c143/tw_143/tw_pages/main_cash/overlayc143/card_input.dart';
import 'package:c143/tw_143/tw_pages/main_cash/overlayc143/overlay_tx_step.dart';
import 'package:c143/tw_143/tw_pages/main_spin/views/overlay_win_reward.dart';
import 'package:c143/tw_143/tw_pages/main_tree/main_tree_controller.dart';
import 'package:c143/tw_base/tw_ad/guiyin/package.dart';
import 'package:c143/tw_base/tw_gj/android_h5.dart';
import 'package:c143/tw_base/tw_gj/event_busC143.dart';
import 'package:c143/tw_base/tw_gj/vibration.dart';
import 'package:c143/tw_base/tw_http/event_report.dart';
import 'package:c143/tw_notification/overlay_notify.dart';
import 'package:get/get.dart';
import 'package:vibration/vibration.dart';

class MainController extends GetxController {
  static MainController get to => Get.find();
  final curMainNavIndex = 0.obs;
  static const int treeIndex = 0;
  static const int quizIndex = 1;
  static const int spinindexxx = 2;
  static const int cashIndex = 3;

  resetIndex(int index) async {
    // throw Exception();
    // VibrationC143.vibrationClick();
    MainCashController.overlayPortalController.hide();
    int curSelect = curMainNavIndex.value;
    if (curSelect == index) {
      return;
    }
    curMainNavIndex.value = index;
    if (index == cashIndex) {
      TwMaiDiannnn.cash_page_view(
        MainTreeController.to.curMoneyyyy.value.toStringAsFixed(2),
      );
    } else if (index == quizIndex) {
      TwMaiDiannnn.quiz_start();
    } else if (index == spinindexxx) {
      TwMaiDiannnn.spin_view();
      TwEventBusC143.fire(SpinEvent());
    } else if (index == treeIndex) {
      TwMaiDiannnn.home_view(MainTreeController.to.curLevel.value.toString());
      String? data = MainTreeController.to.guideIndexData();

      if (data == MainTreeController.guide10) {
        OverlayGuide11HomeBonus().show(
          coins: TwPackageABC143.isPackageB() ? 5 : 10,
        );
      }

      MainTreeController.to.resetCoin();
    }
  }
}
