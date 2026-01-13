import 'package:c143/gen/assets.gen.dart';
import 'package:c143/tw_143/tw_pages/main/main_controller.dart';
import 'package:c143/tw_143/tw_pages/main_cash/main_cash_controller.dart';
import 'package:c143/tw_143/tw_pages/main_tree/main_tree_controller.dart';
import 'package:c143/tw_base/tw_gj/countryC143.dart';
import 'package:c143/tw_views/animated_count.dart';
import 'package:c143/tw_views/animated_fly.dart';
import 'package:c143/tw_views/fade_switcher.dart';
import 'package:c143/tw_views/font_border.dart';
import 'package:c143/tw_views/font_gradient_border.dart';
import 'package:c143/tw_views/tw_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class MainTopB extends StatefulWidget {
  const MainTopB({super.key, this.hasGuide = false});

  final bool hasGuide;

  @override
  State<MainTopB> createState() => _MainTopBState();
}

class _MainTopBState extends State<MainTopB> {
  Map<int, List<String>> stageTexts = {
    30: [
      "Nice one! Your wealth journey has begun!",
      "You’ve earned your first pot of gold! Keep making money!",
      "Every tap brings you one step closer to your goal!",
    ],
    70: [
      "Full speed ahead! At this rate, you can cash out today!",
      "Halfway there! The bigger the tree, the bigger the profits!",
      "Watch an ad, and your progress bar will jump up a notch!",
      // "You’ve outpaced 20% of users in today’s progress!",
    ],
    95: [
      "Victory is within sight! Only \$0.50 left to go!",
      "Final sprint! Just 10 more taps to cash out!",
      "Wow! You’re almost there!",
      // "You’re expected to cash out in 15 minutes!",
    ],
    100: [
      "🎉 Congratulations! You’ve reached your cash-out goal!",
      "Awesome! Cash out now and get real money in hand!",
      "Tap here—your money is ready!",
    ],
    101: [
      "Tomorrow’s taps are more valuable!",
      "Today’s tasks are complete! Log in tomorrow to get \$1.00 directly!",
      "The small tree grows at night—come back tomorrow morning for a surprise!",
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40.h),
        Container(
          width: 352.w,
          height: 150.h,
          // color: Colors.amber,
          child: Stack(
            children: [
              Image.asset(
                Assets.twimg.mainTopbg.path,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
              Positioned(
                bottom: 24.h,
                right: 30.w,
                child: Obx(() {
                  String icon = MainCashController.to.payIconMainTop();
                  return Image.asset(
                    icon,
                    width: 88.w * 0.8,
                    height: 76.h * 0.8,
                    fit: BoxFit.contain,
                  );
                }),
              ),
              Positioned.fill(
                left: 30.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    GestureDetector(
                      onTap: _onWithdraw,
                      child: Container(
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
                                    if (!widget.hasGuide) {
                                      overlayCoinMain.targetContext = context;
                                    }

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
                                Obx(() {
                                  double value =
                                      MainTreeController.to.curMoneyyyy.value;
                                  // value = 110;
                                  return TwAnimatedCountttt(
                                    value: value,
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
                                  );
                                }),

                                Spacer(),

                                Container(
                                  width: 88.w,
                                  height: 28.h,
                                  child: Stack(
                                    children: [
                                      Image.asset(
                                        Assets.twimgB.btnWithdraw.path,
                                      ),
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
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Progress to: ",
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Color(0xffA4FFBC),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                TwTxtGraBorderC143(
                                  text:
                                      "${TwCountryyC143.curCountryyyySymbolC143()}${MainTreeController.maxCoinNum.toStringAsFixed(0)}",
                                  fontSize: 16.sp,
                                ),
                              ],
                            ),
                            SizedBox(height: 4.h),
                            Obx(() {
                              double value =
                                  MainTreeController.to.curMoneyyyy.value;

                              double progress =
                                  value / MainTreeController.maxCoinNum;
                              if (progress > 1) {
                                progress = 1;
                              }
                              // progress = 0.01;
                              return TwProgressC143(
                                height: 12.h,
                                innerHeight: 10.h,
                                width: 200.w,
                                progress: progress,
                                gradientColors: [
                                  Color(0xffFFDC2E),
                                  Color(0xffFF8C00),
                                ],
                                text: "${(progress * 100).toStringAsFixed(2)}%",
                                bgColor: Color(0xff155F28),
                              );
                            }),
                          ],
                        ),
                      ),
                    ),
                    bottomTxt(),
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
    return Obx(() {
      double tmpCurMmmm = MainTreeController.to.curMoneyyyy.value;
      double progress = tmpCurMmmm / MainTreeController.maxCoinNum;
      List<String> tmp =
          stageTexts[30] ??
          [
            "Nice one! Your coin journey has begun!",
            "You’ve earned your first pot of gold! Keep collecting coins!",
            "Every tap brings you one step closer to your goal!",
          ];
      if (progress <= 0.3) {
        tmp = stageTexts[30]!;
      } else if (progress <= 0.7) {
        tmp = stageTexts[70]!;
      } else if (progress <= 0.8) {
        tmp = stageTexts[95]!;
      } else if (progress <= 1) {
        tmp = stageTexts[100]!;
      } else if (progress > 1) {
        tmp = stageTexts[101]!;
      }
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
            // Image.asset(
            //   Assets.twimg.mainChuanzi.path,
            //   width: 16.w,
            //   height: 16.h,
            // ),
            // Text(
            //   "x1",
            //   style: TextStyle(
            //     fontSize: 14.sp,
            //     color: Color(0xffFFD10E),
            //     fontWeight: FontWeight.bold,
            //   ),
            // ),
          ],
        ),
      );
    });
  }

  void _onWithdraw() {
    MainController.to.resetIndex(MainController.cashIndex);
  }
}
