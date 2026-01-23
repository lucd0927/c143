import 'package:c143/tw_143/tw_pages/main_cash/main_cash_controller.dart';
import 'package:c143/tw_143/tw_pages/main_tree/main_tree_controller.dart';
import 'package:c143/tw_base/tw_gj/vibration.dart';
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

      if (MainCashController.to.hasSaveCardIddddC143()) {
        maxnnn = MainTreeController.maxCoinNum;
      }

      double progress = MainTreeController.to.curMoneyyyy.value / maxnnn;
      if (progress >= 1) {
        progress = 1;
      }

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
              height: 140.h,
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
                      child: Center(
                        child: Text(
                          progress >= 1 ? "Withdraw Now" : "Earn Now",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16.sp,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
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
