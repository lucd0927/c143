import 'package:auto_size_text/auto_size_text.dart';
import 'package:c143/gen/assets.gen.dart';
import 'package:c143/tw_143/tw_pages/guide/guide12_homereward.dart';
import 'package:c143/tw_143/tw_pages/guide/guide1_water.dart';
import 'package:c143/tw_143/tw_pages/guide/guide4_fertilize.dart';
import 'package:c143/tw_143/tw_pages/guide/guide6_rewarddouble.dart';
import 'package:c143/tw_143/tw_pages/main_tree/main_tree_controller.dart';
import 'package:c143/tw_base/tw_ad/ads_iddddd.dart';
import 'package:c143/tw_base/tw_ad/base_ads.dart';
import 'package:c143/tw_base/tw_gj/loggggg.dart';
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

class OverlayGetCoins {
  OverlayEntry? _overlayEntry;

  ///是否真正显示
  bool get isShowing => _isShowing;
  bool _isShowing = false;

  void show({
    required double coins,
    required VoidCallback onBtn,
    required VoidCallback onClose,
  }) {
    _overlayEntry = null;

    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Material(
          color: Colors.transparent,
          child: GetCoinsWidget(
            onClaim: (value) async {
              close();

              bool result = await TwCommonAds().showInterstitialAd(
                adPosId: TwAdsPosId.test,
              );
              if (!result) {
                onBtn();
                return;
              }
              MainTreeController.to.onAddMoneyyyy(
                coins,
                onEnd: () {
                  onBtn();
                },
              );
            },
            onClose: () async {
              twLooog("=====OverlayGetCoins onClose");
              close();
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
                  TwTxtGraBorder(
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
                            child: TwRotateWidggggg(
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
                                    child: TwTxtBorder(
                                      text: "Earn Coins",
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w900,
                                      fontColor: Color(0xffffffff),
                                      foreground: Color(0xff904833),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 24.h),
                                TwAScale(
                                  child: TwShiningEffect(
                                    duration: Duration(milliseconds: 2000),
                                    shineColor: Color(0xfff1db6d),
                                    opacity: 1,
                                    angle: -0.9,
                                    topLeft: false,
                                    child: Image.asset(
                                      Assets.twimg.coinGuide6.path,
                                      width: 88.h,
                                      height: 88.h,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 12.h),
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
                                      fractionDigits: 0,
                                      prefix: "+",
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 32.sp,
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
      child: GestureDetector(
        onTap: onClaim,
        child: Container(
          width: 260.h,
          height: 56.h,
          color: Colors.black.withValues(alpha: 0.0),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Image.asset(
                Assets.twimg.btnSpin.path,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
              Center(
                child: TwTxtBorder(
                  text: "Claim",
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w900,
                  fontColor: Color(0xffffffff),
                  foreground: Color(0xff22431B),
                ),
              ),
              Positioned(
                top: -10.h,
                right: -5.h,
                child: Image.asset(
                  Assets.twimg.ad.path,
                  width: 28.h,
                  height: 28.h,
                ),
              ),

              // Positioned(
              //   top: -0.h,
              //   right: -5.h,
              //   child: Container(
              //     padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 4.h),
              //     decoration: BoxDecoration(
              //       gradient: LinearGradient(
              //         colors: [Color(0xffFF5151), Color(0xffCC0909)],
              //         begin: Alignment.topCenter,
              //         end: Alignment.bottomCenter,
              //       ),
              //       borderRadius: BorderRadius.circular(100),
              //     ),
              //     child: Text(
              //       "3 Change Left",
              //       style: TextStyle(
              //         fontSize: 10.sp,
              //         fontWeight: FontWeight.w700,
              //         color: Color(0xffFFD059),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  void onClaim() {
    widget.onClaim(widget.coins);
  }
}
