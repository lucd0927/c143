import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:c143/gen/assets.gen.dart';
import 'package:c143/tw_143/tw_common/lottieeee/gesture.dart';
import 'package:c143/tw_143/tw_pages/guide/guide1_water.dart';
import 'package:c143/tw_143/tw_pages/main/main_controller.dart';
import 'package:c143/tw_143/tw_pages/main_tree/main_tree_controller.dart';
import 'package:c143/tw_base/tw_gj/logC143.dart';
import 'package:c143/tw_base/tw_gj/overlay_manager.dart';
import 'package:c143/tw_hive/twhiveC143.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OverlayCash1000 {
  OverlayEntry? _overlayEntry;

  ///是否真正显示
  bool get isShowing => _isShowing;
  bool _isShowing = false;
  var box = TwHive.box;
  static const String twkeycash1000 = "tw_cash_1000";

  void show() {
    _overlayEntry = null;
    bool hasShow = box.get(twkeycash1000) ?? false;
    if (hasShow) {
      return;
    }
    Widget child = Material(
      color: Colors.transparent,
      child: Guide2CoinWidget(
        onClose: () async {
          close();
          box.put(twkeycash1000, true);
          MainController.to.resetIndex(MainController.treeIndex);
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

class Guide2CoinWidget extends StatefulWidget {
  const Guide2CoinWidget({super.key, required this.onClose});

  final VoidCallback onClose;

  @override
  State<Guide2CoinWidget> createState() => _Guide2CoinWidgetState();
}

class _Guide2CoinWidgetState extends State<Guide2CoinWidget> {
  int index = 0;

  bool showAnimated = false;
  Duration animD = Duration(milliseconds: 200);
  double startScale = 0.8;
  double coin = 0;
  Timer? _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          showAnimated = true;
          coin = 10;
        });
      }
      initTimer();
    });
  }

  initTimer() {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: 3000), () {
      _timer?.cancel();
      if (mounted) {
        setState(() {
          index = 1;
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer?.cancel();
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
          child: IndexedStack(index: index, children: [step0(), step1()]),
        ),
      ),
    );
  }

  step0() {
    return Center(
      child: Container(
        width: 296.w,
        height: 236.h,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.circular(16.w),
        ),
        child: Stack(
          children: [
            Image.asset(
              Assets.twimg0302.m1000Stage1Bg.path,
              width: 296.w,
              height: 68.h,
              fit: BoxFit.fill,
            ),
            Positioned.fill(
              child: Column(
                children: [
                  SizedBox(height: 16.h),
                  AutoSizeText(
                    "Processing...",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF333333),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  AutoSizeText(
                    "Connecting to secure\ngateway...",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF323231),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 18.h),
                  Container(
                    width: 270.w,
                    child: TwAnimatedProgress2(
                      width: 270.w,
                      height: 16.h,
                      maxProgress: 0.98,
                    ),
                  ),
                  SizedBox(height: 36.h),
                  Container(
                    width: double.infinity,
                    height: 40.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Assets.twimg0302.m1000Stage1Gurad.path,
                          width: 16.sp,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          "256-bit SSL encrypted",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff686D73),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  step1() {
    Widget child = index == 0
        ? Container(width: 296.w, height: 0)
        : Container(
            width: 296.w,
            height: 428.h,
            decoration: BoxDecoration(
              color: Color(0xffffffff),
              borderRadius: BorderRadius.circular(16.w),
            ),
            child: Column(
              children: [
                Container(
                  width: 296.w,
                  height: 128.h,
                  child: Stack(
                    children: [
                      Image.asset(
                        Assets.twimg0302.m1000Stage2Top.path,
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.fill,
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 10.h,
                        child: Center(
                          child: AutoSizeText(
                            "Action Required",
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF333333),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Column(
                    children: [
                      AutoSizeText(
                        "Your tree is too small to handle this transaction amount.",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF323231),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      AutoSizeText(
                        "Upgrade to process payment.",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF323231),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 24.h),
                      Container(
                        width: 272.w,
                        height: 80.h,
                        decoration: BoxDecoration(
                          color: Color(0xffDEDEDE),
                          borderRadius: BorderRadius.circular(8.w),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AutoSizeText(
                                  "Current",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF686D73),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                AutoSizeText(
                                  "Lv.${MainTreeController.to.curLevel.value}",
                                  style: TextStyle(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF323231),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AutoSizeText(
                                  "Required",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFFDB5E4D),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                AutoSizeText(
                                  "Lv.5",
                                  style: TextStyle(
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFFD23723),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 36.h),
                      GestureDetector(
                        onTap: onbtnn,
                        child: Container(
                          width: 270.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Color(0xff0056F1), Color(0xff009CDE)],
                              // begin: Alignment.topCenter,
                              // end: Alignment.bottomCenter,
                            ),
                            borderRadius: BorderRadius.circular(80.h),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 0),
                                blurRadius: 8.w,
                                color: Color(0xff66CAFF),
                              ),
                            ],
                          ),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.arrow_upward,
                                      color: Color(0xffffffff),
                                      size: 30.sp,
                                    ),
                                    AutoSizeText(
                                      "Upgrade Now",
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFFffffff),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 10.h,
                                right: 0.w,
                                child: TwLottieGesture(),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 12.h),
                      GestureDetector(
                        onTap: onbtnn,
                        child: AutoSizeText(
                          "Give Up Reward",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF686D73),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
    return Center(
      child: AnimatedSize(
        duration: Duration(milliseconds: 300),
        child: child,
        alignment: Alignment.topCenter,
      ),
    );
  }

  void onbtnn() {
    widget.onClose();
  }
}

class TwAnimatedProgress2 extends StatefulWidget {
  const TwAnimatedProgress2({
    super.key,
    required this.width,
    required this.height,
    this.maxProgress = 1.0,
  });

  final double width;
  final double height;
  final double maxProgress;

  @override
  State<TwAnimatedProgress2> createState() => _TwAnimatedProgress2State();
}

class _TwAnimatedProgress2State extends State<TwAnimatedProgress2> {
  double startTime = 0.0;
  late Timer _timer;
  final Duration _delayTime = Duration(milliseconds: _oneTime);
  double _allTime = 2000;
  static const int _oneTime = 90;
  bool canGoToMain = true;
  Timer? _delayTimer;
  double value = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      twLooog("======= _allTime: $_allTime");
      double count = _allTime / _oneTime;
      _timer = Timer.periodic(_delayTime, (time) {
        // ggPrint("time:${time.tick} =========count:$count");
        int tick = time.tick;

        if (tick > count + 1) {
          _timer.cancel();
        } else {
          setState(() {
            startTime = tick * _oneTime / _allTime;
            value = startTime * 100;
            if (startTime >= 1) {
              startTime = widget.maxProgress;
              value = widget.maxProgress;
            }
          });
        }
      });
      // abInitttt();
    });
  }

  xiayigeyemina() {}

  @override
  Widget build(BuildContext context) {
    double curProgreeToNum = startTime * 100;
    return Column(
      children: [
        Container(
          width: widget.width,
          height: widget.height,

          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.centerLeft,
            children: [
              SizedBox(
                width: widget.width,
                height: widget.height,
                child: _AnimatedGradientProgressBar(
                  value: startTime,
                  // 表示 60%
                  gradientColors: [Color(0xff0056F1), Color(0xff009CDE)],
                  duration: _delayTime,
                  height: widget.height - 2.h,
                  borderRadius: BorderRadius.circular(30.w),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${curProgreeToNum.toStringAsFixed(0)}%",
              style: TextStyle(
                fontSize: 14.sp,
                color: Color(0xff1767E7),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Finalizing...",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: Color(0xff1767E7),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer.cancel();
    _delayTimer?.cancel();
  }
}

class _AnimatedGradientProgressBar extends StatelessWidget {
  final BorderRadius borderRadius;
  final double value; // 当前进度 0.0 ~ 1.0
  final double height;
  final Duration duration;
  final List<Color> gradientColors;

  const _AnimatedGradientProgressBar({
    super.key,
    required this.value,
    this.height = 8.0,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.gradientColors = const [Colors.blue, Colors.purple],
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: value.clamp(0.0, 1.0)),
      duration: duration,
      curve: Curves.easeInOut,
      builder: (context, animatedValue, child) {
        return ClipRRect(
          borderRadius: borderRadius,
          child: Container(
            height: height,
            decoration: BoxDecoration(
              color: Color(0xff000000).withValues(alpha: 0.3),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: animatedValue,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: gradientColors,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      border: Border.all(color: Color(0xff421614), width: 1.w),
                      borderRadius: BorderRadius.circular(height),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
