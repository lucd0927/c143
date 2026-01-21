import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:c143/gen/assets.gen.dart';
import 'package:c143/tw_143/tw_common/lottieeee/gesture.dart';
import 'package:c143/tw_143/tw_common/view/progress.dart';
import 'package:c143/tw_143/tw_pages/guide/guide16_highligthend.dart';
import 'package:c143/tw_143/tw_pages/guide/guide1_water.dart';
import 'package:c143/tw_143/tw_pages/guide/guide4_fertilize.dart';
import 'package:c143/tw_143/tw_pages/guide/guide6_rewarddouble.dart';
import 'package:c143/tw_143/tw_pages/main_tree/main_tree_controller.dart';
import 'package:c143/tw_base/tw_gj/countryC143.dart';
import 'package:c143/tw_base/tw_gj/logC143.dart';
import 'package:c143/tw_base/tw_gj/overlay_manager.dart';
import 'package:c143/tw_views/animated_count.dart';
import 'package:c143/tw_views/animated_scale.dart';
import 'package:c143/tw_views/font_border.dart';
import 'package:c143/tw_views/font_gradient_border.dart';
import 'package:c143/tw_views/shimmer_effect.dart';
import 'package:c143/tw_views/tw_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OverlayGuide17CoinToFlower {
  OverlayEntry? _overlayEntry;

  ///是否真正显示
  bool get isShowing => _isShowing;
  bool _isShowing = false;

  void show() {
    _overlayEntry = null;
    MainTreeController.to.saveGuideIndexData(MainTreeController.guide17);
    // _overlayEntry = OverlayEntry(
    //   builder: (context) {
    //     return Material(
    //       color: Colors.transparent,
    //       child: Guide17CoinToFlower(
    //         onClose: () async {
    //           close();
    //         },
    //       ),
    //     );
    //   },
    // );
    // Overlay.of(Get.context!).insert(_overlayEntry!);

    Widget child = Material(
      color: Colors.transparent,
      child: Guide17CoinToFlower(
        onClose: () async {
          close();
        },
      ),
    );
    kHashCode = OverlayManager.show(context: Get.context!, child: child);

    _isShowing = true;
  }

  String kHashCode = "";

  void close() {
    _isShowing = false;
    _overlayEntry?.remove();
    OverlayManager.clearOverlayEntry(kHashCode);
  }
}

class Guide17CoinToFlower extends StatefulWidget {
  const Guide17CoinToFlower({super.key, required this.onClose});

  final VoidCallback onClose;

  @override
  State<Guide17CoinToFlower> createState() => _Guide17CoinToFlowerState();
}

class _Guide17CoinToFlowerState extends State<Guide17CoinToFlower> {
  int index = 0;

  bool showAnimated = false;
  Duration animD = Duration(milliseconds: 200);
  double startScale = 0.8;
  bool showNumber = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          showAnimated = true;
        });
        initTimer();
      }
    });
  }

  Timer? _timer;
  final Duration _timerD = Duration(milliseconds: 300);

  initTimer() {
    _timer?.cancel();
    _timer = Timer(_timerD, () {
      _timer?.cancel();
      if (mounted) {
        setState(() {
          showNumber = true;
        });
        // widget.onClose();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: animD,
      color: Colors.black.withValues(alpha: showAnimated ? overlayOpacity : 0),
      child: AnimatedScale(
        duration: animD,
        scale: showAnimated ? 1.0 : startScale,
        child: SizedBox(
          width: ScreenUtil().screenWidth,
          height: ScreenUtil().screenHeight,
          child: IndexedStack(
            index: index,
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 40.h),
                    // Image.asset(
                    //   Assets.twimg.guide15Txt.path,
                    //   width: 261.w,
                    //   height: 76.h,
                    // ),
                    TwTxtGraBorderC143(
                      text: "Getting Closer",
                      fontSize: 28.sp,
                      height: 1.2,
                      fontStyle: FontStyle.italic,
                    ),
                    SizedBox(height: 60.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // TwTxtGraBorderC143(text: "1 ",fontWeight: FontWeight.w900,fontSize: 80.sp,),
                        TwShiningEffect(
                          duration: Duration(milliseconds: 2000),
                          shineColor: Color(0xffffffff),
                          opacity: 1,
                          angle: -0.9,
                          topLeft: false,
                          child: Image.asset(
                            Assets.twimgB.mainFlower.path,
                            width: 120.w,
                            height: 120.h,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    AnimatedCrossFade(
                      firstChild: SizedBox(height: 50.h),
                      secondChild: Center(
                        child: Container(
                          height: 50.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TwTxtGraBorderC143(
                                text:
                                    "=${TwCountryyC143.curCountryyyySymbolC143()}${(1 / MainTreeController.stageBeisu2Num).toStringAsFixed(3)}",
                                fontWeight: FontWeight.w700,
                                fontSize: 40.sp,
                                gradient: LinearGradient(
                                  colors: [
                                    Color(0xffFFFFFF),
                                    Color(0xffFFE56F),
                                  ],
                                  end: Alignment.bottomCenter,
                                  begin: Alignment.topCenter,
                                ),
                                strokeColor: Color(0xff9D790E),
                              ),
                              SizedBox(width: 8.w),
                              Image.asset(
                                MainTreeController.to.moneyIconSmall(),
                                width: 32.w,
                                height: 32.h,
                              ),
                            ],
                          ),
                        ),
                      ),
                      crossFadeState: showNumber
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                      duration: Duration(milliseconds: 300),
                    ),

                    SizedBox(height: 120.h),
                    AnimatedCrossFade(
                      firstChild: SizedBox(height: 100.h),
                      secondChild: Center(child: btnClaim()),
                      crossFadeState: showNumber
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                      duration: Duration(milliseconds: 300),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget btnClaim() {
    return Center(
      child: GestureDetector(
        onTap: onClaim,
        child: Container(
          width: 260.h,
          height: 100.h,
          color: Colors.black.withValues(alpha: 0.0),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              Container(
                width: 260.h,
                height: 50.h,
                child: Stack(
                  children: [
                    Image.asset(
                      Assets.twimg.btnSpin.path,
                      width: 260.h,
                      height: 50.h,
                      fit: BoxFit.fill,
                    ),
                    Center(
                      child: TwTxtBorderC143(
                        text: "Get",
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w900,
                        fontColor: Color(0xffffffff),
                        foreground: Color(0xff22431B),
                      ),
                    ),
                  ],
                ),
              ),

              Positioned(
                top: 30.h,
                right: 30.w,
                // child: TwAScale(
                //   child: Image.asset(
                //     Assets.twimg.gesture.path,
                //     width: 70.w,
                //     height: 70.w,
                //   ),
                // ),
                child: TwLottieGesture(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onClaim() {
    widget.onClose();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer?.cancel();
  }
}
