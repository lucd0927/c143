import 'package:applovin_max/applovin_max.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:c143/gen/assets.gen.dart';
import 'package:c143/sfcj/floating_particles/src/models/direction.dart';
import 'package:c143/sfcj/floating_particles/src/models/particle_config.dart';
import 'package:c143/sfcj/floating_particles/src/models/particle_type.dart';
import 'package:c143/sfcj/floating_particles/src/widgets/particle_effects_widget.dart';
import 'package:c143/tw_143/tw_common/event.dart';
import 'package:c143/tw_143/tw_common/overlay/overlay_hongbaoyu.dart';
import 'package:c143/tw_143/tw_pages/main/views/main_nav.dart';
import 'package:c143/tw_143/tw_pages/main_cash/main_cash.dart';
import 'package:c143/tw_143/tw_pages/main/main_controller.dart';
import 'package:c143/tw_143/tw_pages/main_cash/main_cash_controller.dart';
import 'package:c143/tw_143/tw_pages/main_quiz/main_quiz.dart';
import 'package:c143/tw_143/tw_pages/main_quiz/main_quiz_controller.dart';
import 'package:c143/tw_143/tw_pages/main_spin/main_spin.dart';
import 'package:c143/tw_143/tw_pages/main_spin/main_spin_controller.dart';
import 'package:c143/tw_143/tw_pages/main_tree/main_tree.dart';
import 'package:c143/tw_143/tw_pages/main_tree/main_tree_controller.dart';
import 'package:c143/tw_base/tw_ad/guiyin/package.dart';
import 'package:c143/tw_base/tw_gj/audio_playC143.dart';
import 'package:c143/tw_base/tw_gj/event_busC143.dart';
import 'package:c143/tw_base/tw_gj/ios_h5.dart';
import 'package:c143/tw_base/tw_gj/logC143.dart';
import 'package:c143/tw_base/tw_gj/overlay_manager.dart';
import 'package:c143/tw_notification/ios_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_minimizer_plus/flutter_app_minimizer_plus.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TwMainPage extends StatefulWidget {
  const TwMainPage({super.key});

  @override
  State<TwMainPage> createState() => _TwMainPageState();
}

class _TwMainPageState extends State<TwMainPage> {
  List<Widget> get _mainNavs => [
    MainTree(),
    MainQuiz(),
    MainSpin(),
    MainCash(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // AppLovinMAX.showMediationDebugger();
    Get.put(MainController());
    Get.put(MainTreeController());
    Get.put(MainQuizController());
    Get.put(MainSpinController());
    Get.put(MainCashController());
    audioMusic.play(loopMode: LoopMode.single);

    initABC143();
  }

  initABC143() {
    bool hasBbbb = TwPackageABC143.isPackageB();

    TwPackageABC143().listen((packN) {
      twLooog("===TwPackageABC143==packN:$packN");
      TwIosH5C143().initH5(context);
      if (packN == TwPackageABC143.packageB) {
        OverlayManager.clearAll();
        TwEventBusC143.fire(SpinEvent());

        MainTreeController.to.resetAllData();
        MainSpinController.to.resetAllData();
        MainQuizController.to.initQuizDatusssss();

        MainTreeController.to.initGuide();
        if (mounted) {
          setState(() {});
        }
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult:(bool didPop, dynamic result){
        twLooog("=======main page didPop:$didPop");
        if(didPop){
          return;
        }
        // SystemNavigator.pop();
        // FlutterExitApp.exitApp();
        FlutterAppMinimizerPlus.minimizeApp();
      },
      child: Scaffold(
        // appBar: BaseAppBar(title: "title", leftTitle: ""),
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: 0,
              child: Obx(() {
                int curNacIndex = MainController.to.curMainNavIndex.value;

                return SafeArea(
                  bottom: false,
                  top: false,
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Expanded(
                            child: IndexedStack(
                              index: curNacIndex,
                              children: _mainNavs,
                            ),
                          ),
                          // SizedBox(height: bottomNavHeight,),
                        ],
                      ),
                      Positioned(bottom: 0, left: 0, right: 0, child: MainNav()),
                    ],
                  ),
                );
              }),
            ),

            // Center(child: ClipRRect(
            //   child: Container(
            //     width: 200,
            //     height: 300,
            //     child: Hongbaoyu(),
            //   ),
            // ),)
          ],
        ),
      ),
    );
  }
}
