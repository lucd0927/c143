
import 'package:c143/gen/assets.gen.dart';
import 'package:c143/sfcj/floating_particles/src/models/direction.dart';
import 'package:c143/sfcj/floating_particles/src/models/particle_config.dart';
import 'package:c143/sfcj/floating_particles/src/models/particle_type.dart';
import 'package:c143/sfcj/floating_particles/src/widgets/particle_effects_widget.dart';
import 'package:c143/tw_143/tw_pages/main/views/main_nav.dart';
import 'package:c143/tw_143/tw_pages/main_cash/main_cash.dart';
import 'package:c143/tw_143/tw_pages/main/main_controller.dart';
import 'package:c143/tw_143/tw_pages/main_quiz/main_quiz.dart';
import 'package:c143/tw_143/tw_pages/main_quiz/main_quiz_controller.dart';
import 'package:c143/tw_143/tw_pages/main_tree/main_tree.dart';
import 'package:c143/tw_143/tw_pages/main_tree/main_tree_controller.dart';
import 'package:flutter/material.dart';
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
    MainCash(),
    MainCash(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Get.put(MainController());
    Get.put(MainTreeController());
    Get.put(MainQuizController());


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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



          Container(
            color: Colors.black.withValues(alpha: 0.8),
            child: ParticleEffects(
              isEnabled: true,
              config: ParticleConfig(
                particleType: ParticleType.image,
                direction: ParticleDirection.topToBottom,
                // Already falling
                particleCount: 10,
                imagePath: Assets.twimg.quizCoinYu.path,
                minSize: 50.w,
                maxSize: 50.w,
                enableRotation: true,
                enableSizeVariation: false,
                velocityMultiplier: 2,
                animationDuration: Duration(seconds: 5),
                minOpacity: 1.0,
                maxOpacity: 1.0,
              ),
              child: Container(
                width: ScreenUtil().screenWidth,
                height: ScreenUtil().screenHeight,
                // width: 375.w,
                // height: 400.h,
                color: Colors.yellow.withValues(alpha: 0.0),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
