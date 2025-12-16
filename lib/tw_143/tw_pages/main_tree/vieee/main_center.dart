import 'package:c143/gen/assets.gen.dart';
import 'package:c143/tw_143/tw_pages/main_tree/main_tree_controller.dart';
import 'package:c143/tw_views/animated_count.dart';
import 'package:c143/tw_views/animated_scale.dart';
import 'package:c143/tw_views/font_border.dart';
import 'package:c143/tw_views/shimmer_effect.dart';
import 'package:c143/tw_views/tw_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class MainCenter extends StatefulWidget {
  const MainCenter({super.key});

  @override
  State<MainCenter> createState() => _MainCenterState();
}

class _MainCenterState extends State<MainCenter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 350.h,
      color: Colors.amber.withValues(alpha: 0.0),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 40.h,
            child: Center(
              child: Obx(() {
                String icon = MainTreeController.to.treeIcon();
                return Image.asset(icon, width: 280.h, height: 280.h);
              }),
            ),
          ),
          Positioned(child: leftWidget(), left: 0, top: 0, bottom: 0),
          Positioned(child: rightWidget(), right: 0, top: 0, bottom: 0),
          Positioned(child: levelWidget(), left: 0, right: 0, bottom: 40.h),
        ],
      ),
    );
  }

  levelWidget() {
    return Obx(() {
      int curLevel = MainTreeController.to.curLevel.value;
      return Center(
        child: Container(
          width: 140.w,
          height: 16.h,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xffFAE4B6), Color(0xffFAC986)],
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter,
            ),
            borderRadius: BorderRadius.circular(16.h),
            border: Border.all(color: Color(0xffDEB378), width: 0.5.w),
          ),
          child: Row(
            children: [
              SizedBox(width: 8.w),
              TwAnimatedCountttt(
                value: curLevel,
                fractionDigits: 0,

                prefix: "Lv.",
                textStyle: TextStyle(
                  fontSize: 14.sp,
                  color: Color(0xff634417),
                  height: 1,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 8.w),
              TwProgress(
                height: 12.h,
                innerHeight: 8.h,
                width: 94.w,
                progress: MainTreeController.to.curLevelProgress(),
                gradientColors: [Color(0xffFFB52B), Color(0xffFF5F03)],
                bgColor: Color(0xffC18420),
              ),
            ],
          ),
        ),
      );
    });
  }

  leftWidget() {
    double height1 = 20.h;
    double height2 = 0.h;
    double height3 = 60.h;

    return Container(
      width: 180.w,
      height: 300.h,
      child: Column(
        children: [
          SizedBox(height: height1),
          sunWidget(),
          SizedBox(height: height2),
          fertilizeWidget(),
          SizedBox(height: height3),
          spinWidget(),
        ],
      ),
    );
  }

  fertilizeWidget() {
    return Row(
      children: [
        SizedBox(width: 20.w),
        centerItem(
          width: 60.h,
          count: 0,
          icon: Assets.twimg.mainFertilize.path,
          showTxt: false,
          onClick: onAddShiFeiCount,
        ),
      ],
    );
  }

  void onAddShiFeiCount() {
    MainTreeController.to.onAddShiFeiCount();
  }

  sunWidget() {
    double count = 100;

    return Row(
      children: [
        SizedBox(width: 100.w),
        centerItem(
          width: 40.h,
          count: count,
          icon: Assets.twimg.mainSun.path,
          onClick: () {
            MainTreeController.to.onAddMoneyyyy(count);
          },
        ),
      ],
    );
  }

  centerItem({
    required double width,
    required double count,
    required String icon,
    required VoidCallback onClick,
    bool showTxt = true,
    bool txtLocationBottom = true,
  }) {
    Widget txtW = const SizedBox();
    if (showTxt) {
      txtW = Center(
        child: TwTxtBorder(
          text: "+${count.toStringAsFixed(0)}",
          fontSize: 12.sp,
          fontColor: Color(0xffFFD64D),
          foreground: Color(0xff874A00),
          fontWeight: FontWeight.w700,
        ),
      );
    }
    return GestureDetector(
      onTap: onClick,
      child: TwAScale(
        child: Container(
          width: width,
          height: width,
          color: Colors.transparent,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              ShiningEffect(
                duration: Duration(milliseconds: 5000),
                shineColor: Color(0xffffffff),
                opacity: 1,
                angle: -0.9,
                topLeft: false,
                child: Image.asset(
                  icon,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
              txtLocationBottom
                  ? Positioned(left: 0, right: 0, bottom: 0, child: txtW)
                  : Positioned(left: 0, right: 0, top: 0, child: txtW),
            ],
          ),
        ),
      ),
    );
  }

  spinWidget() {
    return Row(
      children: [
        SizedBox(width: 50.w),
        centerItem(
          width: 50.h,
          count: 10,
          showTxt: false,
          icon: Assets.twimg.mainSpin.path,
          onClick: () {},
        ),
      ],
    );
  }

  rightWidget() {
    double height1 = 20.h;
    double height2 = 40.h;
    double height3 = 40.h;

    return Container(
      width: 180.w,
      height: 300.h,
      child: Column(
        children: [
          SizedBox(height: height1),
          waterWidget(),
          SizedBox(height: height2),
          coinWidget(),
          SizedBox(height: height3),
          chuangziWidget(),
        ],
      ),
    );
  }

  waterWidget() {
    return Row(
      children: [
        SizedBox(width: 50.w),
        centerItem(
          width: 60.h,
          count: 10,
          icon: Assets.twimg.mainWater.path,
          showTxt: false,
          onClick: onWater,
        ),
      ],
    );
  }

  void onWater() {
    MainTreeController.to.onAddWaterCount();
  }

  coinWidget() {
    return Row(
      children: [
        SizedBox(width: 90.w),
        centerItem(
          width: 40.h,
          count: 10,
          icon: Assets.twimg.mainWater.path,
          showTxt: false,
          onClick: () {},
        ),
      ],
    );
  }

  chuangziWidget() {
    return Row(
      children: [
        SizedBox(width: 90.w),
        centerItem(
          width: 60.h,
          count: 10,
          icon: Assets.twimg.mainChuanzi.path,
          showTxt: false,
          onClick: () {},
        ),
      ],
    );
  }
}
