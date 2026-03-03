import 'package:auto_size_text/auto_size_text.dart';
import 'package:c143/gen/assets.gen.dart';
import 'package:c143/tw_143/tw_common/base_number.dart';
import 'package:c143/tw_143/tw_common/firebase_json/number_json.dart';
import 'package:c143/tw_143/tw_pages/guide/guide12_homereward.dart';
import 'package:c143/tw_143/tw_pages/guide/guide1_water.dart';
import 'package:c143/tw_143/tw_pages/guide/guide4_fertilize.dart';
import 'package:c143/tw_143/tw_pages/guide/guide6_rewarddouble.dart';
import 'package:c143/tw_143/tw_pages/main_tree/main_tree_controller.dart';
import 'package:c143/tw_base/tw_ad/ads_idddddC143.dart';
import 'package:c143/tw_base/tw_ad/base_ads.dart';
import 'package:c143/tw_base/tw_ad/guiyin/package.dart';
import 'package:c143/tw_base/tw_gj/countryC143.dart';
import 'package:c143/tw_base/tw_gj/logC143.dart';
import 'package:c143/tw_base/tw_gj/vibration.dart';
import 'package:c143/tw_base/tw_http/event_report.dart';
import 'package:c143/tw_views/animated_count.dart';
import 'package:c143/tw_views/animated_scale.dart';
import 'package:c143/tw_views/font_border.dart';
import 'package:c143/tw_views/font_gradient_border.dart';
import 'package:c143/tw_views/rotate.dart';
import 'package:c143/tw_views/shimmer_effect.dart';
import 'package:c143/tw_views/tw_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

enum TwEnumGetCoinsType { treeMoney, quizMoney, wheelMoney, hongbaoRainMoney }

class OverlayGetCoins {
  OverlayEntry? _overlayEntry;

  ///是否真正显示
  bool get isShowing => _isShowing;
  bool _isShowing = false;

  void show({
    required double coins,
    required VoidCallback onBtn,
    required VoidCallback onClose,
    required TwEnumGetCoinsType type,
  }) {
    _overlayEntry = null;

    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Material(
          color: Colors.transparent,
          child: GetCoinsWidget(
            onClaim: (value) async {
              close();
              if (TwPackageABC143.isPackageB()) {
                bool result = await TwCommonAds().showRewardAd(
                  adPosId: TwAdsPosId.cuvxv_question_rv,
                );
                if (!result) {
                  onBtn();
                  return;
                }
                MainTreeController.to.onAddMoneyyyy(
                  value,
                  onEnd: () {
                    onBtn();
                  },
                );
                return;
              }

              MainTreeController.to.onAddMoneyyyy(
                value,
                onEnd: () {
                  onBtn();
                },
              );
            },
            onClose: () async {
              twLooog("=====OverlayGetCoins onClose");
              close();
              if (TwPackageABC143.isPackageB()) {
                bool showInterAd = TwNumberJson.showInter();
                if (showInterAd) {
                  bool result = await TwCommonAds().showInterstitialAd(
                    adPosId: TwAdsPosId.cuvxv_question_int,
                  );
                }
              }
              onClose();
            },
            coins: coins,
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
    _overlayEntry = null;
  }
}

class GetCoinsWidget extends StatefulWidget {
  const GetCoinsWidget({
    super.key,
    required this.onClose,
    required this.coins,
    required this.onClaim,
  });

  final VoidCallback onClose;
  final ValueChanged<double> onClaim;
  final double coins;

  @override
  State<GetCoinsWidget> createState() => _GetCoinsWidgetState();
}

class _GetCoinsWidgetState extends State<GetCoinsWidget> {
  int index = 0;

  bool showAnimated = false;
  Duration animD = Duration(milliseconds: 200);
  double startScale = 0.8;
  double _coins = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          showAnimated = true;
          _coins = widget.coins;

          if (TwPackageABC143.isPackageB()) {
            bool showSun = MainTreeController.to.showMoneyStatusSunIcon();
            bool showFlower = MainTreeController.to.showMoneyStatusFlowerIcon();
            if (showSun) {
              _coins = _coins / MainTreeController.stageBeisuNum;
            } else if (showFlower) {
              _coins = _coins / MainTreeController.stageBeisu2Num;
            }
            TwMaiDiannnn.quiz_reward(_coins.toStringAsFixed(2));
          }
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
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 80.h),
                  TwTxtGraBorderC143(
                    text: "Correct! Congrats!",
                    gradient: LinearGradient(
                      colors: [
                        Color(0xffEBD462),
                        Color(0xffFFF692),
                        Color(0xffFFD92E),
                      ],
                      end: Alignment.bottomCenter,
                      begin: Alignment.topCenter,
                    ),
                    height: 1.2,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w900,
                  ),
                  SizedBox(height: 60.h),
                  Center(
                    child: Container(
                      width: 336.w,
                      height: 236.h,
                      child: Stack(
                        children: [
                          Image.asset(
                            Assets.twimg.guide3Centerbg.path,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.fill,
                          ),
                          Center(
                            child: TwRotateWidgggggC143(
                              duration: Duration(milliseconds: 30000),
                              child: Image.asset(
                                Assets.twimg.bghightlight.path,
                                width: 260.w,
                                height: 260.h,
                              ),
                            ),
                          ),
                          Positioned.fill(
                            child: Column(
                              children: [
                                SizedBox(height: 10.h),
                                Container(
                                  height: 30.h,
                                  color: Colors.red.withValues(alpha: 0.0),
                                  child: Center(
                                    child: TwTxtBorderC143(
                                      text: TwPackageABC143.isPackageB()
                                          ? "Earn Money"
                                          : "Earn Coins",
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w900,
                                      fontColor: Color(0xffffffff),
                                      foreground: Color(0xff904833),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 28.h),
                                TwAScaleC143(
                                  child: TwShiningEffect(
                                    duration: Duration(milliseconds: 2000),
                                    shineColor: Color(0xffffffff),
                                    opacity: 1,
                                    angle: -0.9,
                                    topLeft: false,
                                    child: Image.asset(
                                      MainTreeController.to.moneyIconDialog(),
                                      width: 100.h,
                                      height: 100.h,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // TwTxtGraBorder(
                                    //   text:
                                    //       "+${widget.coins.toStringAsFixed(2)}",
                                    //   fontSize: 32.sp,
                                    //   fontWeight: FontWeight.w900,
                                    // ),
                                    TwAnimatedCountttt(
                                      value: _coins,
                                      fractionDigits: 2,
                                      prefix:
                                          "+${TwCountryyC143.curCountryyyySymbolC143()}",
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 32.sp,
                                        height: 1.2,
                                      ),
                                      textGradient: LinearGradient(
                                        colors: [
                                          Color(0xffFFDF12),
                                          Color(0xffFFAA00),
                                        ],
                                        end: Alignment.bottomCenter,
                                        begin: Alignment.topCenter,
                                      ),
                                      strokeColor: Color(0xffBD5500),
                                      strokeWidth: 1.w,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          Positioned(
                            right: 0.w,
                            top: 15.h,
                            child: GestureDetector(
                              onTap: () {
                                VibrationC143.vibrationClick();
                                widget.onClose();
                              },
                              child: Image.asset(
                                Assets.twimg.guide3Close.path,
                                width: 36.w,
                                height: 36.w,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 100.h),
                  Center(child: btnClaim()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget btnClaim() {
    return Center(
      child: AnimatedCrossFade(
        alignment: Alignment.center,
        firstChild: SizedBox(height: 56.h),
        secondChild: InkWell(
          onTap: onClaim,
          child: Container(
            width: 260.h,
            height: 80.h,
            color: Colors.black.withValues(alpha: 0.0),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Center(
                  child: Image.asset(
                    Assets.twimg.btnSpin.path,
                    width: double.infinity,
                    height: 56.h,
                    fit: BoxFit.fill,
                  ),
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
                    top: -0.h,
                    right: 5.h,
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
        crossFadeState: showAnimated
            ? CrossFadeState.showSecond
            : CrossFadeState.showFirst,
        duration: Duration(milliseconds: 300),
      ),
    );
  }

  void onClaim() {
    VibrationC143.vibrationClick();
    widget.onClaim(_coins);
  }
}
