import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:c143/gen/assets.gen.dart';
import 'package:c143/tw_143/tw_common/lottieeee/gesture.dart';
import 'package:c143/tw_143/tw_common/view/animated_progress2.dart';
import 'package:c143/tw_143/tw_common/view/progress.dart';
import 'package:c143/tw_143/tw_pages/guide/guide0302/guide_controller.dart';
import 'package:c143/tw_143/tw_pages/main_tree/main_tree_controller.dart';
import 'package:c143/tw_base/tw_gj/countryC143.dart';
import 'package:c143/tw_views/animated_count.dart';
import 'package:c143/tw_views/fade_switcher.dart';
import 'package:c143/tw_views/font_border.dart';
import 'package:c143/tw_views/font_gradient_border.dart';
import 'package:c143/tw_views/rotate.dart';
import 'package:c143/tw_views/shake.dart';
import 'package:c143/tw_views/shimmer_effect.dart';
import 'package:c143/tw_views/tw_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Guide01 extends StatefulWidget {
  const Guide01({super.key});

  @override
  State<Guide01> createState() => _Guide01State();
}

class _Guide01State extends State<Guide01> {
  bool showGetit = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 2000), () {
      if (mounted) {
        setState(() {
          showGetit = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      width: ScreenUtil().screenWidth,
      height: ScreenUtil().screenHeight,
      child: Column(
        children: [
          SizedBox(height: 80.h),
          Text(
            "We partner with advertisers",
            style: TextStyle(
              fontSize: 24.sp,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          TwTxtGraBorderC143(
            text: "You withdraw ${TwCountryyC143.curCountryyyySymbolC143()}100",
            fontSize: 28.sp,
            fontWeight: FontWeight.w800,
            height: 1.4,
          ),
          SizedBox(height: 30.h),
          Center(child: GuideMainTopB()),
          SizedBox(height: 30.h),
          buildImageAd(),
          SizedBox(height: 50.h),
          btnClaim(),
        ],
      ),
    );
  }

  Widget btnClaim() {
    return Center(
      child: AnimatedSize(
        duration: Duration(milliseconds: 200),
        child: showGetit
            ? GestureDetector(
                onTap: onget,
                child: Container(
                  width: 260.w,
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
                          text: "Got It",
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w900,
                          fontColor: Color(0xffffffff),
                          foreground: Color(0xff22431B),
                        ),
                      ),
                      Positioned(top: 30.h, right: 30.w, child: TwLottieGesture()),
                    ],
                  ),
                ),
              )
            : SizedBox(width: 260.h),
      ),
    );
  }

  Widget buildImageAd() {
    return Container(
      width: 312.h,
      height: 256.h,
      child: Stack(
        children: [
          Image.asset(
            Assets.twimg0302.guideCe.path,
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Center(
              child: TwShiningEffect(
                duration: Duration(milliseconds: 2000),
                shineColor: Color(0xffffffff),
                opacity: 1,
                angle: -0.9,
                topLeft: false,
                child: TwShakeWidgetC143(
                  child: Image.asset(
                    Assets.twimg0302.guideCeTree.path,
                    fit: BoxFit.fill,
                    width: 120.h,
                    height: 120.h,
                    gaplessPlayback: true,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onget() {
    GuideController0302.to.onGuide1();
  }
}

class GuideMainTopB extends StatefulWidget {
  const GuideMainTopB({super.key, this.hasGuide = false});

  final bool hasGuide;

  @override
  State<GuideMainTopB> createState() => _GuideMainTopBState();
}

class _GuideMainTopBState extends State<GuideMainTopB> {


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 352.w,
          height: 150.h,
          // color: Colors.amber,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                width: 336.w,
                height: 150.h,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xff003389), Color(0xff0870BB)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16.h),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      offset: Offset(1, 1),
                      blurRadius: 1,
                      spreadRadius: 1,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: -0.h,
                right: 20.w,
                child: Image.asset(
                  Assets.twimgB.txPaypalMaintop2.path,
                  width: 70.w * 1,
                  height: 70.h * 1,
                  fit: BoxFit.contain,
                ),
              ),
              Positioned.fill(
                left: 30.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 0.h),
                    Container(
                      width: 290.w,
                      height: 84.h,
                      color: Colors.amber.withValues(alpha: 0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Builder(
                                builder: (context) {
                                  return Image.asset(
                                    Assets.twimgB.money.path,
                                    width: 24.w,
                                    height: 24.w,
                                  );
                                },
                              ),
                              Text(
                                "  ",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Color(0xffA4FFBC),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TwAnimatedCountttt(
                                value: 100,
                                fractionDigits: 2,
                                strokeWidth: 1.w,

                                prefix:
                                    "${TwCountryyC143.curCountryyyySymbolC143()}",
                                strokeColor: Color(0xff133F88),
                                textGradient: LinearGradient(
                                  colors: [
                                    Color(0xffFFDF12),
                                    Color(0xffFFAA00),
                                  ],
                                  end: Alignment.bottomCenter,
                                  begin: Alignment.topCenter,
                                ),
                                textStyle: TextStyle(
                                  fontSize: 24.sp,
                                  color: Color(0xffFFDF12),
                                  fontWeight: FontWeight.w900,
                                  height: 1,
                                ),
                              ),

                              Spacer(),
                            ],
                          ),
                          SizedBox(height: 4.h),

                          TwAnimatedProgress2(
                            width: 290.w,
                            height: 16.h,
                            maxProgress: 1,
                          ),
                        ],
                      ),
                    ),
                    bottomTxt(),
                    Row(
                      children: [
                        Spacer(),
                        GestureDetector(
                          onTap: _onWithdraw,
                          child: Container(
                            width: 88.w,
                            height: 28.h,
                            color: Colors.white.withValues(alpha: 0),
                            child: Stack(
                              children: [
                                Image.asset(Assets.twimgB.btnWithdraw.path),
                                Center(
                                  child: TwTxtBorderC143(
                                    text: "Withdraw",
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w900,
                                    foreground: Color(0xffA44A00),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 20.w),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget bottomTxt() {

    List<String> tmp = [
          "🎉 Congratulations! You’ve reached your cash-out goal!",
          "Awesome! Cash out now and get real money in hand!",
          "Tap here—your money is ready!",
        ];

    int length = tmp.length;
    List<Widget> chilren = [];
    for (int i = 0; i < length; i++) {
      Widget item = Text(
        tmp[i],
        style: TextStyle(
          fontSize: 12.sp,
          color: Color(0xffffffff),
          fontWeight: FontWeight.bold,
          height: 1,
        ),
      );
      chilren.add(item);
    }
    return Container(
      width: 290.w,
      height: 28.h,
      color: Colors.red.withValues(alpha: 0.0),
      child: Row(
        children: [
          Expanded(child: TwFadeSwitcherC143(children: [...chilren])),
        ],
      ),
    );
  }

  void _onWithdraw() {}
}
