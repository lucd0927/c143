import 'package:c143/tw_143/tw_common/lottieeee/gesture.dart';
import 'package:c143/tw_143/tw_pages/main_cash/main_cash_controller.dart';
import 'package:c143/tw_143/tw_pages/main_tree/main_tree_controller.dart';
import 'package:c143/tw_base/tw_gj/countryC143.dart';
import 'package:c143/tw_base/tw_gj/logC143.dart';
import 'package:c143/tw_base/tw_gj/vibration.dart';
import 'package:c143/tw_views/animated_scale.dart';
import 'package:c143/tw_views/tw_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_ce_flutter/adapters.dart';

class CashProgress extends StatefulWidget {
  const CashProgress({super.key});

  @override
  State<CashProgress> createState() => _CashProgressState();
}

class _CashProgressState extends State<CashProgress> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      double maxnnn = MainTreeController.stageB1Num;
      double lfettt = MainTreeController.to.leftMonn1();
      bool hasSaaa = MainCashController.to.hasSaveCardIddddC143();
      if (hasSaaa) {
        maxnnn = MainTreeController.maxCoinNum;
        lfettt = MainTreeController.to.leftMonn2();
      }

      double progress = MainTreeController.to.curMoneyyyy.value / maxnnn;
      if (progress >= 1) {
        progress = 1;
      }
      twLooog("===progress:$progress===");
      List<Color> prgressTxt = MainCashController.to.progressColors();

      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 12.h),
            Row(
              children: [
                Container(
                  width: 4.w,
                  height: 16.h,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: prgressTxt,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16.h),
                  ),
                ),

                SizedBox(width: 8.w),
                Text(
                  "This will be your first withdrawal",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14.sp,
                    color: Color(0xff000000),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              width: 320.w,
              height: 160.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.h),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        "Current withdrawal progress",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                          color: Color(0xff000000),
                        ),
                      ),
                      Spacer(),
                      Text(
                        "Super Easy",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                          color: Color(0xff00B038),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  TwProgressC143(
                    height: 16.h,
                    innerHeight: 11.h,
                    width: 288.w,
                    progress: progress,
                    gradientColors: prgressTxt,
                    bgColor: Color(0xffE2E2E2),
                  ),

                  SizedBox(height: 32.h),
                  GestureDetector(
                    onTap: _onWithdraw,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: 290.w,
                          height: 60.h,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: prgressTxt,
                              // begin: Alignment.topCenter,
                              // end: Alignment.bottomCenter,
                            ),
                            borderRadius: BorderRadius.circular(8.h),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 0),
                                blurRadius: 8.w,
                                color: Color(0xff66CAFF),
                              ),
                            ],
                          ),
                          child: TwAScaleC143(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  progress >= 1
                                      ? "Withdraw Now"
                                      : "CASH-OUT NOW",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: progress >= 1 ? 24.sp : 16.sp,
                                    height: 1,

                                    color: Color(0xffffffff),
                                  ),
                                ),
                                if (progress < 1)
                                  Text(
                                    "quiz required to unlock final ${TwCountryyC143.curCountryyyySymbolC143()}${lfettt.toStringAsFixed(2)}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.sp,
                                      height: 1,
                                      color: Color(0xffffffff),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          top: 20.h,
                          right: -30.w,
                          // child: TwAScale(
                          //   child: Image.asset(
                          //     Assets.twimg.gesture.path,
                          //     width: 70.w,
                          //     height: 70.w,
                          //   ),
                          // ),
                          child: TwLottieGesture(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  void _onWithdraw() {
    VibrationC143.vibrationClick();
    MainCashController.to.onWithdraw();
  }
}
