import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:c143/gen/assets.gen.dart';
import 'package:c143/tw_143/tw_common/lottieeee/common.dart';
import 'package:c143/tw_143/tw_pages/guide/guide1_water.dart';
import 'package:c143/tw_143/tw_pages/guide/guide7_rank.dart';
import 'package:c143/tw_143/tw_pages/guide/guide9_quiz2.dart';
import 'package:c143/tw_143/tw_pages/main_quiz/main_quiz_controller.dart';
import 'package:c143/tw_143/tw_pages/main_tree/main_tree_controller.dart';
import 'package:c143/tw_base/tw_ad/guiyin/package.dart';
import 'package:c143/tw_base/tw_gj/countryC143.dart';
import 'package:c143/tw_base/tw_gj/logC143.dart';
import 'package:c143/tw_views/animated_count.dart';
import 'package:c143/tw_views/animated_scale.dart';
import 'package:c143/tw_views/font_border.dart';
import 'package:c143/tw_views/font_gradient_border.dart';
import 'package:c143/tw_views/rotate.dart';
import 'package:c143/tw_views/shimmer_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OverlayGuide0BGuide {
  OverlayEntry? _overlayEntry;

  ///是否真正显示
  bool get isShowing => _isShowing;
  bool _isShowing = false;

  void show({required double coins, required ValueChanged onBtn}) {
    _overlayEntry = null;

    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Material(
          color: Colors.transparent,
          child: Container(
            child: Guide0BGuideWidget(
              coins: coins,
              onClose: () async {
                twLooog("=====OverlayGuideTestAnim=close");
                close();
                MainTreeController.to.onAddMoneyyyy(
                  coins,
                  onEnd: () {
                    MainTreeController.to.saveGuideIndexData(
                      MainTreeController.guide0,
                    );

                    OverlayGuide1Water().show();
                  },
                );
              },
            ),
          ),
        );
      },
    );
    Overlay.of(Get.context!).insert(_overlayEntry!);
    _isShowing = true;
  }

  void close() {
    _isShowing = false;
    _overlayEntry?.remove();
  }
}

class Guide0BGuideWidget extends StatefulWidget {
  const Guide0BGuideWidget({
    super.key,
    required this.onClose,
    required this.coins,
  });

  final VoidCallback onClose;
  final double coins;

  @override
  State<Guide0BGuideWidget> createState() => _Guide0BGuideWidgetState();
}

class _Guide0BGuideWidgetState extends State<Guide0BGuideWidget> {
  int index = 0;

  bool showAnimated = false;
  Duration animD = Duration(milliseconds: 200);
  double startScale = 0.8;

  int stepIndex = 0;

  // bool showNext1 = false;
  // bool showNext2 = false;
  // bool showNext3 = false;
  // bool showNext4 = false;
  // bool showNext5 = false;
  // bool showNext6 = false;
  // bool showNext7 = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          showAnimated = true;
        });
      }
    });
  }

  final Duration _timerD = Duration(milliseconds: 3000);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        twLooog("=====_GuideTestWidgetState=close");
        // widget.onClose();
      },
      child: AnimatedContainer(
        duration: animD,
        color: Colors.black.withValues(
          alpha: showAnimated ? overlayOpacity : 0,
        ),
        child: AnimatedScale(
          duration: animD,
          scale: showAnimated ? 1.0 : 1.0,
          child: Container(
            width: ScreenUtil().screenWidth,
            height: ScreenUtil().screenHeight,
            color: Colors.black.withValues(alpha: 0.0),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset(
                  Assets.twimgB.guide0Bg.path,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.fill,
                  gaplessPlayback: true,
                  opacity: AlwaysStoppedAnimation(0.6),
                ),
                Positioned.fill(child: stepWidget()),

                Positioned(left: 0, right: 0, bottom: 90.h, child: btnClaim()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget stepWidget() {
    Widget child = const SizedBox();
    if (stepIndex == 0) {
      child = stepWidget0();
    } else if (stepIndex == 1) {
      child = stepWidget1();
    }
    return IndexedStack(
      index: stepIndex,
      children: [
        stepWidget0(),
        stepWidget1(),
        stepWidget2(),
        stepWidget3(),

        stepWidget4(),
        stepWidget5(),
        stepWidget6(),
      ],
    );
  }

  stepWidget0() {
    return Center(child: _Guide0ScaleOverlayAnim());
  }

  Duration _duration = Duration(milliseconds: 300);

  stepWidget1() {
    Widget child = stepIndex == 1
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  Assets.twimgB.guide0Txt1.path,
                  width: 288.w,
                  height: 228.h,
                ),
              ),
              SizedBox(height: 200.h),
            ],
          )
        : SizedBox();
    return AnimatedSize(
      duration: _duration,
      alignment: Alignment.topLeft,
      child: child,
    );
  }

  stepWidget2() {
    EnumTwLottttieJson type = MainTreeController.to.lottieType();
    bool result = MainTreeController.to.curHasWatering.value;

    Widget child = stepIndex == 2
        ? Container(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  top: 200.h,
                  child: Center(
                    child: Container(
                      width: 280.h,
                      height: 280.h,
                      child: Stack(
                        children: [TwLottieCommon(type: type, animate: result)],
                      ),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 490.h),
                      Center(
                        child: Image.asset(
                          Assets.twimgB.guide0Txt2.path,
                          width: 288.w,
                          height: 128.h,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        : SizedBox();
    return AnimatedSize(
      duration: _duration,
      alignment: Alignment.topLeft,
      child: child,
    );
  }

  stepWidget3() {
    Widget child = stepIndex == 3
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  Assets.twimgB.guide0Txt3.path,
                  width: 312.w,
                  height: 240.h,
                ),
              ),
              SizedBox(height: 200.h),
            ],
          )
        : SizedBox();
    return AnimatedSize(
      duration: _duration,
      alignment: Alignment.topLeft,
      child: child,
    );
  }

  stepWidget4() {
    Widget child = stepIndex == 4
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  Assets.twimgB.guide0Txt4.path,
                  width: 308.w,
                  height: 152.h,
                ),
              ),
              SizedBox(height: 200.h),
            ],
          )
        : SizedBox();
    return AnimatedSize(
      duration: _duration,
      alignment: Alignment.topLeft,
      child: child,
    );
  }

  stepWidget5() {
    Widget child = stepIndex == 5
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200.w,
                height: 200.h,
                color: Colors.red.withValues(alpha: 0),
                child: Stack(
                  children: [
                    Center(
                      child: TwRotateWidgggggC143(
                        duration: Duration(milliseconds: 30000),
                        child: Image.asset(
                          Assets.twimg.bghightlight.path,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                    ),
                    Center(
                      child: Image.asset(
                        Assets.twimgB.guide05Gesture.path,
                        width: 100.w,
                        height: 100.h,
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Image.asset(
                  Assets.twimgB.guide0Txt5.path,
                  width: 304.w,
                  height: 128.h,
                ),
              ),
              SizedBox(height: 200.h),
            ],
          )
        : SizedBox();
    return AnimatedSize(
      duration: _duration,
      alignment: Alignment.topLeft,
      child: child,
    );
  }

  stepWidget6() {
    Widget child = stepIndex == 6
        ? Column(
            children: [
              SizedBox(height: 80.h),

              Image.asset(
                Assets.twimgB.guide0Txt6.path,
                width: 312.w,
                height: 132.h,
              ),
              // Container(
              //   height: 100.h,
              //   child: Center(
              //     child: TwTxtGraBorderC143(
              //       text: "Congrats!",
              //       gradient: LinearGradient(
              //         colors: [
              //           Color(0xffEBD462),
              //           Color(0xffFFF692),
              //           Color(0xffFFD92E),
              //         ],
              //         end: Alignment.bottomCenter,
              //         begin: Alignment.topCenter,
              //       ),
              //
              //       fontSize: 40.sp,
              //       fontWeight: FontWeight.w900,
              //     ),
              //   ),
              // ),
              SizedBox(height: 60.h),
              Center(
                child: Container(
                  width: 336.w,
                  height: 236.h,
                  child: Stack(
                    children: [
                      Image.asset(
                        Assets.twimg.guide3Centerbg.path,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.fill,
                      ),

                      Positioned.fill(
                        child: Column(
                          children: [
                            SizedBox(height: 10.h),
                            Container(
                              height: 30.h,
                              color: Colors.red.withValues(alpha: 0.0),
                              child: Center(
                                child: TwTxtBorderC143(
                                  text: "Credited To Account",
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w900,
                                  fontColor: Color(0xffffffff),
                                  foreground: Color(0xff904833),
                                ),
                              ),
                            ),
                            SizedBox(height: 24.h),
                            Image.asset(
                              Assets.twimg.guide3Ok.path,
                              width: 88.h,
                              height: 88.h,
                            ),
                            SizedBox(height: 12.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  MainTreeController.to.moneyIconSmall(),
                                  width: 32.h,
                                  height: 32.h,
                                ),
                                SizedBox(width: 8.w),
                                TwTxtGraBorderC143(
                                  text:
                                      "+${TwCountryyC143.curCountryyyySymbolC143()}${widget.coins.toStringAsFixed(0)}",
                                  fontSize: 32.sp,
                                  fontWeight: FontWeight.w900,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 60.h),
            ],
          )
        : SizedBox();
    return AnimatedSize(
      duration: _duration,
      alignment: Alignment.topLeft,
      child: child,
    );
  }

  Widget btnClaim() {
    String txt = "Earn Now";
    if (stepIndex == 0 || stepIndex == 1) {
      txt = "Earn Now";
    } else if (stepIndex == 2 || stepIndex == 5) {
      txt = "Get";
    } else if (stepIndex == 3 || stepIndex == 4) {
      txt = "Of Course";
    } else if (stepIndex == 6) {
      txt = "Claim";
    }
    return Center(
      child: GestureDetector(
        onTap: onClaim,
        child: Container(
          width: 260.h,
          height: 56.h,
          color: Colors.black.withValues(alpha: 0.0),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Image.asset(
                Assets.twimg.btnSpin.path,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
              Center(
                child: TwTxtBorderC143(
                  text: txt,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w900,
                  fontColor: Color(0xffffffff),
                  foreground: Color(0xff22431B),
                  strokeWidth: 4.w,
                ),
              ),
              // Positioned(
              //   top: -10.h,
              //   left: -5.h,
              //   child: Image.asset(
              //     Assets.twimg.ad.path,
              //     width: 28.h,
              //     height: 28.h,
              //   ),
              // ),

              // Positioned(
              //   top: -0.h,
              //   right: -5.h,
              //   child: Container(
              //     padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 4.h),
              //     decoration: BoxDecoration(
              //       gradient: LinearGradient(
              //         colors: [Color(0xffFF5151), Color(0xffCC0909)],
              //         begin: Alignment.topCenter,
              //         end: Alignment.bottomCenter,
              //       ),
              //       borderRadius: BorderRadius.circular(100),
              //     ),
              //     child: Text(
              //       "3 Change Left",
              //       style: TextStyle(
              //         fontSize: 10.sp,
              //         fontWeight: FontWeight.w700,
              //         color: Color(0xffFFD059),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  void onClaim() {
    // widget.onClose();
    if (mounted) {
      setState(() {
        if (stepIndex == 0) {
          stepIndex = 1;
        } else if (stepIndex == 1) {
          stepIndex = 2;
        } else if (stepIndex == 2) {
          stepIndex = 3;
        } else if (stepIndex == 3) {
          stepIndex = 4;
        } else if (stepIndex == 4) {
          stepIndex = 5;
        } else if (stepIndex == 5) {
          // widget.onClose();
          stepIndex = 6;
        } else if (stepIndex == 6) {
          widget.onClose();
        } else if (stepIndex == 7) {
          // stepIndex = -1;
        }
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}

class _Guide0ScaleOverlayAnim extends StatefulWidget {
  const _Guide0ScaleOverlayAnim({super.key});

  @override
  State<_Guide0ScaleOverlayAnim> createState() =>
      _Guide0ScaleOverlayAnimState();
}

class _Guide0ScaleOverlayAnimState extends State<_Guide0ScaleOverlayAnim>
    with SingleTickerProviderStateMixin {
  static double containerHeight = 360.w;

  late AnimationController _controller;
  late Animation<double> heightAnim;
  late Animation<double> slideAnim;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    // 底图：先执行
    heightAnim = Tween<double>(begin: 0, end: containerHeight * 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOutCubic),
      ),
    );

    // 上下叠图：后执行
    slideAnim = Tween<double>(begin: -360.w, end: 0.w).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.6, 1.0, curve: Curves.easeInOut),
      ),
    );

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    double height = 136.h;
    return SizedBox(
      width: 360.w,
      height: height,
      child: FittedBox(
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            // 底图
            AnimatedBuilder(
              animation: heightAnim,
              builder: (_, __) {
                return Transform.translate(
                  offset: Offset(slideAnim.value, 0),
                  child: Container(
                    width: 360.w,
                    height: height,
                    child: Stack(
                      children: [
                        TwShiningEffect(
                          duration: Duration(milliseconds: 2000),
                          shineColor: Color(0xffffffff),
                          opacity: 0.6,
                          angle: -0.1,
                          topLeft: false,
                          child: Image.asset(
                            Assets.twimgB.animatedBg31.path,

                            width: 360.w,
                            height: height,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Text(
                              TwPackageABC143.isPackageB()
                                  ? "Your Attention = Cash"
                                  : "Your Attention = Coins",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w900,
                                color: Color(0xffffffff),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

            // 上图
            AnimatedBuilder(
              animation: _controller,
              builder: (_, __) {
                final h = heightAnim.value / 2;
                return Positioned(
                  top: -14.h,
                  child: Transform.translate(
                    offset: Offset(-slideAnim.value, 0),
                    child: Container(
                      color: Colors.white.withValues(alpha: 0),
                      child: Image.asset(
                        Assets.twimgB.animatedBg32.path,
                        width: 360.w,
                        height: 28.h,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                );
              },
            ),

            // 下图
            AnimatedBuilder(
              animation: _controller,
              builder: (_, __) {
                final h = heightAnim.value / 2;
                return Positioned(
                  bottom: -14.h,
                  child: Transform.translate(
                    offset: Offset(-slideAnim.value, 0),
                    child: Image.asset(
                      Assets.twimgB.animatedBg33.path,
                      width: 360.w,
                      height: 28.h,
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
}
