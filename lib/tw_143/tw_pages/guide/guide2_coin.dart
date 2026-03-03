import 'package:auto_size_text/auto_size_text.dart';
import 'package:c143/gen/assets.gen.dart';
import 'package:c143/tw_143/tw_common/lottieeee/common.dart';
import 'package:c143/tw_143/tw_common/lottieeee/gesture.dart';
import 'package:c143/tw_143/tw_pages/guide/guide1_water.dart';
import 'package:c143/tw_143/tw_pages/guide/guide3_adspot.dart';
import 'package:c143/tw_143/tw_pages/main_tree/main_tree_controller.dart';
import 'package:c143/tw_base/tw_ad/ads_idddddC143.dart';
import 'package:c143/tw_base/tw_ad/base_ads.dart';
import 'package:c143/tw_base/tw_ad/guiyin/package.dart';
import 'package:c143/tw_base/tw_gj/countryC143.dart';
import 'package:c143/tw_base/tw_gj/logC143.dart';
import 'package:c143/tw_base/tw_gj/overlay_manager.dart';
import 'package:c143/tw_views/animated_count.dart';
import 'package:c143/tw_views/animated_scale.dart';
import 'package:c143/tw_views/shimmer_effect.dart';
import 'package:c143/tw_views/tw_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../main_tree/main_tree.dart' show maxPinnedHeight;

class OverlayGuide2Coin {
  static BuildContext? guideContext;
  static Widget? guideChild;

  OverlayEntry? _overlayEntry;

  ///是否真正显示
  bool get isShowing => _isShowing;
  bool _isShowing = false;

  void show() {
    _overlayEntry = null;

    Widget child = Material(
      color: Colors.transparent,
      child: Guide2CoinWidget(
        guideChild: guideChild!,
        guideContext: guideContext!,
        onClose: () async {
          close();
          MainTreeController.to.saveGuideIndexData(MainTreeController.guide2);
          double coins = 10;
          if (TwPackageABC143.isPackageB()) {
            // coins = 2;
            // await TwCommonAds().showInterstitialAd(
            //   adPosId: TwAdsPosId.cuvxv_newadview_rv,
            // );
          }

          OverlayGuide3AdSpot().show(coins: coins);
        },
      ),
    );
    kHashCode = OverlayManager.show(context: guideContext!, child: child);

    _isShowing = true;
  }

  String kHashCode = "";

  void close() {
    _isShowing = false;
    _overlayEntry?.remove();
    OverlayManager.clearOverlayEntry(kHashCode);
  }
}

class Guide2CoinWidget extends StatefulWidget {
  const Guide2CoinWidget({
    super.key,
    required this.guideChild,
    required this.guideContext,
    required this.onClose,
  });

  final Widget guideChild;
  final BuildContext guideContext;
  final VoidCallback onClose;

  @override
  State<Guide2CoinWidget> createState() => _Guide2CoinWidgetState();
}

class _Guide2CoinWidgetState extends State<Guide2CoinWidget> {
  int index = 0;

  bool showAnimated = false;
  Duration animD = Duration(milliseconds: 200);
  double startScale = 0.8;
  double coin = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          showAnimated = true;
          coin = 10;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: animD,
      color: Colors.black.withValues(alpha: showAnimated ? overlayOpacity : 0),
      child: AnimatedScale(
        duration: animD,
        scale: showAnimated ? 1.0 : startScale,
        child: SizedBox(
          width: ScreenUtil().screenWidth,
          height: ScreenUtil().screenHeight,
          child: IndexedStack(
            index: index,
            children: [
              GestureDetector(
                onTap: () {
                  widget.onClose();
                },
                child: GuideWidget(
                  guideChild: widget.guideChild,
                  guideContext: widget.guideContext,
                  coin: coin,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GuideWidget extends StatelessWidget {
  const GuideWidget({
    super.key,
    required this.guideChild,
    required this.guideContext,
    required this.coin,
  });

  final Widget guideChild;
  final BuildContext guideContext;
  final double coin;

  @override
  Widget build(BuildContext context) {
    RenderBox box = guideContext.findRenderObject() as RenderBox;
    double height = maxPinnedHeight - 210.h;
    double bottomTree = maxPinnedHeight - 500.h;
    var topLeftPosition = box.localToGlobal(Offset.zero);
    return Container(
      color: Colors.transparent,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: TwPackageABC143.isPackageB() ? 206.h : 190.h,
            child: Container(
              width: double.infinity,
              height: height,
              color: Colors.amber.withValues(alpha: 0.0),
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: bottomTree,
                    child: Center(
                      child: Obx(() {
                        EnumTwLottttieJson type = MainTreeController.to
                            .lottieType();
                        bool result =
                            MainTreeController.to.curHasWatering.value;
                        return Container(
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
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: topLeftPosition.dx,
            top: topLeftPosition.dy,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                IgnorePointer(
                  child: Container(
                    width: 60.h,
                    height: 60.h,
                    child: TwShiningEffect(
                      duration: Duration(milliseconds: 2000),
                      shineColor: Color(0xffffffff),
                      opacity: 1,
                      angle: -0.9,
                      topLeft: false,
                      child: Image.asset(
                        MainTreeController.to.moneyIconTreeChild(),
                        width: double.infinity,
                        height: double.infinity,
                        gaplessPlayback: true,
                      ),
                    ),
                  ),
                ),
                // if (TwPackageABC143.isPackageB())
                //   Positioned(
                //     top: -10.h,
                //     right: -5.h,
                //     child: Image.asset(
                //       Assets.twimg.ad.path,
                //       width: 28.h,
                //       height: 28.h,
                //     ),
                //   ),
                Positioned(
                  top: 40.h,
                  left: 30.w,
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

        Positioned(
            top:  TwPackageABC143.isPackageB()?90.h:110.h,
            right: 0,
            left: 0,
            child: Center(
              child: Image.asset(
                TwPackageABC143.isPackageB()
                    ? Assets.twimg0302.guide2Tree.path
                    : Assets.twimg.guide2cointips.path,
                width: 324.h,
                height: 160.h,
                fit: BoxFit.fill,
              ),
            ),
          ),
         if(!TwPackageABC143.isPackageB()) Positioned(
            left: 130.w,
            top: 210.h,
            child: IgnorePointer(
              child: Container(
                width: 55.w,
                height: 30.h,
                color: Colors.white.withValues(alpha: 0.0),
                child: TwAnimatedCountttt(
                  value: coin,
                  fractionDigits: 0,
                  prefix: "${TwCountryyC143.curCountryyyySymbolC143()}",
                  duration: Duration(milliseconds: 1000),

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
                    fontSize: 24.sp,
                    color: Color(0xffFFDF12),
                    fontWeight: FontWeight.w900,
                    height: 1,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
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
            SizedBox(width: 8.w),
          ],
        ),
      ),
    );
  }
}
