import 'dart:async';
import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:c143/gen/assets.gen.dart';
import 'package:c143/tw_143/tw_common/lottieeee/common.dart';
import 'package:c143/tw_143/tw_common/lottieeee/gesture.dart';
import 'package:c143/tw_143/tw_pages/guide/guide1_water.dart';
import 'package:c143/tw_143/tw_pages/guide/guide7_rank.dart';
import 'package:c143/tw_143/tw_pages/guide/guide9_quiz2.dart';
import 'package:c143/tw_143/tw_pages/main_cash/main_cash_controller.dart';
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
import 'package:percent_indicator/circular_percent_indicator.dart';

class OverlayTxStep {
  OverlayEntry? _overlayEntry;

  void show({required double coins, required ValueChanged onBtn}) {
    _overlayEntry = null;

    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Material(
          color: Colors.transparent,
          child: TxStepWidget(
            coins: coins,
            onClose: () async {
              twLooog("=====OverlayGuideTestAnim=close");
              close();
            },
          ),
        );
      },
    );
    Overlay.of(Get.context!).insert(_overlayEntry!);
  }

  void close() {
    _overlayEntry?.remove();
  }
}

class TxStepWidget extends StatefulWidget {
  const TxStepWidget({super.key, required this.onClose, required this.coins});

  final VoidCallback onClose;
  final double coins;

  @override
  State<TxStepWidget> createState() => _TxStepWidgetState();
}

class _TxStepWidgetState extends State<TxStepWidget> {
  int index = 0;

  bool showAnimated = false;
  Duration animD = Duration(milliseconds: 200);
  Duration animIndex0 = Duration(milliseconds: 1200);
  Duration animIndex2 = Duration(milliseconds: 2000);
  double startScale = 0.8;

  int stepIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          showAnimated = true;
        });

        Future.delayed(animIndex0, () {
          if (mounted) {
            setState(() {
              stepIndex = 1;
            });
          }
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
                StarryBeamScene(),
                Positioned.fill(child: stepWidget()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget stepWidget() {
    return IndexedStack(
      index: stepIndex,
      children: [
        stepWidget0(),
        stepWidget1(),
        stepWidget2(),
        stepWidget3(),
        stepWidget4(),
        stepWidget5(),
      ],
    );
  }

  jinduWidget() {
    double width = 80.h;
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: showAnimated ? 1.0 : 0),
      duration: animIndex0,
      builder: (BuildContext context, double? value, Widget? child) {
        value ??= 0;
        return Container(
          width: width,
          height: width,
          decoration: BoxDecoration(color: Colors.teal.withValues(alpha: 0.0)),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Image.asset(
                Assets.twimgB.txCheck.path,
                width: width,
                height: width,
              ),
              CircularPercentIndicator(
                radius: (width - 4.w) / 2,
                animation: false,
                lineWidth: 4.w,
                percent: value ?? 0,

                backgroundColor: Colors.grey.withValues(alpha: 0.5),
                progressColor: Color(0xff1fd119),
              ),
            ],
          ),
        );
      },
    );
  }

  stepWidget0() {
    // return Center(child: _Guide0ScaleOverlayAnim());
    return Center(
      child: Container(
        height: 180.h,
        width: 296.w,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Center(
                child: Container(
                  height: 132.h,
                  width: 296.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.w),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 32.h,
                        width: 296.w,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color(0xffC8DEFF),
                              Color(0xffC9E5FF).withValues(alpha: 0),
                            ],
                            end: Alignment.bottomCenter,
                            begin: Alignment.topCenter,
                          ),
                          borderRadius: BorderRadius.circular(16.w),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: TwTxtGraBorderC143(
                            text: "Under Security Review",
                            gradient: LinearGradient(
                              colors: [Color(0xff00367D), Color(0xff00A8FD)],
                              end: Alignment.bottomCenter,
                              begin: Alignment.topCenter,
                            ),
                            height: 1.2,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                            strokeColor: Color(0xff00A8FD),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 8.h,
              child: Center(child: jinduWidget()),
            ),
          ],
        ),
      ),
    );
  }

  final Duration _duration = Duration(milliseconds: 300);
  List<Color> prgressTxt = MainCashController.to.progressColors();

  stepWidget1() {
    Widget child = stepIndex == 1
        ? Center(
            child: Container(
              width: 296.w,
              height: 450.h,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 0.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.w),
              ),
              child: Column(
                children: [
                  SizedBox(height: 12.h),
                  Text(
                    "You have 1 payment request pending approval",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18.sp,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: Color(0xffE8E8E8).withValues(alpha: 0.8),
                          borderRadius: BorderRadius.circular(4.w),
                        ),
                        child: Center(
                          child: Image.asset(
                            Assets.twimgB.txAd.path,
                            width: 32.w,
                            height: 32.h,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Image.asset(
                          Assets.twimgB.txNext.path,
                          width: 12.w,
                          height: 12.h,
                        ),
                      ),
                      Container(
                        width: 108.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: Color(0xffE8E8E8).withValues(alpha: 0.8),
                          borderRadius: BorderRadius.circular(4.w),
                        ),
                        child: Center(
                          child: Image.asset(
                            MainCashController.to.savePayIcon(),
                            width: 100.w,
                            height: 32.h,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Image.asset(
                          Assets.twimgB.txNext.path,
                          width: 12.w,
                          height: 12.h,
                        ),
                      ),
                      Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          color: Color(0xffE8E8E8).withValues(alpha: 0.8),
                          borderRadius: BorderRadius.circular(4.w),
                        ),
                        child: Center(
                          child: Image.asset(
                            Assets.twimgB.txYou.path,
                            width: 32.w,
                            height: 32.h,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Container(
                    width: 272.w,
                    height: 248.h,
                    decoration: BoxDecoration(
                      color: Color(0xffE8E8E8).withValues(alpha: 0.8),
                      borderRadius: BorderRadius.circular(16.w),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 12.h),
                        Text(
                          "Amount Pending Payment",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 14.sp,
                            color: Color(0xff323232),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 8.h),
                        TwTxtGraBorderC143(
                          text:
                              "${TwCountryyC143.curCountryyyySymbolC143()}${MainTreeController.stageB1Num.toStringAsFixed(0)}",
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w700,
                        ),
                        SizedBox(height: 8.h),
                        Expanded(
                          child: Container(
                            width: 256.w,
                            height: 160.h,
                            padding: EdgeInsets.symmetric(horizontal: 12.w),
                            decoration: BoxDecoration(
                              color: Color(0xffffffff).withValues(alpha: 1),
                              borderRadius: BorderRadius.circular(12.w),
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: 4.h),
                                Row(
                                  children: [
                                    Text(
                                      "Payer",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.sp,
                                        color: Color(0xff686D73),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Spacer(),
                                    Text(
                                      "${MainCashController.to.savePayName()}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.sp,
                                        color: Color(0xff000000),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                                Container(
                                  width: double.infinity,
                                  margin: EdgeInsets.symmetric(vertical: 4.h),
                                  height: 1,
                                  decoration: BoxDecoration(
                                    color: Color(
                                      0xffE8E8E8,
                                    ).withValues(alpha: 0.8),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Check your application content",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14.sp,
                                        color: Color(0xff686D73),
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),

                                Expanded(
                                  child: Center(
                                    child: Container(
                                      width: 240.w,
                                      // height: 80.h,
                                      padding: EdgeInsets.symmetric(
                                        vertical: 10.h,
                                        horizontal: 8.w,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Color(
                                          0xffE8E8E8,
                                        ).withValues(alpha: 0.8),
                                        borderRadius: BorderRadius.circular(
                                          12.w,
                                        ),
                                      ),
                                      child: Text(
                                        "You are about to cash out ${TwCountryyC143.curCountryyyySymbolC143()}${MainTreeController.stageB1Num.toStringAsFixed(0)}. We are initiating a request to prepare a ${TwCountryyC143.curCountryyyySymbolC143()}${MainTreeController.stageB1Num.toStringAsFixed(0)} payment to you. Please approve.",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12.sp,
                                          color: Color(0xff323231),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 12.h),
                      ],
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Expanded(
                    child: Center(
                      child: GestureDetector(
                        onTap: _onApprovePayment,
                        child: Container(
                          width: 290.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: prgressTxt,
                              // begin: Alignment.topCenter,
                              // end: Alignment.bottomCenter,
                            ),
                            borderRadius: BorderRadius.circular(40.h),
                          ),
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Center(
                                child: Text(
                                  "Approve Payment",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16.sp,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 28.h,
                                right: 0.w,

                                child: TwLottieGesture(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : SizedBox(width: 296.w);
    return AnimatedSize(
      duration: _duration,
      alignment: Alignment.topLeft,
      child: child,
    );
  }

  stepWidget2() {
    Widget child = stepIndex == 2
        ? Center(
            child: _GuideTxStepScaleOverlayAnim(
              text:
                  "A handling fee of \$50 will be charged first for amounts below \$1000.",
              key: ValueKey("xxx$stepIndex"),
            ),
          )
        : SizedBox(width: double.infinity);
    return AnimatedSize(
      duration: _duration,
      alignment: Alignment.topCenter,
      child: child,
    );
  }

  stepWidget3() {
    Widget child = stepIndex == 3
        ? Center(
            child: _GuideTxStepScaleOverlayAnim(
              text: "FEE-FREE CASH OUT FOR A LIMITED TIME!! ",
              text2: "Pay \$50",
              key: ValueKey("xxx$stepIndex"),
            ),
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
        ? Center(
            child: Container(
              width: 296.w,
              height: 164.h,
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              decoration: BoxDecoration(
                color: Color(0xffffffff).withValues(alpha: 1),
                borderRadius: BorderRadius.circular(12.w),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "A handling fee of \$50 yuan will be charged first for amounts below \$1000.",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16.sp,
                      color: Color(0xff323231),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16.h),

                  Center(
                    child: GestureDetector(
                      onTap: _onApprovePayment,
                      child: Container(
                        width: 290.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: prgressTxt,
                            // begin: Alignment.topCenter,
                            // end: Alignment.bottomCenter,
                          ),
                          borderRadius: BorderRadius.circular(40.h),
                        ),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Center(
                              child: Text(
                                "Zero-free Cash Out",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16.sp,
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ),
                            Positioned(
                              top: -16.h,
                              right: -4.w,

                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 4.w,
                                  vertical: 2.h,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(100.w),
                                    topRight: Radius.circular(100.w),
                                    bottomRight: Radius.circular(100.w),
                                  ),
                                  color: Color(0xffFAD4C1),
                                ),
                                child: Center(
                                  child: Text(
                                    "Today Only",
                                    style: TextStyle(
                                      color: Color(0xff894C2E),
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 28.h,
                              right: 0.w,

                              child: TwLottieGesture(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : SizedBox(width: double.infinity);
    return AnimatedSize(
      duration: _duration,
      alignment: Alignment.topLeft,
      child: child,
    );
  }

  stepWidget5() {
    Widget child = stepIndex == 5
        ? Center(
            child: Container(
              width: 296.w,
              height: 260.h,
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              decoration: BoxDecoration(
                color: Color(0xffffffff).withValues(alpha: 1),
                borderRadius: BorderRadius.circular(12.w),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Congratulations",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20.sp,
                      color: Color(0xff000000),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 24.h),
                  Text(
                    "Unlock the Premium Channel for You Free of Charge!",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: Color(0xff323231),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "One-Time Fee-Free Cash Out",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      color: Color(0xff686D73),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8.h),
                  TwTxtGraBorderC143(
                    text:
                        "${TwCountryyC143.curCountryyyySymbolC143()}${MainTreeController.maxCoinNum.toStringAsFixed(0)}",
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w900,
                  ),
                  SizedBox(height: 12.h),
                  Center(
                    child: GestureDetector(
                      onTap: _onApprovePayment,
                      child: Container(
                        width: 290.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: prgressTxt,
                            // begin: Alignment.topCenter,
                            // end: Alignment.bottomCenter,
                          ),
                          borderRadius: BorderRadius.circular(40.h),
                        ),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Center(
                              child: Text(
                                "Earn",
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16.sp,
                                  color: Color(0xffffffff),
                                ),
                              ),
                            ),

                            Positioned(
                              top: 28.h,
                              right: 0.w,

                              child: TwLottieGesture(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : SizedBox(width: double.infinity);
    return AnimatedSize(
      duration: _duration,
      alignment: Alignment.topLeft,
      child: child,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  void _onApprovePayment() {
    if (mounted) {
      setState(() {
        if (stepIndex == 0) {
          stepIndex = 1;
        } else if (stepIndex == 1) {
          stepIndex = 2;
          Future.delayed(animIndex2, () {
            if (mounted) {
              setState(() {
                stepIndex = 3;
              });

              Future.delayed(animIndex2, () {
                if (mounted) {
                  setState(() {
                    stepIndex = 4;
                  });
                }
              });
            }
          });
        } else if (stepIndex == 2) {
          stepIndex = 3;
        } else if (stepIndex == 3) {
          stepIndex = 4;
        } else if (stepIndex == 4) {
          stepIndex = 5;
        } else if (stepIndex == 5) {
          widget.onClose();
        }
      });
    }
  }
}

class _GuideTxStepScaleOverlayAnim extends StatefulWidget {
  const _GuideTxStepScaleOverlayAnim({
    super.key,
    required this.text,
    this.text2 = "",
  });

  final String text;
  final String text2;

  @override
  State<_GuideTxStepScaleOverlayAnim> createState() =>
      _GuideTxStepScaleOverlayAnimState();
}

class _GuideTxStepScaleOverlayAnimState
    extends State<_GuideTxStepScaleOverlayAnim>
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
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  widget.text,
                                  style: TextStyle(
                                    fontSize: widget.text2.isEmpty
                                        ? 20.sp
                                        : 14.sp,
                                    fontWeight: FontWeight.w900,
                                    color: Color(0xffffffff),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                if (widget.text2.isNotEmpty)
                                  Text(
                                    widget.text2,
                                    style: TextStyle(
                                      fontSize: 36.sp,
                                      fontWeight: FontWeight.w900,
                                      color: Color(0xffFFE74C),
                                      decoration: TextDecoration.lineThrough,
                                      decorationColor: Color(0xffFFE74C),
                                      decorationThickness: 2.w,
                                    ),
                                    textAlign: TextAlign.center,
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

class StarryBeamScene extends StatefulWidget {
  const StarryBeamScene({super.key});

  @override
  State<StarryBeamScene> createState() => _StarryBeamSceneState();
}

class _StarryBeamSceneState extends State<StarryBeamScene>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<StarParticle> _particles = [];
  final Random _random = Random();
  final int _particleCount = 30; // 粒子数量

  @override
  void initState() {
    super.initState();
    // 初始化动画控制器
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat(); // 无限循环

    // 初始化粒子
    for (int i = 0; i < _particleCount; i++) {
      _particles.add(_generateParticle(initial: true));
    }
  }

  // 生成随机粒子
  StarParticle _generateParticle({bool initial = false}) {
    return StarParticle(
      x: _random.nextDouble(),
      // 0.0 到 1.0 (屏幕宽度的比例)
      y: initial ? _random.nextDouble() : 1.1,
      // 初始随机分布，后续从底部生成
      size: _random.nextDouble() * 6 + 2,
      // 大小 2 - 8
      opacity: _random.nextDouble() * 0.5 + 0.3,
      // 透明度 0.3 - 0.8
      speed: _random.nextDouble() * 0.002 + 0.0005,
      // 漂浮速度
      blur: _random.nextDouble() * 4 + 1, // 模糊程度
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        // 更新粒子位置
        for (var particle in _particles) {
          particle.y -= particle.speed; // 向上移动
          // 如果粒子跑出屏幕顶部，重置到底部
          if (particle.y < -0.1) {
            var newP = _generateParticle();
            particle.x = newP.x;
            particle.y = 1.1;
            particle.size = newP.size;
            particle.opacity = newP.opacity;
            particle.speed = newP.speed;
          }
        }

        return CustomPaint(
          size: Size.infinite,
          painter: BeamPainter(particles: _particles),
        );
      },
    );
  }
}

// 粒子模型类
class StarParticle {
  double x;
  double y;
  double size;
  double opacity;
  double speed;
  double blur;

  StarParticle({
    required this.x,
    required this.y,
    required this.size,
    required this.opacity,
    required this.speed,
    required this.blur,
  });
}

// 画笔类
class BeamPainter extends CustomPainter {
  final List<StarParticle> particles;

  BeamPainter({required this.particles});

  @override
  void paint(Canvas canvas, Size size) {
    // 1. 绘制深色背景 (带一点暖色调的黑)
    final bgPaint = Paint()..color = Color(0xFF0F1215).withValues(alpha: 0.0);
    canvas.drawRect(Offset.zero & size, bgPaint);

    // 2. 绘制顶部光束 (The Beam)
    final beamPaint = Paint()
      ..shader = RadialGradient(
        center: const Alignment(0.0, -0.8), // 光源中心在顶部略靠上
        radius: 1.2,
        colors: [
          const Color(0xFFFFD700).withOpacity(0.3), // 金色核心
          const Color(0xFFDAA520).withOpacity(0.1), // 暗金色外围
          Colors.transparent,
        ],
        stops: const [0.0, 0.4, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    // 使用混合模式让光束更柔和地叠加
    canvas.drawRect(Offset.zero & size, beamPaint);

    // 3. 绘制发光粒子
    for (var particle in particles) {
      final particlePaint = Paint()
        ..color = const Color(0xFFFFE57F).withOpacity(particle.opacity)
        ..style = PaintingStyle.fill
        // 关键：高斯模糊蒙版，创造发光/虚焦效果
        ..maskFilter = MaskFilter.blur(BlurStyle.normal, particle.blur);

      final position = Offset(
        particle.x * size.width,
        particle.y * size.height,
      );

      canvas.drawCircle(position, particle.size, particlePaint);

      // 再画一个小一点的亮核心，增加层次感
      final corePaint = Paint()
        ..color = Colors.white.withOpacity(particle.opacity * 0.8)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 1);

      canvas.drawCircle(position, particle.size * 0.3, corePaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // 因为有动画，每一帧都需要重绘
  }
}
