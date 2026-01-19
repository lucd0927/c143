import 'package:c143/gen/assets.gen.dart';
import 'package:c143/tw_143/tw_common/event.dart';
import 'package:c143/tw_143/tw_pages/main_spin/main_spin_controller.dart';
import 'package:c143/tw_143/tw_pages/main_spin/views/wheel_details.dart';
import 'package:c143/tw_base/tw_ad/guiyin/package.dart';
import 'package:c143/tw_base/tw_gj/event_busC143.dart';
import 'package:c143/tw_base/tw_http/event_report.dart';
import 'package:c143/tw_views/font_border.dart';
import 'package:c143/tw_views/font_gradient_border.dart';
import 'package:c143/tw_views/pb_tushi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MainSpin extends StatefulWidget {
  const MainSpin({super.key});

  @override
  State<MainSpin> createState() => _MainSpinState();
}

class _MainSpinState extends State<MainSpin> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          Assets.twimg.spinBg.path,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
          gaplessPlayback: true,
        ),
        Positioned.fill(
          child: Column(
            children: [
              SpinWheelDetails(),
              SizedBox(height: 16.h),
              Expanded(child: bottomWidget()),
            ],
          ),
        ),
      ],
    );
  }

  bottomWidget() {
    return Obx(() {
      return SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 336.h,
              height: TwPackageABC143.isPackageB() ? 202.h : 182.h,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Image.asset(
                    Assets.twimg.spinBottomBg.path,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.fill,
                    gaplessPlayback: true,
                  ),
                  Positioned.fill(
                    child: TwPackageABC143.isPackageB()
                        ? contentB()
                        : contentA(),
                  ),
                ],
              ),
            ),
            SizedBox(height: 100.h),
          ],
        ),
      );
    });
  }

  contentA() {
    bool tmpClickDailyCheck = MainSpinController.to.curClickDailyCheck.value;
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 30.h,
          color: Colors.red.withValues(alpha: 0.0),
          child: Center(
            child: Text(
              "Earn coins by completing tasks",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.black,
                fontSize: 16.sp,
              ),
            ),
          ),
        ),
        SizedBox(height: 12.h),
        bottomItem(
          icon: Assets.twimg.spinCheck.path,
          text: "daily check-in",
          text2: "+100",
          btnText: !tmpClickDailyCheck ? "Claim" : "Wait",
          canClick: !tmpClickDailyCheck,
          onTap: () {
            if (!tmpClickDailyCheck) {
              MainSpinController.to.clickDailyCheck(100);
            } else {}
          },
        ),
        SizedBox(height: 12.h),

        bottomItem(
          icon: Assets.twimg.spinWheelS.path,
          text: "spin the lucky wheel 50 times",
          text2: "+500",
          btnText: "Wait",
          onTap: () {},
        ),
        // bottomItem(
        //   icon: Assets.twimg.spinAd.path,
        //   text: "watch 100 ads",
        //   text2: "+100",
        //   btnText: "Wait",
        //   onTap: () {},
        // ),
      ],
    );
  }

  contentB() {
    int mtpSpins = MainSpinController.to.curEveryDaySpinB.value;
    String wheelspins = mtpSpins >= 3
        ? TwEnumBtnClickStatus.waitClick.name
        : mtpSpins == -1
        ? TwEnumBtnClickStatus.end.name
        : TwEnumBtnClickStatus.wait.name;

    int tmpCashRain = MainSpinController.to.curEveryMoneyRainB.value;
    String tmpCashRaintxt = tmpCashRain >= 3
        ? TwEnumBtnClickStatus.waitClick.name
        : mtpSpins == -1
        ? TwEnumBtnClickStatus.end.name
        : TwEnumBtnClickStatus.wait.name;

    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 30.h,
          color: Colors.red.withValues(alpha: 0.0),
          child: Center(
            child: Text(
              "Earn coins by completing tasks",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.black,
                fontSize: 16.sp,
              ),
            ),
          ),
        ),
        SizedBox(height: 12.h),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                bottomItemB(
                  icon: Assets.twimg.spinCheck.path,
                  text: "Daily Check-in",
                  text2: "+10",
                  clickStatus: MainSpinController.to.curClickDailyCheckB.value,
                  onTap: () {
                    TwMaiDiannnn.spin_daily_task_claim("daily_check");
                    MainSpinController.to.onDailyCheckB();
                  },
                ),
                bottomItemB(
                  icon: Assets.twimg.spinWheelS.path,
                  text: "3 Wheel Spins",
                  text2: "+10",
                  clickStatus: wheelspins,
                  onTap: () {
                    TwMaiDiannnn.spin_daily_task_claim("spin");
                    MainSpinController.to.onSpinCount();
                  },
                ),
                bottomItemB(
                  icon: Assets.twimg.spinAd.path,
                  text: "Watch 100 ads",
                  text2: "+1000",
                  clickStatus: TwEnumBtnClickStatus.wait.name,
                  onTap: () {},
                ),

                bottomItemB(
                  icon: Assets.twimgB.moneyRain.path,
                  text: "3 Cash Rain Plays",
                  text2: "+100",
                  clickStatus: tmpCashRaintxt,
                  onTap: () {
                    TwMaiDiannnn.spin_daily_task_claim("cash_rain");
                    MainSpinController.to.onCashRainClaim();
                  },
                ),
                bottomItemB(
                  icon: Assets.twimg.mainTree5.path,
                  text: "Unlock Tree Level 5",
                  text2: "+100",
                  clickStatus: MainSpinController.to.curTreeLevel.value,
                  onTap: () {
                    TwMaiDiannnn.spin_daily_task_claim("tree_level_5");
                    MainSpinController.to.onUnlockTreeLevel5();
                  },
                ),
                bottomItemB(
                  icon: Assets.twimg.splashTreeworld.path,
                  text: "3-Day App Launch Streak",
                  text2: "+1000",
                  clickStatus: MainSpinController.to.curLianxuLoginCount.value,
                  onTap: () {},
                ),
                bottomItemB(
                  icon: Assets.twimg.mainWater.path,
                  text: "100 Total Watering",
                  text2: "+1000",
                  clickStatus: MainSpinController.to.curWaterCount.value,
                  onTap: () {},
                ),
                bottomItemB(
                  icon: Assets.twimg.mainFertilize.path,
                  text: "100 Total Fertilization",
                  text2: "+1000",
                  clickStatus: MainSpinController.to.curFertilizeCount.value,
                  onTap: () {},
                ),
                bottomItemB(
                  icon: Assets.twimg.mainSun.path,
                  text: "Collect 100 suns",
                  text2: "+100",
                  clickStatus:
                      MainSpinController.to.curEveryDayCollectSunB.value,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  bottomItem({
    required String icon,
    required String text,
    required String text2,
    required String btnText,
    bool canClick = false,
    required VoidCallback onTap,
  }) {
    return Container(
      width: double.infinity,
      height: 50.h,
      child: Row(
        children: [
          SizedBox(width: 8.w),
          Image.asset(icon, width: 48.h, height: 48.h),
          SizedBox(width: 8.w),
          Expanded(
            child: Text.rich(
              TextSpan(
                text: text,
                children: [
                  TextSpan(
                    text: text2,
                    style: TextStyle(color: Color(0xffFFB700)),
                  ),
                ],
              ),
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.black,
                fontSize: 14.sp,
              ),
            ),
          ),
          SizedBox(width: 8.w),
          GestureDetector(
            onTap: onTap,
            child: Container(
              width: 72.h,
              height: 28.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: canClick
                      ? [Color(0xffFFA800), Color(0xffF47900)]
                      : [Color(0xff42DF0F), Color(0xff098906)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Text(
                  btnText,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 8.w),
        ],
      ),
    );
  }

  bottomItemB({
    required String icon,
    required String text,
    required String text2,
    required String clickStatus,
    required VoidCallback onTap,
  }) {
    bool hasClicked = clickStatus == TwEnumBtnClickStatus.end.name;
    bool canClick = clickStatus == TwEnumBtnClickStatus.waitClick.name;
    String btnText = clickStatus == TwEnumBtnClickStatus.waitClick.name
        ? "Claim"
        : "Wait";
    return Container(
      width: double.infinity,
      height: 50.h,
      child: Row(
        children: [
          SizedBox(width: 8.w),
          Image.asset(icon, width: 48.h, height: 48.h),
          SizedBox(width: 8.w),
          Expanded(
            child: Text.rich(
              TextSpan(
                text: text,
                children: [
                  TextSpan(
                    text: text2,
                    style: TextStyle(color: Color(0xffFFB700)),
                  ),
                ],
              ),
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.black,
                fontSize: 14.sp,
              ),
            ),
          ),
          SizedBox(width: 8.w),
          GestureDetector(
            onTap: () {
              if (canClick) {
                onTap();
              } else {
                twToast(
                  text: hasClicked
                      ? "You had clicked task"
                      : "Please completed task",
                );
              }
            },
            child: Container(
              width: 72.h,
              height: 28.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: canClick
                      ? [Color(0xffFFA800), Color(0xffF47900)]
                      : hasClicked
                      ? [Color(0xffcccccc), Color(0xffcccccc)]
                      : [Color(0xff42DF0F), Color(0xff098906)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Text(
                  btnText,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 8.w),
        ],
      ),
    );
  }

  void onWinbig() {}
}
