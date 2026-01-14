import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:c143/gen/assets.gen.dart';
import 'package:c143/tw_143/tw_common/view/cross_confetti.dart';
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

class OverlayGetSun {
  OverlayEntry? _overlayEntry;

  ///是否真正显示
  bool get isShowing => _isShowing;
  bool _isShowing = false;

  void show({
    required double coins,
    required VoidCallback onClose,
  }) {
    _overlayEntry = null;

    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Material(
          color: Colors.transparent,
          child: GetSunWidget(
            onClaim: (value) async {
              close();


            },
            onClose: () async {
              twLooog("=====OverlayGetCoins onClose");
              close();
              MainTreeController.to.onAddMoneyyyy(
                coins,
                onEnd: () {
                  onClose();
                },
              );

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

class GetSunWidget extends StatefulWidget {
  const GetSunWidget({
    super.key,
    required this.onClose,
    required this.coins,
    required this.onClaim,
  });

  final VoidCallback onClose;
  final ValueChanged<double> onClaim;
  final double coins;

  @override
  State<GetSunWidget> createState() => _GetSunWidgetState();
}

class _GetSunWidgetState extends State<GetSunWidget> {
  int index = 0;

  bool showAnimated = false;
  Duration animD = Duration(milliseconds: 200);
  double startScale = 0.8;
  double _coins = 0;

  Timer? _timer;

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

        _timer = Timer(Duration(milliseconds: 2000), (){
          _onclose();
        });
      }
    });
  }

  _onclose(){
    twLooog("======_onclose=");
    _timer?.cancel();
    widget.onClose();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onclose,
      child: Container(
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().screenHeight,
        color: Colors.transparent,
        child: Stack(
          children: [
            // ConfettiWidget(),
            Center(
              child: AnimatedContainer(
                duration: animD,

                decoration: BoxDecoration(
                  color: Colors.black.withValues(
                    alpha: showAnimated ? overlayOpacity : 0,
                  ),
                  borderRadius: BorderRadius.circular(16.w),
                ),
                child: AnimatedScale(
                  duration: animD,
                  scale: showAnimated ? 1.0 : startScale,
                  child: SizedBox(
                    width: 200.w,
                    height: 200.h,
                    child: IndexedStack(
                      index: index,
                      children: [
                        Center(
                          child: Container(
                            width: 200.w,
                            height: 200.h,
                            child: Stack(
                              children: [
                                Center(
                                  child: TwRotateWidgggggC143(
                                    duration: Duration(milliseconds: 30000),
                                    child: Image.asset(
                                      Assets.twimg.bghightlight.path,
                                      width: 200.w,
                                      height: 200.h,
                                    ),
                                  ),
                                ),
                                Center(
                                  child: TwAScaleC143(
                                    child: TwShiningEffect(
                                      duration: Duration(milliseconds: 2000),
                                      shineColor: Color(0xfffffffff),
                                      opacity: 1,
                                      angle: -0.9,
                                      topLeft: false,
                                      child: Image.asset(
                                        Assets.twimg.mainSun.path,
                                        width: 100.h,
                                        height: 100.h,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 0,
                                  right: 0,
                                  bottom: 10.h,
                                  child: Center(
                                    child: TwAnimatedCountttt(
                                      value: _coins,
                                      fractionDigits: 2,
                                      prefix: "+${TwCountryyC143.curCountryyyySymbolC143()}",
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
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget btnClaim() {
    return Center(
      child: AnimatedCrossFade(
        alignment: Alignment.center,
        firstChild: SizedBox(height: 56.h),
        secondChild: GestureDetector(
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
                  child: TwTxtBorderC143(
                    text: "Claim",
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w900,
                    fontColor: Color(0xffffffff),
                    foreground: Color(0xff22431B),
                  ),
                ),

                // Positioned(
                //   top: -10.h,
                //   right: -5.h,
                //   child: Image.asset(
                //     Assets.twimg.ad.path,
                //     width: 28.h,
                //     height: 28.h,
                //   ),
                // ),
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
    widget.onClaim(widget.coins);
  }
}



