import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:c143/gen/assets.gen.dart';
import 'package:c143/tw_143/tw_pages/guide/guide1_water.dart';
import 'package:c143/tw_143/tw_pages/guide/guide7_rank.dart';
import 'package:c143/tw_143/tw_pages/main_quiz/main_quiz_controller.dart';
import 'package:c143/tw_base/tw_gj/loggggg.dart';
import 'package:c143/tw_views/animated_count.dart';
import 'package:c143/tw_views/animated_scale.dart';
import 'package:c143/tw_views/font_border.dart';
import 'package:c143/tw_views/font_gradient_border.dart';
import 'package:c143/tw_views/shimmer_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OverlayGuide10Quiz3 {
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
            child: Guide10Quiz3(
              coins: coins,
              onClose: () async {
                twLooog("=====OverlayGuideTestAnim=close");
                close();
                MainQuizController.to.saveGuideStatus();
                onBtn.call(coins);
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

class Guide10Quiz3 extends StatefulWidget {
  const Guide10Quiz3({super.key, required this.onClose, required this.coins});

  final VoidCallback onClose;
  final double coins;

  @override
  State<Guide10Quiz3> createState() => _Guide10Quiz3State();
}

class _Guide10Quiz3State extends State<Guide10Quiz3> {
  int index = 0;
  double itemHgith = 0;

  bool showEffect = false;

  bool showAnimated = false;
  Duration animD = Duration(milliseconds: 200);
  double startScale = 0.8;

  bool showNumber = false;



  double _coinsss = 0;
  Offset _offset = Offset(-30.w, 0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          showAnimated = true;
        });
        Future.delayed(Duration(milliseconds: 100), () {
          if (mounted) {
            setState(() {
              _coinsss = widget.coins;
              _offset = Offset.zero;
            });
          }
        });
        initTimer();
      }
    });
  }
  Timer? _timer;
  final Duration _timerD = Duration(milliseconds: 800);

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
                Center(
                  child: FittedBox(
                    child: Column(
                      children: [
                        AnimatedSlide(
                          offset: _offset,
                          duration: Duration(milliseconds: 300),
                          child: TwTxtGraBorder(
                            text: "An Extra",
                            fontSize: 32.sp,
                            fontWeight: FontWeight.w900,
                            fontColor: Color(0xffffffff),
                            gradient: LinearGradient(
                              colors: [Color(0xffFFF7A3), Color(0xffFFC941)],
                              end: Alignment.bottomCenter,
                              begin: Alignment.topCenter,
                            ),
                            strokeColor: Color(0xffFFED75),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        _Guide10ScaleOverlayAnim(text: "10"),
                        SizedBox(height: 16.h),
                        AnimatedSlide(
                          offset: _offset,
                          duration: Duration(milliseconds: 300),
                          child: TwTxtGraBorder(
                            text: "FREE for YOU!!!",
                            fontSize: 32.sp,
                            fontWeight: FontWeight.w900,
                            fontColor: Color(0xffffffff),
                            gradient: LinearGradient(
                              colors: [Color(0xffFFF7A3), Color(0xffFFC941)],
                              end: Alignment.bottomCenter,
                              begin: Alignment.topCenter,
                            ),
                            strokeColor: Color(0xffFFED75),
                          ),
                        ),
                        SizedBox(height: 100.h),
                        // showNumber ? btnClaim() : SizedBox(height: 56.h,)
                        AnimatedCrossFade(
                          firstChild: SizedBox(height: 56.h),
                          secondChild: btnClaim(),
                          crossFadeState: showNumber
                              ? CrossFadeState.showSecond
                              : CrossFadeState.showFirst,
                          duration: Duration(milliseconds: 300),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
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
              Positioned(
                top: -10.h,
                right: -5.h,
                child: Image.asset(
                  Assets.twimg.ad.path,
                  width: 28.h,
                  height: 28.h,
                ),
              ),

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

class _Guide10ScaleOverlayAnim extends StatefulWidget {
  const _Guide10ScaleOverlayAnim({super.key, required this.text});

  final String text;

  @override
  State<_Guide10ScaleOverlayAnim> createState() =>
      _Guide10ScaleOverlayAnimState();
}

class _Guide10ScaleOverlayAnimState extends State<_Guide10ScaleOverlayAnim>
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
    return SizedBox(
      width: 360.w,
      height: 104.h,
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
                    height: 104.h,
                    child: Stack(
                      children: [
                        ShiningEffect(
                          duration: Duration(milliseconds: 2000),
                          shineColor: Color(0xffffffff),
                          opacity: 0.6,
                          angle: -0.1,
                          topLeft: false,
                          child: Image.asset(
                            Assets.twimg.guide10Coinbg.path,

                            width: 360.w,
                            height: 104.h,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  Assets.twimg.coin.path,
                                  width: 32.h,
                                  height: 32.h,
                                ),
                                SizedBox(width: 8.w),
                                TwTxtGraBorder(
                                  text: widget.text,
                                  fontSize: 48.sp,
                                  fontWeight: FontWeight.w900,
                                  fontColor: Color(0xffffffff),
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xffFF920D),
                                      Color(0xffFF2F18),
                                    ],
                                    end: Alignment.bottomCenter,
                                    begin: Alignment.topCenter,
                                  ),
                                  strokeColor: Color(0xffFFED75),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
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
}
