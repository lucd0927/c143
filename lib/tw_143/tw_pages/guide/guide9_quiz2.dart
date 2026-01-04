import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:c143/gen/assets.gen.dart';
import 'package:c143/tw_143/tw_pages/guide/guide10_quiz3.dart';
import 'package:c143/tw_143/tw_pages/guide/guide1_water.dart';
import 'package:c143/tw_143/tw_pages/guide/guide7_rank.dart';
import 'package:c143/tw_143/tw_pages/main_quiz/main_quiz_controller.dart';
import 'package:c143/tw_143/tw_pages/main_tree/main_tree_controller.dart';
import 'package:c143/tw_base/tw_gj/loggggg.dart';
import 'package:c143/tw_views/animated_count.dart';
import 'package:c143/tw_views/animated_scale.dart';
import 'package:c143/tw_views/font_border.dart';
import 'package:c143/tw_views/font_gradient_border.dart';
import 'package:c143/tw_views/shimmer_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OverlayGuide9Quiz2 {
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
            color: Colors.black.withValues(alpha: 0.0),

            child: Guide9Quiz2Widget(
              coins: coins,
              onClose: () async {
                twLooog("=====OverlayGuideTestAnim=close");
                close();
                MainTreeController.to.saveGuideIndexData(MainTreeController.guide9);
                OverlayGuide10Quiz3().show(
                  coins: 100,
                  onBtn: (v) {

                    onBtn.call(coins);
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

class Guide9Quiz2Widget extends StatefulWidget {
  const Guide9Quiz2Widget({
    super.key,
    required this.onClose,
    required this.coins,
  });

  final VoidCallback onClose;
  final double coins;

  @override
  State<Guide9Quiz2Widget> createState() => _Guide9Quiz2WidgetState();
}

class _Guide9Quiz2WidgetState extends State<Guide9Quiz2Widget> {
  int index = 0;
  double itemHgith = 0;

  bool showEffect = false;

  bool showAnimated = false;
  Duration animD = Duration(milliseconds: 200);
  double startScale = 0.8;

  bool showNumber = false;

  Timer? _timer;

  double _coinsss = 0;
  Offset _offset = Offset(-30.w, 0);

  List<List<String>> texts = [
    ["Your ANSWERS are just as VALUABLE as ", "your ATTENTION!!!"],
    ["Advertisers need YOUR feedback! You’re the one making ads ", "better!!!"],
    ["Advertisers get feedback,", "YOU get COINS!!!"],
  ];

  List<String> _curTexts = [];

  Timer? _timer2;
  Timer? _timer3;

  initTimer2() {
    _timer?.cancel();
    _timer2?.cancel();
    _timer2 = Timer(_timerD, () {
      _timer2?.cancel();
      if (mounted) {
        setState(() {
          _curTexts = texts[2];
        });
      }
    });
  }

  initTimer3() {
    _timer?.cancel();
    _timer2?.cancel();
    _timer3?.cancel();
    _timer3 = Timer(_timerD, () {
      _timer3?.cancel();
      if (mounted) {
        setState(() {
          _curTexts = texts[2];
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _curTexts = texts[0];
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          showAnimated = true;
        });

        initTimer();
      }
    });
  }

  final Duration _timerD = Duration(milliseconds: 2500);

  initTimer() {
    _timer?.cancel();
    _timer = Timer(_timerD, () {
      _timer?.cancel();
      if (mounted) {
        setState(() {
          showNumber = true;
          _curTexts = texts[1];
        });
        initTimer2();
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
                        _Guide9ScaleOverlayAnim(
                          key: ValueKey("${_curTexts[1]}"),
                          text: _curTexts[0],
                          text2: _curTexts[1],
                        ),
                      ],
                    ),
                  ),
                ),

                if (_curTexts[1] == texts[2][1])
                  Positioned(
                    child: btnClaim(),
                    left: 0,
                    right: 0,
                    bottom: 100.h,
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
                  text: "Earn More",
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w900,
                  fontColor: Color(0xffffffff),
                  foreground: Color(0xff22431B),
                ),
              ),
              Positioned(
                top: 30.h,
                right: -30.w,
                child: IgnorePointer(
                  child: TwAScale(
                    child: Image.asset(
                      Assets.twimg.gesture.path,
                      width: 70.w,
                      height: 70.w,
                    ),
                  ),
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
    _timer2?.cancel();
    _timer3?.cancel();
  }
}

class _Guide9ScaleOverlayAnim extends StatefulWidget {
  const _Guide9ScaleOverlayAnim({
    super.key,
    required this.text,
    required this.text2,
  });

  final String text;
  final String text2;

  @override
  State<_Guide9ScaleOverlayAnim> createState() =>
      _Guide9ScaleOverlayAnimState();
}

class _Guide9ScaleOverlayAnimState extends State<_Guide9ScaleOverlayAnim>
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
      duration: const Duration(milliseconds: 300),
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
      height: 160.h,
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
                  offset: Offset(-slideAnim.value, 0),
                  child: Container(
                    width: 360.w,
                    height: 160.h,
                    color: Colors.red.withValues(alpha: 0),
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        ShiningEffect(
                          duration: Duration(milliseconds: 2000),
                          shineColor: Color(0xffffffff),
                          opacity: 0.6,
                          angle: -0.1,
                          topLeft: false,
                          child: Image.asset(
                            Assets.twimg.guide9Quizbg.path,

                            width: 308.w,
                            height: 160.h,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 16.w, left: 80.w),
                          child: Transform.rotate(
                            angle: -0.05,
                            child: Text.rich(
                              TextSpan(
                                text: widget.text,
                                children: [
                                  TextSpan(
                                    text: widget.text2,
                                    style: TextStyle(color: Color(0xffDE0909)),
                                  ),
                                ],
                              ),
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w900,
                                color: Color(0xff591F00),
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

            // // 上图
            // AnimatedBuilder(
            //   animation: _controller,
            //   builder: (_, __) {
            //     final h = heightAnim.value / 2;
            //     return Positioned(
            //       top: -14.h,
            //       child: Transform.translate(
            //         offset: Offset(-slideAnim.value, 0),
            //         child: Container(
            //           color: Colors.white.withValues(alpha: 0),
            //           child: Image.asset(
            //             Assets.twimg.animatedBg12.path,
            //             width: 360.w,
            //             height: 28.h,
            //             fit: BoxFit.fill,
            //           ),
            //         ),
            //       ),
            //     );
            //   },
            // ),
            //
            // // 下图
            // AnimatedBuilder(
            //   animation: _controller,
            //   builder: (_, __) {
            //     final h = heightAnim.value / 2;
            //     return Positioned(
            //       bottom: -14.h,
            //       child: Transform.translate(
            //         offset: Offset(-slideAnim.value, 0),
            //         child: Image.asset(
            //           Assets.twimg.animatedBg13.path,
            //           width: 360.w,
            //           height: 28.h,
            //           fit: BoxFit.fill,
            //         ),
            //       ),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
