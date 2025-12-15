import 'package:c143/gen/assets.gen.dart';
import 'package:c143/tw_143/tw_pages/main_tree/main_tree_controller.dart';
import 'package:c143/tw_views/animated_count.dart';
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
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 352.w,
      height: 132.h,
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
                SizedBox(height: 10.h),
                Container(
                  width: 320.w,
                  height: 90.h,
                  color: Colors.amber.withValues(alpha: 0.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            "My Earnings:",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Color(0xff194FA7),
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          Obx(() {
                            double value =
                                MainTreeController.to.curMoneyyyy.value;
                            value = 110;
                            return TwAnimatedCountttt(
                              value: value,
                              fractionDigits: 0,
                              strokeWidth: 1.w,
                              strokeColor: Color(0xff133F88),
                              textStyle: TextStyle(
                                fontSize: 14.sp,
                                color: Color(0xffFFDF12),
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          }),
                          Spacer(),
                          TwTxtGraBorder(
                            text:
                                MainTreeController.maxCoinNum.toStringAsFixed(0),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      TwProgress(
                        height: 12.h,
                        innerHeight: 10.h,
                        width: 320.w,
                        progress: 0.1,
                        gradientColors: [Color(0xffFFDC2E), Color(0xffFF8C00)],
                        bgColor: Color(0xff203C9F),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 320.w,
                  height: 28.h,
                  color: Colors.red.withValues(alpha: 0.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Nice! Your Wealth Journey Has Begun!",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Color(0xffffffff),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
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
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
