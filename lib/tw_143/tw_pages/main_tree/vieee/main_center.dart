import 'package:c143/gen/assets.gen.dart';
import 'package:c143/tw_143/tw_common/lottieeee/common.dart';
import 'package:c143/tw_143/tw_common/overlay/overlay_get_sun.dart';
import 'package:c143/tw_143/tw_common/overlay/overlay_hongbaoyu.dart';
import 'package:c143/tw_143/tw_pages/guide/guide13_spin.dart';
import 'package:c143/tw_143/tw_pages/guide/guide1_water.dart';
import 'package:c143/tw_143/tw_pages/guide/guide2_coin.dart';
import 'package:c143/tw_143/tw_pages/guide/guide4_fertilize.dart';
import 'package:c143/tw_143/tw_pages/main/main_controller.dart';
import 'package:c143/tw_143/tw_pages/main_tree/main_tree.dart';
import 'package:c143/tw_143/tw_pages/main_tree/main_tree_controller.dart';
import 'package:c143/tw_base/tw_ad/ads_idddddC143.dart';
import 'package:c143/tw_base/tw_ad/base_ads.dart';
import 'package:c143/tw_base/tw_ad/guiyin/package.dart';
import 'package:c143/tw_base/tw_gj/audio_playC143.dart';
import 'package:c143/tw_base/tw_gj/ios_h5.dart';
import 'package:c143/tw_base/tw_gj/logC143.dart';
import 'package:c143/tw_base/tw_http/event_report.dart';
import 'package:c143/tw_views/animated_count.dart';
import 'package:c143/tw_views/animated_scale.dart';
import 'package:c143/tw_views/fade_switcher.dart';
import 'package:c143/tw_views/font_border.dart';
import 'package:c143/tw_views/pb_tushi.dart';
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
    double height = maxPinnedHeight - 210.h;
    double bottomTree = maxPinnedHeight - 500.h;
    return Container(
      width: double.infinity,
      height: height,
      color: Colors.amber.withValues(alpha: 0.0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: bottomTree,
            child: Center(
              child: Obx(() {
                EnumTwLottttieJson type = MainTreeController.to.lottieType();
                bool result = MainTreeController.to.curHasWatering.value;
                return GestureDetector(
                  onTap: () {
                    // if(!MainTreeController.to.curHasWatering.value){
                    //   MainTreeController.to.curHasWatering.value = true;
                    //   Future.delayed(Duration(milliseconds: 10000),(){
                    //     MainTreeController.to.curHasWatering.value = false;
                    //   });
                    // }
                  },
                  child: Container(
                    width: 280.h,
                    height: 280.h,
                    child: Stack(
                      children: [
                        TwLottieCommon(type: type, animate: result),

                        Positioned(
                          child: levelWidget(),
                          left: 0,
                          right: 0,
                          bottom: 0.h,
                        ),
                      ],
                    ),
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

          if (TwPackageABC143.isPackageB())
            Positioned(child: h5Widget(), left: 0.w, top: 0.h),
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
        child: Center(child: bottomTxt()),
      ),
    );
  }

  Widget bottomTxt() {
    List<String> tmp = [
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
          fontSize: 11.sp,
          fontWeight: FontWeight.w700,
          height: 1,
          color: Color(0xff603000),
        ),
        textAlign: TextAlign.center,
      );
      chilren.add(item);
    }
    return TwFadeSwitcherC143(children: [...chilren]);
  }

  levelWidget() {
    int curLevel = MainTreeController.to.curLevel.value;
    double progress = MainTreeController.to.curLevelProgress();
    // twLooog("=====progress:$progress");
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
          coinWidget1(),
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
      // twLooog("=====fertilizeWidget showTxt:$showTxt data:$data");
      return Row(
        children: [
          SizedBox(width: 20.w),
          Builder(
            builder: (context) {
              Widget child = centerItem(
                width: 60.h,
                txtTop: leftTime,
                icon: Assets.twimg.mainFertilize.path,
                showAd: false,
                treeType: TwEnumTreeType.fertilize,
                onClick: onAddShiFeiCount,
              );
              // OverlayGuide4Fertilize.guideChild = child;
              // OverlayGuide4Fertilize.guideContext = context;

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

  coinWidget1() {
    return Obx(() {
      String leftTime = TwPackageABC143.isPackageB()
          ? ""
          : MainTreeController.to.curLeftTimeCoin1.value;

      double count = 100;
      bool showSun = MainTreeController.to.showMoneyStatusSunIcon();
      String moneyIcon = MainTreeController.to.moneyIconTreeChild();
      if (showSun) {
        count = 1000;
      }

      if (TwPackageABC143.isPackageB()) {
        count = MainTreeController.to.curCoin1.value;
      }
      bool showFlower = MainTreeController.to.showMoneyStatusFlowerIcon();
      int fraction = TwPackageABC143.isPackageB() ? 2 : 0;
      if (showFlower || showSun) {
        fraction = 0;
      }
      return Row(
        children: [
          SizedBox(width: 100.w),
          centerItem(
            width: 50.h,
            txtBottom: count.toStringAsFixed(fraction),
            txtTop: leftTime,
            treeType: TwEnumTreeType.coin,
            showAd: TwPackageABC143.isPackageB(),
            icon: moneyIcon,
            onClick: () async {
              if (TwPackageABC143.isPackageB()) {
                _onCoinB(coins: count, treeType: TwEnumTreeType.coin);
                return;
              }
              if (showSun) {
                count = 10;
              }
              if (MainTreeController.to.curLeftTimeCoin1.isEmpty) {
                MainTreeController.to.onAddMoneyyyy(
                  count,
                  onEnd: () {
                    MainTreeController.to.resetCoin1Time();
                  },
                );
              } else {
                twToast(text: "You can claim it after the countdown ends");
              }
            },
          ),
        ],
      );
    });
  }

  coinWidget3() {
    return Obx(() {
      String leftTime = TwPackageABC143.isPackageB()
          ? ""
          : MainTreeController.to.curLeftTimeCoin3.value;

      double count = 100;
      bool showSun = MainTreeController.to.showMoneyStatusSunIcon();
      String moneyIcon = MainTreeController.to.moneyIconTreeChild();
      if (showSun) {
        count = 1000;
      }

      if (TwPackageABC143.isPackageB()) {
        count = MainTreeController.to.curCoin3.value;
      }
      bool showAd = TwPackageABC143.isPackageB();
      bool showFlower = MainTreeController.to.showMoneyStatusFlowerIcon();
      int fraction = TwPackageABC143.isPackageB() ? 2 : 0;
      if (showFlower || showSun) {
        fraction = 0;
      }
      return Row(
        children: [
          SizedBox(width: 100.w),
          centerItem(
            width: 50.h,
            txtBottom: count.toStringAsFixed(fraction),
            txtTop: leftTime,
            treeType: TwEnumTreeType.coin3,
            showAd: showAd,
            icon: moneyIcon,
            onClick: () async {
              if (TwPackageABC143.isPackageB()) {
                _onCoinB(coins: count, treeType: TwEnumTreeType.coin3);
                return;
              }
              _onCoinA3(count, showSun);
            },
          ),
        ],
      );
    });
  }

  _onCoinB({required double coins, required TwEnumTreeType treeType}) async {
    bool result = await TwCommonAds().showRewardAd(
      adPosId: TwAdsPosId.cuvxv_bubble_rv,
    );
    if (!result) {
      return;
    }

    bool showSun = MainTreeController.to.showMoneyStatusSunIcon();
    bool showFlower = MainTreeController.to.showMoneyStatusFlowerIcon();
    String type = "cash";
    if (showSun || showFlower) {
      twLooog("===coins=${coins} showSun:$showSun");
      if (showSun) {
        coins = coins / MainTreeController.stageBeisuNum;
        type = "sun";
      } else if (showFlower) {
        coins = coins / MainTreeController.stageBeisu2Num;
        type = "flower";
      }
      twLooog("===coins=${coins} showFlower:$showFlower");
      OverlayGetSun().show(
        coins: coins,
        onClose: () {
          if (treeType == TwEnumTreeType.coin) {
            MainTreeController.to.resetCoin1Time();
          } else if (treeType == TwEnumTreeType.coin2Guide) {
            MainTreeController.to.resetCoin2Time();
          } else if (treeType == TwEnumTreeType.coin3) {
            MainTreeController.to.resetCoin3Time();
          }
        },
      );
    } else {
      MainTreeController.to.onAddMoneyyyy(
        coins,
        onEnd: () {
          if (treeType == TwEnumTreeType.coin) {
            MainTreeController.to.resetCoin1Time();
          } else if (treeType == TwEnumTreeType.coin2Guide) {
            MainTreeController.to.resetCoin2Time();
          } else if (treeType == TwEnumTreeType.coin3) {
            MainTreeController.to.resetCoin3Time();
          }
        },
      );
    }
    TwMaiDiannnn.bubble_click(type);
  }

  _onCoinA3(double count, bool showSun) {
    if (showSun) {
      count = 10;
    }
    if (MainTreeController.to.curLeftTimeCoin3.isEmpty) {
      MainTreeController.to.onAddMoneyyyy(
        count,
        onEnd: () {
          MainTreeController.to.resetCoin3Time();
        },
      );
    } else {
      twToast(text: "You can claim it after the countdown ends");
    }
  }

  centerItem({
    required double width,
    String? txtBottom,
    String? txtTop,
    required String icon,
    required VoidCallback onClick,
    required TwEnumTreeType treeType,
    required bool showAd,
  }) {
    Widget txtWB = const SizedBox();
    Widget txtWT = const SizedBox();
    bool txtLocationBottom = txtBottom != null && txtBottom.isNotEmpty;
    bool txtLocationTop = txtTop != null && txtTop.isNotEmpty;
    if (txtLocationBottom) {
      txtWB = Center(
        child: TwTxtBorderC143(
          text: "+${txtBottom}",
          fontSize: 12.sp,
          fontColor: Color(0xffFFD64D),
          foreground: Color(0xff874A00),
          fontWeight: FontWeight.w700,
        ),
      );
    }
    if (txtLocationTop) {
      txtWT = Center(
        child: TwTxtBorderC143(
          text: "${txtTop}",
          fontSize: 10.sp,

          fontWeight: FontWeight.w700,
        ),
      );
    }

    return GestureDetector(
      onTap: onClick,
      child: TwAScaleC143(
        maxS: 1,
        minS: 0.7,
        child: Builder(
          builder: (context) {
            Widget child = Container(
              width: width,
              height: width,
              color: Colors.transparent,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: width,
                    height: width,
                    child: TwShiningEffect(
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
                  ),
                  if (txtLocationBottom)
                    Positioned(left: 0, right: 0, bottom: 0, child: txtWB),
                  if (txtLocationTop)
                    Positioned(left: 0, right: 0, top: 0, child: txtWT),

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
            );
            if (treeType == TwEnumTreeType.water) {
              OverlayGuide1Water.guideChild = child;
              OverlayGuide1Water.guideContext = context;
            } else if (treeType == TwEnumTreeType.coin2Guide) {
              OverlayGuide2Coin.guideChild = child;
              OverlayGuide2Coin.guideContext = context;
            } else if (treeType == TwEnumTreeType.fertilize) {
              OverlayGuide4Fertilize.guideChild = child;
              OverlayGuide4Fertilize.guideContext = context;
            }
            return child;
          },
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

              icon: Assets.twimg.mainSpin.path,
              onClick: () {
                MainController.to.resetIndex(MainController.spinindexxx);
              },
              txtBottom: '',
            );

            OverlayGuide13Spin.guideChild = child;
            OverlayGuide13Spin.guideContext = context;

            return child;
          },
        ),
      ],
    );
  }

  h5Widget() {
    return Row(
      children: [
        SizedBox(width: 30.w),
        Builder(
          builder: (context) {
            Widget child = centerItem(
              showAd: false,
              treeType: TwEnumTreeType.h5,
              width: 50.h,

              icon: Assets.twimgB.moreGame.path,
              onClick: () {
                TwIosH5C143().showWvC143();
              },
              txtBottom: '',
            );

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
          coinWidget2(),
          SizedBox(height: height3),
          coinWidget3(),
          // coinYuWidget()
        ],
      ),
    );
  }

  waterWidget() {
    String? data = MainTreeController.to.guideIndexData();
    // twLooog("====waterWidget==data:$data");
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
              txtBottom: '',
              icon: Assets.twimg.mainWater.path,

              onClick: onWater,
            );
            // OverlayGuide1Water.guideChild = child;
            // OverlayGuide1Water.guideContext = context;
            return child;
          },
        ),
      ],
    );
  }

  void onWater() async {
    MainTreeController.to.onAddWaterCount(onEnd: () {}, showAd: true);
  }

  coinWidget2() {
    return Obx(() {
      String leftTime = TwPackageABC143.isPackageB()
          ? ""
          : MainTreeController.to.curLeftTimeCoin2.value;
      double count = 100;
      String? data = MainTreeController.to.guideIndexData();

      bool showSun = MainTreeController.to.showMoneyStatusSunIcon();
      String moneyIcon = MainTreeController.to.moneyIconTreeChild();
      if (showSun) {
        count = 1000;
      }

      if (TwPackageABC143.isPackageB()) {
        count = MainTreeController.to.curCoin2.value;
        bool showFirstCount = data == MainTreeController.guide1;
        if (showFirstCount) {
          count = 2;
        }
      }

      bool showFlower = MainTreeController.to.showMoneyStatusFlowerIcon();
      int fraction = TwPackageABC143.isPackageB() ? 2 : 0;
      if (showFlower || showSun) {
        fraction = 0;
      }
      bool showAd = TwPackageABC143.isPackageB();
      return Row(
        children: [
          SizedBox(width: 90.w),
          Builder(
            builder: (context) {
              Widget child = centerItem(
                showAd: showAd,
                txtTop: leftTime,
                treeType: TwEnumTreeType.coin2Guide,
                width: 60.h,
                txtBottom: count.toStringAsFixed(fraction),
                icon: moneyIcon,

                onClick: () async {
                  if (TwPackageABC143.isPackageB()) {
                    _onCoinB(coins: count, treeType: TwEnumTreeType.coin2Guide);
                    return;
                  }
                  if (showSun) {
                    count = 10;
                  }
                  if (MainTreeController.to.curLeftTimeCoin2.isEmpty) {
                    MainTreeController.to.onAddMoneyyyy(
                      count,
                      onEnd: () {
                        MainTreeController.to.resetCoin2Time();
                      },
                    );
                  } else {
                    twToast(text: "You can claim it after the countdown ends");
                  }
                },
              );

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
          txtBottom: count.toStringAsFixed(0),
          icon: Assets.twimg.mainCoinYu.path,

          onClick: () {
            OverlayHongbaoyu().show(onEnd: () {});
          },
        ),
      ],
    );
  }
}
