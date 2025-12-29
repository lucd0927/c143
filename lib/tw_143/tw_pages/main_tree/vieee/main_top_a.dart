import 'package:c143/gen/assets.gen.dart';
import 'package:c143/tw_143/tw_pages/main_tree/main_tree_controller.dart';
import 'package:c143/tw_views/animated_count.dart';
import 'package:c143/tw_views/fade_switcher.dart';
import 'package:c143/tw_views/font_border.dart';
import 'package:c143/tw_views/font_gradient_border.dart';
import 'package:c143/tw_views/tw_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MainTopA extends StatefulWidget {
  const MainTopA({super.key});

  @override
  State<MainTopA> createState() => _MainTopAState();
}

class _MainTopAState extends State<MainTopA> {
  Map<int, List<String>> stageTexts = {
    30: [
      "Nice one! Your coin journey has begun!",
      "You’ve earned your first pot of gold! Keep collecting coins!",
      "Every tap brings you one step closer to your goal!",
    ],
    70: [
      "Full speed ahead! At this rate, you can claim big rewards today!",
      "Halfway there! The more you play, the more coins you earn!",
      "Watch an ad, and your progress bar will jump up a notch!",
      "You’ve outpaced 20% of users in today’s progress!",
    ],
    95: [
      "Victory is within sight! Only 500 coins left to go!",
      "Final sprint! Just 10 more taps to claim rewards!",
      "Wow! You’re almost there!",
      // "You’re expected to claim full rewards in 15 minutes!",
    ],
    100: [
      "Tomorrow’s taps are more valuable!",
      "Today’s tasks are complete! Log in tomorrow to get 1000 coins directly!",
      "The coin tree grows at night—come back tomorrow morning for a surprise!",
    ],
    101: [
      "🎉 Congratulations! You’ve reached your reward goal!",
      "Awesome! Claim now and get your bonus coins!",
      "Tap here—your coins are ready!",
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
              Positioned.fill(
                child: Column(
                  children: [
                    SizedBox(height: 20.h),
                    Container(
                      width: 290.w,
                      height: 84.h,
                      color: Colors.amber.withValues(alpha: 0.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                "My Earnings:  ",
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
                                  fractionDigits: 0,
                                  strokeWidth: 1.w,
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
                                    fontSize: 14.sp,
                                    color: Color(0xffFFDF12),
                                    fontWeight: FontWeight.bold,
                                  ),
                                );
                              }),
                              Spacer(),
                              TwTxtGraBorder(
                                text: MainTreeController.maxCoinNum
                                    .toStringAsFixed(0),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Obx(() {
                            double value =
                                MainTreeController.to.curMoneyyyy.value;

                            double progress =
                                value / MainTreeController.maxCoinNum;
                            if (progress > 1) {
                              progress = 1;
                            }
                            // progress = 0.01;
                            return TwProgress(
                              height: 12.h,
                              innerHeight: 10.h,
                              width: 290.w,
                              progress: progress,
                              gradientColors: [
                                Color(0xffFFDC2E),
                                Color(0xffFF8C00),
                              ],
                              bgColor: Color(0xff155F28),
                            );
                          }),
                        ],
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
            Expanded(child: FadeSwitcher(children: [...chilren])),
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
}
