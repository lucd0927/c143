import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:c143/gen/assets.gen.dart';
import 'package:c143/tw_143/tw_common/view/progress.dart';
import 'package:c143/tw_143/tw_pages/guide/guide1_water.dart';
import 'package:c143/tw_143/tw_pages/guide/guide4_fertilize.dart';
import 'package:c143/tw_143/tw_pages/guide/guide6_rewarddouble.dart';
import 'package:c143/tw_143/tw_pages/main_tree/main_tree_controller.dart';
import 'package:c143/tw_base/tw_gj/loggggg.dart';
import 'package:c143/tw_views/animated_count.dart';
import 'package:c143/tw_views/animated_scale.dart';
import 'package:c143/tw_views/font_border.dart';
import 'package:c143/tw_views/font_gradient_border.dart';
import 'package:c143/tw_views/tw_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OverlayGuide15CoinToSun {
  OverlayEntry? _overlayEntry;

  ///是否真正显示
  bool get isShowing => _isShowing;
  bool _isShowing = false;

  void show() {
    _overlayEntry = null;

    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Material(
          color: Colors.transparent,
          child: Guide15CoinToSun(
            onClose: () async {
              close();
              MainTreeController.to.saveGuideIndexData(MainTreeController.guide15);
            },
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

class Guide15CoinToSun extends StatefulWidget {
  const Guide15CoinToSun({super.key, required this.onClose});

  final VoidCallback onClose;

  @override
  State<Guide15CoinToSun> createState() => _Guide15CoinToSunState();
}

class _Guide15CoinToSunState extends State<Guide15CoinToSun> {
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
                    Image.asset(
                      Assets.twimg.guide15Txt.path,
                      width: 261.w,
                      height: 76.h,
                    ),
                    SizedBox(height: 60.h),
                    Image.asset(
                      Assets.twimg.guide15Sun.path,
                      width: 120.w,
                      height: 120.h,
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
                              TwTxtGraBorder(
                                text: "=0.01",
                                fontWeight: FontWeight.w700,
                                fontSize: 40.sp,
                                gradient: LinearGradient(
                                  colors: [Color(0xffFFFFFF), Color(0xffFFE56F)],
                                  end: Alignment.bottomCenter,
                                  begin: Alignment.topCenter,
                                ),
                                strokeColor: Color(0xff9D790E),
                              ),
                              SizedBox(width: 8.w),
                              Image.asset(
                                Assets.twimg.coin.path,
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
                      firstChild: SizedBox(height: 56.h),
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
                child: TwTxtBorder(
                  text: "Claim",
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w900,
                  fontColor: Color(0xffffffff),
                  foreground: Color(0xff22431B),
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
    widget.onClose();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer?.cancel();
  }
}
