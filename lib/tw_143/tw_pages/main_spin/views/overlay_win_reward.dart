import 'package:auto_size_text/auto_size_text.dart';
import 'package:c143/gen/assets.gen.dart';
import 'package:c143/tw_143/tw_pages/guide/guide12_homereward.dart';
import 'package:c143/tw_143/tw_pages/guide/guide1_water.dart';
import 'package:c143/tw_143/tw_pages/guide/guide4_fertilize.dart';
import 'package:c143/tw_143/tw_pages/guide/guide6_rewarddouble.dart';
import 'package:c143/tw_143/tw_pages/main_spin/main_spin_controller.dart';
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

class OverlayWinReward {
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
    MainSpinController.to.saveClickWinBigFirst();
    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Material(
          color: Colors.transparent,
          child: WinRewardWidget(
            onClaim: (value) async {
              close();


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

class WinRewardWidget extends StatefulWidget {
  const WinRewardWidget({
    super.key,
    required this.onClose,
    required this.coins,
    required this.onClaim,
  });

  final VoidCallback onClose;
  final ValueChanged<double> onClaim;
  final double coins;

  @override
  State<WinRewardWidget> createState() => _WinRewardWidgetState();
}

class _WinRewardWidgetState extends State<WinRewardWidget> {
  int index = 0;

  bool showAnimated = false;
  Duration animD = Duration(milliseconds: 200);
  double startScale = 0.8;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          showAnimated = true;
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
                  SizedBox(height: 60.h),
                  Center(
                    child: Container(
                      width: 336.w,
                      height: 380.h,
                      child: Stack(
                        children: [
                          Image.asset(
                            Assets.twimgB.wheelPopBg.path,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.fill,
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            top: 10.h,
                            child: Center(
                              child: TwRotateWidgggggC143(
                                duration: Duration(milliseconds: 30000),
                                child: Image.asset(
                                  Assets.twimg.bghightlight.path,
                                  width: 260.w,
                                  height: 260.h,
                                ),
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
                                      text: "Remove the small reward",
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w900,
                                      fontColor: Color(0xffffffff),
                                      foreground: Color(0xff904833),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 48.h),
                                TwShiningEffect(
                                  duration: Duration(milliseconds: 2000),
                                  shineColor: Color(0xffffffff),
                                  opacity: 1,
                                  angle: -0.9,
                                  topLeft: false,
                                  child: Image.asset(
                                    Assets.twimgB.wheelPopPhone.path,
                                    width: 200.h,
                                    height: 100.h,
                                  ),
                                ),
                                SizedBox(height: 16.h),
                                Image.asset(
                                  Assets.twimgB.wheelPopJindu.path,
                                  width: 200.w,
                                  height: 20.h,
                                ),
                                SizedBox(height: 4.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    TwTxtGraBorderC143(
                                      text: "10%",
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w900,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 8.w,
                                      ),
                                      child: Image.asset(
                                        Assets.twimgB.wheelPopNext.path,
                                        width: 24.w,
                                        height: 24.h,
                                      ),
                                    ),
                                    TwTxtGraBorderC143(
                                      text: "60%",
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 16.h),
                                Center(child: btnClaim()),
                                SizedBox(height: 4.h),
                                Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      widget.onClose();
                                    },
                                    child: Text(
                                      "Give up",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xffFFF1AC),
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Positioned(
                          //   right: 0.w,
                          //   top: 15.h,
                          //   child: GestureDetector(
                          //     onTap: () {
                          //       widget.onClose();
                          //     },
                          //     child: Image.asset(
                          //       Assets.twimg.guide3Close.path,
                          //       width: 36.w,
                          //       height: 36.w,
                          //       fit: BoxFit.fill,
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 80.h),
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
        secondChild: GestureDetector(
          onTap: onClaim,
          child: Container(
            width: 270.h,
            height: 56.h,
            color: Colors.black.withValues(alpha: 0.0),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Center(
                  child: Image.asset(
                    Assets.twimg.btnSpin.path,
                    width: 232.h,
                    height: 52.h,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Center(
                  child: TwTxtBorderC143(
                    text: "Win The Grand Prize",
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w900,
                    fontColor: Color(0xffffffff),
                    foreground: Color(0xff22431B),
                  ),
                ),

                Positioned(
                  top: -10.h,
                  left: 15.h,
                  child: Image.asset(
                    Assets.twimg.ad.path,
                    width: 28.h,
                    height: 28.h,
                  ),
                ),
                Positioned(
                  top: -0.h,
                  right: 15.h,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 0.h,
                      horizontal: 4.h,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xffFF5151), Color(0xffCC0909)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Text(
                      "3/3",
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w700,
                        color: Color(0xffFFD059),
                      ),
                    ),
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
    widget.onClaim(0);
  }
}
