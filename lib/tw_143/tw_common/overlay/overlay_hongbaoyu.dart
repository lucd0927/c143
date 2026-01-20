import 'dart:async';
import 'dart:math';

import 'package:c143/gen/assets.gen.dart';
import 'package:c143/sfcj/floating_particles/src/models/direction.dart';
import 'package:c143/sfcj/floating_particles/src/models/particle_config.dart';
import 'package:c143/sfcj/floating_particles/src/models/particle_type.dart';
import 'package:c143/sfcj/floating_particles/src/widgets/particle_effects_widget.dart';
import 'package:c143/tw_143/tw_common/base_number.dart';
import 'package:c143/tw_143/tw_common/lottieeee/gesture.dart';
import 'package:c143/tw_143/tw_common/overlay/overlay_get.dart';
import 'package:c143/tw_143/tw_common/view/cross_confetti.dart';
import 'package:c143/tw_143/tw_common/view/progress.dart';
import 'package:c143/tw_143/tw_pages/guide/guide0_bguide.dart';
import 'package:c143/tw_143/tw_pages/guide/guide1_water.dart';
import 'package:c143/tw_143/tw_pages/main_spin/main_spin_controller.dart';
import 'package:c143/tw_143/tw_pages/main_tree/main_tree_controller.dart';
import 'package:c143/tw_base/tw_ad/ads_idddddC143.dart';
import 'package:c143/tw_base/tw_ad/base_ads.dart';
import 'package:c143/tw_base/tw_ad/guiyin/package.dart';
import 'package:c143/tw_base/tw_gj/countryC143.dart';
import 'package:c143/tw_base/tw_gj/logC143.dart';
import 'package:c143/tw_base/tw_http/event_report.dart';
import 'package:c143/tw_hive/twhiveC143.dart';
import 'package:c143/tw_views/animated_count.dart';
import 'package:c143/tw_views/animated_fly.dart';
import 'package:c143/tw_views/font_border.dart';
import 'package:c143/tw_views/font_gradient_border.dart';
import 'package:c143/tw_views/shimmer_effect.dart';
import 'package:c143/tw_views/tw_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shiny_striped_progress_bar/shiny_striped_progress_bar.dart';

class OverlayHongbaoyu {
  OverlayEntry? _overlayEntry;

  ///是否真正显示
  bool get isShowing => _isShowing;
  bool _isShowing = false;

  void show({required VoidCallback onEnd}) {
    _overlayEntry = null;

    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Material(
          color: Colors.transparent,
          child: _hongbaoyuuu(
            onClose: (value) async {
              close();
              if (TwPackageABC143.isPackageB()) {
                onEnd();
                return;
              }
              if (value <= 0) {
                onEnd();
                return;
              }
              OverlayGetCoins().show(
                coins: value,
                onBtn: () {
                  onEnd();
                },
                onClose: () {
                  onEnd();
                },
                type: TwEnumGetCoinsType.hongbaoRainMoney,
              );
            },
          ),
        );
      },
    );
    Overlay.of(Get.context!).insert(_overlayEntry!);
    _isShowing = true;
  }

  void close() {
    _isShowing = false;
    _overlayEntry?.remove();
  }
}

class _hongbaoyuuu extends StatefulWidget {
  const _hongbaoyuuu({required this.onClose});

  final ValueChanged<double> onClose;

  @override
  State<_hongbaoyuuu> createState() => _hongbaoyuuuState();
}

class _hongbaoyuuuState extends State<_hongbaoyuuu> {
  var box = TwHive.box;
  String twkeyFirst = "asfd6asf12d444Bbb";

  int index = 0;

  bool showAnimated = false;
  Duration animD = Duration(milliseconds: 200);
  double startScale = 0.8;

  Timer? _cutdownTimer;
  Timer? _jishiTimer;
  int maxTimer = 15;

  double getCoins = 0;

  bool hasFirst() {
    if (TwPackageABC143.isPackageB()) {
      return box.get(twkeyFirst) ?? true;
    }
    return false;
  }

  bool _hongbaoRainEnd = false;
  bool _hongbaoWinPop = false;
  int daojishiCount = 3;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    TwMaiDiannnn.cash_rain_start();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        MainSpinController.to.onCashRainCount();
        setState(() {
          showAnimated = true;
        });
        bool _hasF = hasFirst();
        if (_hasF) {
        } else {
          initJishiTimer();
        }
      }
    });
  }

  initJishiTimer() {
    _jishiTimer?.cancel();
    _jishiTimer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      int itke = timer.tick;

      if (itke >= 3) {
        _jishiTimer?.cancel();
        setState(() {
          daojishiCount = 0;
          initCutdownTimer();
        });
      } else {
        if (mounted) {
          setState(() {
            daojishiCount = daojishiCount - 1;
            if (daojishiCount <= 0) {
              daojishiCount = 0;
            }
            twLooog("====daojishiCount:$daojishiCount");
          });
        }
      }
    });
  }

  double progress = 0;
  String timeText = "";

  String _formatDuration(int seconds) {
    if (seconds <= 0) {
      return "";
    }

    Duration duration = Duration(seconds: seconds);
    String twoDigits(int n) => n.toString().padLeft(2, '0');

    String hours = twoDigits(duration.inHours);
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String secs = twoDigits(duration.inSeconds.remainder(60));

    return '$hours:$minutes:$secs';
  }

  initCutdownTimer() {
    _cutdownTimer?.cancel();
    timeText = _formatDuration(maxTimer);
    _cutdownTimer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      int tick = timer.tick;
      int left = maxTimer - tick;
      if (left < 0) {
        left = 0;
      }
      timeText = _formatDuration(left);
      if (tick >= maxTimer) {
        timer.cancel();
        if (mounted) {
          setState(() {
            progress = 1;
            _hongbaoRainEnd = true;
            _hongbaoWinPop = true;
          });
        }

        if (!TwPackageABC143.isPackageB()) {
          widget.onClose(getCoins);
        }
      } else {
        if (mounted) {
          setState(() {
            progress = tick / maxTimer;
            if (progress >= 1) {
              progress = 1;
            }
          });
        }
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
        child: Container(
          width: ScreenUtil().screenWidth,
          height: ScreenUtil().screenHeight,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xffAF00D2).withValues(alpha: 0.7),
                Color(0xffAF00D2).withValues(alpha: 0.0),
                Color(0xffffffff).withValues(alpha: 0.0),
                Color(0xff003AD9).withValues(alpha: 0.8),
              ],
              stops: [0, 0.1, 0.9, 1],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: TwPackageABC143.isPackageB()
              ? (_hongbaoRainEnd
                    ? (_hongbaoWinPop ? _rainWinWidget() : _rainEndWidget())
                    : (daojishiCount == 0
                          ? _hongbaoyuWidget()
                          : _guideWidget()))
              : _hongbaoyuWidget(),
        ),
      ),
    );
  }

  Widget btnPlayAgainClaim() {
    return Center(
      child: GestureDetector(
        onTap: _onPlayAgain,
        child: Container(
          width: 260.h,
          height: 56.h,
          clipBehavior: Clip.none,
          color: Colors.black.withValues(alpha: 0.0),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Image.asset(
                Assets.twimg.btnSpin.path,
                width: 260.h,
                height: 56.h,
                fit: BoxFit.fill,
              ),
              Center(
                child: TwTxtBorderC143(
                  text: "Play Again",
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w900,
                  fontColor: Color(0xffffffff),
                  foreground: Color(0xff22431B),
                ),
              ),
              if (TwPackageABC143.isPackageB())
                Positioned(
                  top: -10.h,
                  right: -5.h,
                  child: Image.asset(
                    Assets.twimg.ad.path,
                    width: 28.h,
                    height: 28.h,
                  ),
                ),
              Positioned(top: 36.h, right: 0.w, child: TwLottieGesture()),
            ],
          ),
        ),
      ),
    );
  }

  Widget btnWinClaim() {
    return Center(
      child: GestureDetector(
        onTap: _onBtnWin,
        child: Container(
          width: 260.h,
          height: 56.h,
          clipBehavior: Clip.none,
          color: Colors.black.withValues(alpha: 0.0),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Image.asset(
                Assets.twimg.btnSpin.path,
                width: 260.h,
                height: 56.h,
                fit: BoxFit.fill,
              ),
              Center(
                child: TwTxtBorderC143(
                  text: "Claim",
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w900,
                  fontColor: Color(0xffffffff),
                  foreground: Color(0xff22431B),
                ),
              ),
              if (TwPackageABC143.isPackageB())
                Positioned(
                  top: -10.h,
                  right: -5.h,
                  child: Image.asset(
                    Assets.twimg.ad.path,
                    width: 28.h,
                    height: 28.h,
                  ),
                ),
              Positioned(top: 36.h, right: 0.w, child: TwLottieGesture()),
            ],
          ),
        ),
      ),
    );
  }

  Widget btnClaim() {
    return Center(
      child: GestureDetector(
        onTap: onStartEarning,
        child: Container(
          width: 260.h,
          height: 56.h,
          clipBehavior: Clip.none,
          color: Colors.black.withValues(alpha: 0.0),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Image.asset(
                Assets.twimg.btnSpin.path,
                width: 260.h,
                height: 56.h,
                fit: BoxFit.fill,
              ),
              Center(
                child: TwTxtBorderC143(
                  text: "Start Earning",
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w900,
                  fontColor: Color(0xffffffff),
                  foreground: Color(0xff22431B),
                ),
              ),

              Positioned(
                top: 30.h,
                right: 30.w,
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
      ),
    );
  }

  void onStartEarning() {
    box.put(twkeyFirst, false);
    setState(() {
      initJishiTimer();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _cutdownTimer?.cancel();
    _jishiTimer?.cancel();
  }

  _hongbaoyuWidget() {
    return Stack(
      // index: index,
      children: [
        // Image.asset(
        //   Assets.twimgB.moneyRainBg.path,
        //   width: double.infinity,
        //   height: double.infinity,
        //   fit: BoxFit.fill,
        // ),
        MeteorBackground(meteorCount: 2, key: ValueKey("_hongbaoyuWidget")),
        Hongbaoyu(
          onClickValue: (value) {
            if (mounted) {
              setState(() {
                getCoins = getCoins + value;
              });
            }
          },
        ),

        Positioned(
          left: 0,
          right: 0,
          top: 100.h,
          child: IgnorePointer(
            child: Container(
              width: double.infinity,
              height: 50.h,
              decoration: BoxDecoration(
                color: Colors.amber.withValues(alpha: 0),
              ),
              child: Row(
                children: [
                  SizedBox(width: 30.w),
                  Container(
                    width: 219.w,
                    height: 28.h,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Image.asset(
                          Assets.twimg.hongbaoyuLeftbg.path,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.fill,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: ClipPath(
                            clipper: TrapezoidClipper(),
                            child: AnimatedContainer(
                              height: 20.h,
                              duration: Duration(milliseconds: 500),
                              width: 219.w * progress,
                              color: Colors.amber.withValues(alpha: 0.0),
                              child: ShinyStripedProgressBar(
                                targetProgress: 1,
                                backgroundColor: Colors.transparent,
                                // height: 15.w,
                                duration: Duration(microseconds: 100),
                                progressColor: Color(
                                  0xffFFDC2B,
                                ).withValues(alpha: 0.35),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(0.w),
                                ),
                                stripeAngle: StripeAngle.angle45,
                                stripeColor: Color(
                                  0xffFFA339,
                                ).withValues(alpha: 0.38),
                              ),
                            ),
                          ),
                        ),

                        Positioned(
                          top: -6.h,
                          bottom: -6.h,
                          left: -20.w,
                          child: Image.asset(
                            Assets.twimg.hongbaoyuTimer.path,
                            width: 40.w,
                            height: 40.h,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Center(child: TwTxtBorderC143(text: timeText)),
                      ],
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: 104.w,
                    height: 28.h,

                    child: Stack(
                      children: [
                        Image.asset(
                          Assets.twimg.hongbaoyuRightbg.path,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.fill,
                        ),

                        Positioned.fill(
                          left: -10.w,
                          child: Row(
                            children: [
                              SizedBox(width: 10.w),
                              Image.asset(
                                MainTreeController.to.moneyIconTreeChild(),
                                width: 24.w,
                                height: 24.w,
                              ),
                              SizedBox(width: 4.w),

                              TwAnimatedCountttt(
                                value: getCoins,
                                fractionDigits: 2,
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 14.sp,
                                  color: Color(0xffFFAA00),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  _guideWidget() {
    return Stack(
      children: [
        // Image.asset(
        //   Assets.twimgB.moneyRainBg.path,
        //   width: double.infinity,
        //   height: double.infinity,
        //   fit: BoxFit.fill,
        // ),
        MeteorBackground(),
        Positioned(
          left: 0,
          right: 0,
          top: 120.h,
          bottom: 20.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Assets.twimgB.moneyRainTxt.path,
                width: 280.w,
                height: 120.h,
              ),
              Container(
                height: 300.h,
                child: Column(
                  children: [
                    !hasFirst()
                        ? Center(
                            child: Container(
                              width: 120.w,
                              height: 120.h,
                              decoration: BoxDecoration(
                                color: Color(0xffFFFFFF).withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(120.w),
                              ),
                              child: Center(
                                child: TwAnimatedCountttt(
                                  value: daojishiCount,
                                  strokeWidth: 1.w,
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
                                    fontSize: 40.sp,
                                    color: Color(0xffFFDF12),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Container(
                            margin: EdgeInsets.only(top: 160.h),
                            height: 120.h,
                            child: Column(
                              children: [
                                Text(
                                  "Real Cash, Real Withdrawals",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                btnClaim(),
                              ],
                            ),
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _rainWinWidget() {
    bool showSun = MainTreeController.to.showMoneyStatusSunIcon();
    bool showFlower = MainTreeController.to.showMoneyStatusFlowerIcon();
    if (showSun) {
      getCoins = getCoins / MainTreeController.stageBeisuNum;
    } else if (showFlower) {
      getCoins = getCoins / MainTreeController.stageBeisu2Num;
    }
    return Stack(
      children: [
        // Image.asset(
        //   Assets.twimgB.moneyRainBg.path,
        //   width: double.infinity,
        //   height: double.infinity,
        //   fit: BoxFit.fill,
        // ),
        MeteorBackground(),
        Positioned(
          left: 0,
          right: 0,
          top: 120.h,
          bottom: 20.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 240.w,
                height: 188.h,
                child: Stack(
                  children: [
                    TwShiningEffect(
                      duration: Duration(milliseconds: 2000),
                      shineColor: Color(0xffffffff),
                      opacity: 0.8,
                      angle: -0.9,
                      topLeft: false,
                      child: Image.asset(
                        Assets.twimgB.moneyRainWin.path,
                        width: 240.w,
                        height: 188.h,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 4.h,
                      child: Center(
                        child: Container(
                          width: 240.w,
                          height: 56.h,
                          decoration: BoxDecoration(
                            color: Colors.blue.withValues(alpha: 0.0),
                          ),
                          child: Center(
                            child: TwTxtGraBorderC143(
                              text:
                                  "${TwCountryyC143.curCountryyyySymbolC143()}${getCoins.toStringAsFixed(2)}",
                              fontWeight: FontWeight.w900,
                              fontSize: 32.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 300.h,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 160.h),
                      height: 120.h,
                      child: Column(
                        children: [
                          btnWinClaim(),
                          GestureDetector(
                            onTap: _onWinGiveup,
                            child: Text(
                              "Give Up",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _onWinGiveup() async{
    bool showInterAd = TwBaseNumber.showInter();
    if(showInterAd){
      bool result = await TwCommonAds().showInterstitialAd(
        adPosId: TwAdsPosId.cuvxv_bonusgame_profit_int,
      );
    }

    setState(() {
      _hongbaoWinPop = false;
    });
  }

  _bgWidget() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xffAF00D2).withValues(alpha: 0.7),
            Color(0xffAF00D2).withValues(alpha: 0.0),
            Color(0xffffffff).withValues(alpha: 0.0),
            Color(0xff003AD9).withValues(alpha: 0.8),
          ],
          stops: [0, 0.1, 0.9, 1],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }

  _rainEndWidget() {
    return Stack(
      children: [
        // _bgWidget(),
        // Image.asset(
        //   Assets.twimgB.moneyRainBg.path,
        //   width: double.infinity,
        //   height: double.infinity,
        //   fit: BoxFit.fill,
        // ),
        // MeteorBackground(),
        MeteorBackground(),
        Positioned(
          left: 0,
          right: 0,
          top: 120.h,
          bottom: 20.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Assets.twimgB.moneyRainTxt.path,
                width: 280.w,
                height: 120.h,
              ),
              Container(
                height: 300.h,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 160.h),
                      height: 120.h,
                      child: Column(
                        children: [
                          btnPlayAgainClaim(),
                          SizedBox(height: 4.h),
                          GestureDetector(
                            onTap: _onEndGiveup,
                            child: Text(
                              "Give Up",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _onPlayAgain() async{
    bool result = await TwCommonAds().showRewardAd(
      adPosId: TwAdsPosId.cuvxv_bonusgame_end_rv,
    );
    if(result){
      setState(() {
        _resetData();
        TwMaiDiannnn.cash_rain_start();
        MainSpinController.to.onCashRainCount();
      });
    }

  }

  _onEndGiveup() async{
    bool showInterAd = TwBaseNumber.showInter();
    if(showInterAd){
      bool result = await TwCommonAds().showInterstitialAd(
        adPosId: TwAdsPosId.cuvxv_bonusgame_home_int,
      );
    }


    widget.onClose(0);
  }

  _onBtnWin() async {
    bool result = await TwCommonAds().showRewardAd(
      adPosId: TwAdsPosId.cuvxv_bonusgame_profit_rv,
    );
    if(result){
      MainTreeController.to.onAddMoneyyyy(getCoins, onEnd: () {});
    }

    setState(() {
      _hongbaoWinPop = false;
    });
  }

  void _resetData() {
    _hongbaoRainEnd = false;
    _hongbaoWinPop = false;
    daojishiCount = 3;
    getCoins = 0;
    initJishiTimer();
  }
}

class Hongbaoyu extends StatelessWidget {
  const Hongbaoyu({super.key, required this.onClickValue});

  final ValueChanged<double> onClickValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withValues(alpha: 0.0),
      child: ParticleEffects(
        isEnabled: true,
        config: ParticleConfig(
          particleType: ParticleType.image,
          direction: ParticleDirection.topToBottom,
          // Already falling
          particleCount: 10,
          imagePath: MainTreeController.to.moneyIconTreeChild(),
          minSize: 50.w,
          maxSize: 50.w,
          enableRotation: false,
          // enableSizeVariation: true,
          velocityMultiplier: 2,
          animationDuration: Duration(seconds: 10),
          minOpacity: 1.0,
          maxOpacity: 1.0,
        ),
        onClickValue: (double value) {
          onClickValue(value);
        },
        child: Container(
          width: ScreenUtil().screenWidth,
          height: ScreenUtil().screenHeight,
          // width: 375.w,
          // height: 400.h,
          color: Colors.yellow.withValues(alpha: 0.0),
        ),
      ),
    );
  }
}

class TrapezoidClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width - size.height * 0.4, size.height)
      ..lineTo(0, size.height)
      // ..quadraticBezierTo(size.width, 0, size.width, 20)
      ..close();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
