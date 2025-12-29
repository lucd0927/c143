import 'package:c143/gen/assets.gen.dart';
import 'package:c143/tw_143/tw_pages/main_spin/views/wheel_details.dart';
import 'package:c143/tw_views/font_border.dart';
import 'package:c143/tw_views/font_gradient_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainSpin extends StatefulWidget {
  const MainSpin({super.key});

  @override
  State<MainSpin> createState() => _MainSpinState();
}

class _MainSpinState extends State<MainSpin> {
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
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: 336.h,
            height: 202.h,
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
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 30.h,
                        color: Colors.red.withValues(alpha: 0.0),
                        child: Center(
                          child: Text(
                            "earn money by completing tasks",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 12.h,),
                      bottomItem(
                        icon: Assets.twimg.spinCheck.path,
                        text: "daily check-in ",
                        text2: "+100",
                        btnText: "Claim",
                      ),
                      bottomItem(
                        icon: Assets.twimg.spinWheelS.path,
                        text: "spin the lucky wheel 20 times",
                        text2: "+100",
                        btnText: "Claim",
                      ),
                      bottomItem(
                        icon: Assets.twimg.spinAd.path,
                        text: "watch 100 ads",
                        text2: "+100",
                        btnText: "Claim",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 100.h),
        ],
      ),
    );
  }

  bottomItem({
    required String icon,
    required String text,
    required String text2,
    required String btnText,
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
          Container(
            width: 72.h,
            height: 28.h,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xffFFA800), Color(0xffF47900)],
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
          SizedBox(width: 8.w),
        ],
      ),
    );
  }

  void onWinbig() {}
}
