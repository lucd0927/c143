import 'package:c143/gen/assets.gen.dart';
import 'package:c143/tw_143/tw_common/lottieeee/common.dart';
import 'package:c143/tw_143/tw_common/overlay/overlay_hongbaoyu.dart';
import 'package:c143/tw_143/tw_pages/guide/guide13_spin.dart';
import 'package:c143/tw_143/tw_pages/guide/guide1_water.dart';
import 'package:c143/tw_143/tw_pages/guide/guide2_coin.dart';
import 'package:c143/tw_143/tw_pages/guide/guide4_fertilize.dart';
import 'package:c143/tw_143/tw_pages/main/main_controller.dart';
import 'package:c143/tw_143/tw_pages/main_tree/main_tree_controller.dart';
import 'package:c143/tw_base/tw_ad/ads_idddddC143.dart';
import 'package:c143/tw_base/tw_ad/base_ads.dart';
import 'package:c143/tw_base/tw_gj/logC143.dart';
import 'package:c143/tw_views/animated_count.dart';
import 'package:c143/tw_views/animated_scale.dart';
import 'package:c143/tw_views/fade_switcher.dart';
import 'package:c143/tw_views/font_border.dart';
import 'package:c143/tw_views/shimmer_effect.dart';
import 'package:c143/tw_views/tw_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
      height: 290.h,
      color: Colors.amber.withValues(alpha: 0.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 10.h,
            child: Center(
              child: Obx(() {
                String icon = MainTreeController.to.treeIcon();
                EnumTwLottttieJson type = MainTreeController.to.lottieType();
                bool result = MainTreeController.to.curHasWatering.value;
                return Container(
                  width: 280.h,
                  height: 280.h,
                  child: Stack(
                    children: [
                      TwLottieCommon(type: type, animate: result),

                      // Image.asset(
                      //           icon,
                      //           width: 280.h,
                      //           height: 280.h,
                      //           gaplessPlayback: true,
                      //         ),
                      Positioned(
                        child: levelWidget(),
                        left: 0,
                        right: 0,
                        bottom: 0.h,
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
          Positioned(child: leftWidget(), left: 0, top: 0, bottom: 0),
          Positioned(child: rightWidget(), right: 0, top: 0, bottom: 0),

          Positioned(
            child: textCongratulationWidget(),
            left: 0,
            right: 0,
            bottom: -10.h,
          ),
        ],
      ),
    );
  }


  textCongratulationWidget() {
    return Center(
      child: Container(
        width: 312.w,
        height: 28.h,
        decoration: BoxDecoration(
          color: Color(0xffffffff).withValues(alpha: 0.4),
          borderRadius: BorderRadius.circular(28.h),
          border: Border.all(color: Color(0xffFFE345)),
        ),
        child: Center(
          child: bottomTxt(),
        ),
      ),
    );
  }

  Widget bottomTxt() {
    List<String> tmp =[
      "Nice one! Your coin journey has begun!",
      "You’ve earned your first pot of gold! Keep collecting coins!",
      "Every tap brings you one step closer to your goal!",
    ];

    int length = tmp.length;
    List<Widget> chilren = [];
    for (int i = 0; i < length; i++) {
      Widget item = Text(
        tmp[i],
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w700,
          height: 1,
          color: Color(0xff603000),
        ),
      );
      chilren.add(item);
    }
    return TwFadeSwitcherC143(children: [...chilren]);
  }

  levelWidget() {
    int curLevel = MainTreeController.to.curLevel.value;
    double progress = MainTreeController.to.curLevelProgress();
    twLooog("=====progress:$progress");
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
            Expanded(
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  double maxWidth = constraints.maxWidth;

                  return TwProgressC143(
                    height: 12.h,
                    innerHeight: 8.h,
                    width: maxWidth,
                    progress: progress,
                    gradientColors: [Color(0xffFFB52B), Color(0xffFF5F03)],
                    bgColor: Color(0xffC18420),
                  );
                },
              ),
            ),
            SizedBox(width: 4.w),
          ],
        ),
      ),
    );
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
    return Obx(() {
      String leftTime = MainTreeController.to.curFertilizeLeftTime.value;
      String? data = MainTreeController.to.guideIndexData();
      bool showTxt = data != MainTreeController.guide3;
      twLooog("=====fertilizeWidget showTxt:$showTxt data:$data");
      return Row(
        children: [
          SizedBox(width: 20.w),
          Builder(
            builder: (context) {
              Widget child = centerItem(
                width: 60.h,
                count: leftTime,
                icon: Assets.twimg.mainFertilize.path,
                showTxt: showTxt,
                showAd: false,
                txtLocationBottom: false,
                treeType: TwEnumTreeType.fertilize,
                onClick: onAddShiFeiCount,
              );
              OverlayGuide4Fertilize.guideChild = child;
              OverlayGuide4Fertilize.guideContext = context;

              return child;
            },
          ),
        ],
      );
    });
  }

  void onAddShiFeiCount() async {
    MainTreeController.to.onAddShiFeiCount(onEnd: () {});
  }

  sunWidget() {
    return Obx(() {
      double count = 100;
      bool showSun = MainTreeController.to.showStage2();
      if(showSun){
        count = 1000;
      }
      return Row(
        children: [
          SizedBox(width: 100.w),
          centerItem(
            width: 50.h,
            count: count.toStringAsFixed(0),
            treeType: TwEnumTreeType.sun,
            showAd: true,
            icon: showSun
                ? Assets.twimg.mainSun.path
                : Assets.twimg.mainCoin.path,
            onClick: () async {
              bool result = await TwCommonAds().showInterstitialAd(
                adPosId: TwAdsPosId.test,
              );
              if (!result) {
                return;
              }
              if(showSun){
                count = 10;
              }
              MainTreeController.to.onAddMoneyyyy(count);
            },
          ),
        ],
      );
    });
  }

  centerItem({
    required double width,
    required String count,
    required String icon,
    required VoidCallback onClick,
    required TwEnumTreeType treeType,
    required bool showAd,
    bool showTxt = true,
    bool txtLocationBottom = true,
  }) {
    Widget txtW = const SizedBox();
    if (showTxt) {
      if (treeType == TwEnumTreeType.fertilize) {
        txtW = Center(
          child: TwTxtBorderC143(
            text: "${count}",
            fontSize: 10.sp,

            fontWeight: FontWeight.w700,
          ),
        );
      } else {
        txtW = Center(
          child: TwTxtBorderC143(
            text: "+${count}",
            fontSize: 12.sp,
            fontColor: Color(0xffFFD64D),
            foreground: Color(0xff874A00),
            fontWeight: FontWeight.w700,
          ),
        );
      }
    }

    return GestureDetector(
      onTap: onClick,
      child: TwAScaleC143(
        child: Container(
          width: width,
          height: width,
          color: Colors.transparent,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              TwShiningEffect(
                duration: Duration(milliseconds: 2000),
                shineColor: Color(0xffffffff),
                opacity: 1,
                angle: -0.9,
                topLeft: false,
                child: Image.asset(
                  icon,
                  width: double.infinity,
                  height: double.infinity,
                  gaplessPlayback: true,
                ),
              ),
              txtLocationBottom
                  ? Positioned(left: 0, right: 0, bottom: 0, child: txtW)
                  : Positioned(left: 0, right: 0, top: 0, child: txtW),

              if (showAd)
                Positioned(
                  top: -10.h,
                  right: -5.h,
                  child: Image.asset(
                    Assets.twimg.ad.path,
                    width: 28.h,
                    height: 28.h,
                  ),
                ),
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
        Builder(
          builder: (context) {
            Widget child = centerItem(
              showAd: false,
              treeType: TwEnumTreeType.spin,
              width: 50.h,
              showTxt: false,
              icon: Assets.twimg.mainSpin.path,
              onClick: () {
                MainController.to.resetIndex(MainController.spinindexxx);
              },
              count: '',
            );

            OverlayGuide13Spin.guideChild = child;
            OverlayGuide13Spin.guideContext = context;

            return child;
          },
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
          sunWidget(),
          // coinYuWidget()
        ],
      ),
    );
  }

  waterWidget() {
    String? data = MainTreeController.to.guideIndexData();
    twLooog("====waterWidget==data:$data");
    bool showAd = data != null;
    showAd = true;
    return Row(
      children: [
        SizedBox(width: 50.w),
        Builder(
          builder: (context) {
            Widget child = centerItem(
              showAd: showAd,
              treeType: TwEnumTreeType.water,
              width: 60.h,
              count: '',
              icon: Assets.twimg.mainWater.path,
              showTxt: false,
              onClick: onWater,
            );
            OverlayGuide1Water.guideChild = child;
            OverlayGuide1Water.guideContext = context;
            return child;
          },
        ),
      ],
    );
  }

  void onWater() async {
    MainTreeController.to.onAddWaterCount(onEnd: () {});
  }

  coinWidget() {
    return Obx(() {
      double count = 100;
      bool showSun = MainTreeController.to.showStage2();
      String? data = MainTreeController.to.guideIndexData();
      bool showAd = data != MainTreeController.guide1;
      twLooog("====coinWidget==data:$data showAd:$showAd");
      if(showSun){
        count = 1000;
      }
      showAd = true;
      return Row(
        children: [
          SizedBox(width: 90.w),
          Builder(
            builder: (context) {
              Widget child = centerItem(
                showAd: showAd,

                treeType: TwEnumTreeType.coin,
                width: 60.h,
                count: count.toStringAsFixed(0),
                icon: showSun
                    ? Assets.twimg.mainSun.path
                    : Assets.twimg.mainCoin.path,
                showTxt: true,
                onClick: () async {
                  bool result = await TwCommonAds().showInterstitialAd(
                    adPosId: TwAdsPosId.test,
                  );
                  if (!result) {
                    return;
                  }
                  if(showSun){
                    count = 10;
                  }
                  MainTreeController.to.onAddMoneyyyy(count);
                },
              );
              OverlayGuide2Coin.guideChild = child;
              OverlayGuide2Coin.guideContext = context;

              return child;
            },
          ),
        ],
      );
    });
  }

  coinYuWidget() {
    int count = 10;
    return Row(
      children: [
        SizedBox(width: 90.w),
        centerItem(
          showAd: false,
          treeType: TwEnumTreeType.coin_rain,
          width: 60.h,
          count: count.toStringAsFixed(0),
          icon: Assets.twimg.mainCoinYu.path,
          showTxt: false,
          onClick: () {
            OverlayHongbaoyu().show();
          },
        ),
      ],
    );
  }
}
