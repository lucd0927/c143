import 'package:auto_size_text/auto_size_text.dart';
import 'package:c143/gen/assets.gen.dart';
import 'package:c143/tw_143/tw_pages/guide/guide1_water.dart';
import 'package:c143/tw_143/tw_pages/guide/guide4_fertilize.dart';
import 'package:c143/tw_143/tw_pages/guide/guide6_rewarddouble.dart';
import 'package:c143/tw_143/tw_pages/main_tree/main_tree_controller.dart';
import 'package:c143/tw_base/tw_gj/loggggg.dart';
import 'package:c143/tw_views/animated_count.dart';
import 'package:c143/tw_views/animated_scale.dart';
import 'package:c143/tw_views/font_border.dart';
import 'package:c143/tw_views/font_gradient_border.dart';
import 'package:c143/tw_views/tw_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OverlayGuide5AdSpot {
  OverlayEntry? _overlayEntry;

  ///是否真正显示
  bool get isShowing => _isShowing;
  bool _isShowing = false;

  void show() {
    _overlayEntry = null;

    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Material(
          color: Colors.transparent,
          child: Guide5AdSpot(
            onClose: () async {
              close();

              OverlayGuide6RewardDouble().show();
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

class Guide5AdSpot extends StatefulWidget {
  const Guide5AdSpot({super.key, required this.onClose});

  final VoidCallback onClose;

  @override
  State<Guide5AdSpot> createState() => _Guide5AdSpotState();
}

class _Guide5AdSpotState extends State<Guide5AdSpot> {
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
                children: [
                  SizedBox(height: 80.h),
                  Image.asset(
                    Assets.twimg.guide3Txt.path,
                    width: 288.w,
                    height: 100.h,
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

                          Positioned.fill(
                            child: Column(
                              children: [
                                SizedBox(height: 10.h),
                                Container(
                                  height: 30.h,
                                  color: Colors.red.withValues(alpha: 0.0),
                                  child: Center(
                                    child: TwTxtBorder(
                                      text: "Credited To Account",
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w900,
                                      fontColor: Color(0xffffffff),
                                      foreground: Color(0xff904833),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 24.h),
                                Image.asset(
                                  Assets.twimg.guide3Ok.path,
                                  width: 88.h,
                                  height: 88.h,
                                ),
                                SizedBox(height: 12.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      Assets.twimg.coin.path,
                                      width: 32.h,
                                      height: 32.h,
                                    ),
                                    SizedBox(width: 8.w),
                                    TwTxtGraBorder(
                                      text: "10",
                                      fontSize: 32.sp,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 60.h),
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
              // Positioned(
              //   top: -10.h,
              //   left: -5.h,
              //   child: Image.asset(
              //     Assets.twimg.ad.path,
              //     width: 28.h,
              //     height: 28.h,
              //   ),
              // ),

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
    widget.onClose();
  }
}
