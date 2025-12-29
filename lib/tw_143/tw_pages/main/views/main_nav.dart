import 'package:c143/gen/assets.gen.dart';
import 'package:c143/tw_143/tw_pages/main/main_controller.dart';
import 'package:c143/tw_views/font_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

double bottomNavHeight = 76.h;
double bottomSafeHeight = ScreenUtil().bottomBarHeight;
double bottomNavRealHeight = bottomNavHeight + bottomSafeHeight;

class MainNav extends StatefulWidget {
  const MainNav({super.key});

  @override
  State<MainNav> createState() => _MainNavState();
}

class _MainNavState extends State<MainNav> {
  double screenWidth = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    screenWidth = ScreenUtil().screenWidth;
  }

  @override
  Widget build(BuildContext context) {
    // bottomSafeHeight =0;
    return Obx(() {
      return Container(
        height: bottomNavRealHeight,
        decoration: BoxDecoration(
          color: Color(0xff2F2B30).withValues(alpha: 0),
        ),
        padding: EdgeInsets.only(bottom: 0, top: 0.h),
        child: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _navItem(
                    icon: Assets.twimg.mainNavTreeUn.path,
                    icon2: Assets.twimg.mainNavTree.path,
                    index: MainController.treeIndex,
                    text: "home".tr,
                  ),
                  _navItem(
                    icon: Assets.twimg.mainNavQuizUn.path,
                    icon2: Assets.twimg.mainNavQuiz.path,
                    index: MainController.quizIndex,
                    text: "home".tr,
                  ),
                  _navItem(
                    icon: Assets.twimg.mainNavSpinUn.path,
                    icon2: Assets.twimg.mainNavSpin.path,
                    index: MainController.wheelIndex,
                    text: "home".tr,
                  ),

                ],
              ),
            ),
            Container(
              color: Color(0xff2F2B30),
              height: bottomSafeHeight + 4.h,
              width: double.infinity,
            ),
          ],
        ),
      );
    });
  }

  _navItem({
    required String icon,
    required String icon2,
    required int index,
    required String text,
  }) {
    double maxWidth = screenWidth / 3;
    final int curIndex = MainController.to.curMainNavIndex.value;
    bool select = index == curIndex;
    double width = select ? 120.w : 120.w;
    double height = select ? 72.h : 64.h;
    String tmpIcon = select ? icon2 : icon;
    return InkWell(
      onTap: () {
        print("index:$index");
        MainController.to.resetIndex(index);
      },
      child: Container(
        width: maxWidth,
        color: Color(0xff2F2B30).withValues(alpha: 0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                width: double.infinity,
                color: Colors.blue.withValues(alpha: 0),
                child: Center(
                  child: Image.asset(
                    tmpIcon,
                    width: width,
                    height: height,
                    fit: BoxFit.fill,
                    gaplessPlayback: true,
                  ),
                ),
              ),
            ),
            // Positioned(
            //   bottom: -4.h,
            //   left: 0,
            //   right: 0,
            //   child: Center(
            //     child: TwTxtBorder(
            //       text: text,
            //       fontWeight: FontWeight.w600,
            //       fontSize: 14.sp,
            //       fontColor: select ? Color(0xffFFEE36) : Color(0xffFFF9E7),
            //       foreground: Color(0xff9E5616),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
