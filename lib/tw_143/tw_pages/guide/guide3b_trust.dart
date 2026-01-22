import 'dart:io';
import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:c143/gen/assets.gen.dart';
import 'package:c143/tw_143/tw_common/lottieeee/common.dart';
import 'package:c143/tw_143/tw_common/lottieeee/gesture.dart';
import 'package:c143/tw_143/tw_pages/guide/guide1_water.dart';
import 'package:c143/tw_143/tw_pages/guide/guide3_adspot.dart';
import 'package:c143/tw_143/tw_pages/guide/guide4_fertilize.dart';
import 'package:c143/tw_143/tw_pages/main_tree/main_tree_controller.dart';
import 'package:c143/tw_143/tw_pages/main_tree/vieee/main_top_b.dart';
import 'package:c143/tw_base/tw_ad/guiyin/package.dart';
import 'package:c143/tw_base/tw_gj/logC143.dart';
import 'package:c143/tw_base/tw_gj/overlay_manager.dart';
import 'package:c143/tw_notification/android_notification.dart';
import 'package:c143/tw_notification/overlay_notify.dart';
import 'package:c143/tw_views/animated_count.dart';
import 'package:c143/tw_views/animated_scale.dart';
import 'package:c143/tw_views/font_border.dart';
import 'package:c143/tw_views/tw_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../main_tree/main_tree.dart' show maxPinnedHeight;

class OverlayGuide3BTrust {
  OverlayEntry? _overlayEntry;

  ///是否真正显示
  bool get isShowing => _isShowing;
  bool _isShowing = false;

  void show() {
    _overlayEntry = null;

    // _overlayEntry = OverlayEntry(
    //   builder: (context) {
    //     return Material(
    //       color: Colors.transparent,
    //       child: Guide3BTrustWidget(
    //         onClose: () async {
    //           close();
    //
    //           bool showTz = true;
    //           if (TwPackageABC143.isPackageB()) {
    //             showTz = await TwNotificationnn().requestNotificationPermission();
    //           }
    //           twLooog("===OverlayGuide3BTrust==showTz:$showTz");
    //           if (!showTz) {
    //             OverlayTzNotify().show(onEnd: (){
    //               OverlayGuide4Fertilize().show();
    //             });
    //           } else {
    //             OverlayGuide4Fertilize().show();
    //           }
    //         },
    //       ),
    //     );
    //   },
    // );
    // Overlay.of(Get.context!).insert(_overlayEntry!);


    Widget child = Material(
      color: Colors.transparent,
      child: Guide3BTrustWidget(
        onClose: () async {
          close();

          bool showTz = true;
          if (TwPackageABC143.isPackageB()) {
            showTz = await TwNotificationC143().requestNotificationPermission();
          }
          twLooog("===OverlayGuide3BTrust==showTz:$showTz");
          if (!showTz) {
            OverlayTzNotify().show(onEnd: (){
              OverlayGuide4Fertilize().show();
            });
          } else {
            OverlayGuide4Fertilize().show();
          }
        },
      ),
    );
    kHashCode =  OverlayManager.show(context: Get.context!, child: child);

    _isShowing = true;
  }
  String kHashCode = "";

  void close() {
    _isShowing = false;
    _overlayEntry?.remove();
    OverlayManager.clearOverlayEntry(kHashCode);

  }
}

class Guide3BTrustWidget extends StatefulWidget {
  const Guide3BTrustWidget({super.key, required this.onClose});

  final VoidCallback onClose;

  @override
  State<Guide3BTrustWidget> createState() => _Guide3BTrustWidgetState();
}

class _Guide3BTrustWidgetState extends State<Guide3BTrustWidget> {
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
              GestureDetector(
                onTap: () {
                  widget.onClose();
                },
                child: Column(
                  children: [
                    IgnorePointer(child: MainTopB(hasGuide: true,)),
                    Image.asset(
                      Assets.twimgB.guide31Trust.path,
                      width: 340.w,
                      height: 184.h,
                    ),
                    SizedBox(height: 32.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Spacer(),
                        Flexible(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 4.h,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xffFFFFFF).withValues(alpha: 0.4),
                              border: Border.all(
                                color: Color(0xffFFE345).withValues(alpha: 0.5),
                                width: 1.w,
                              ),
                              borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(50),
                              ),
                            ),
                            child: Text(
                              "Congratulations to user ${Random().nextInt(9)}${Random().nextInt(9)}***${Random().nextInt(9)}${Random().nextInt(9)} on cashing out \$1000!",
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: Color(0xffffffff),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Spacer(),
                        Flexible(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 4.h,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xffFFFFFF).withValues(alpha: 0.4),
                              border: Border.all(
                                color: Color(0xffFFE345).withValues(alpha: 0.5),
                                width: 1.w,
                              ),
                              borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(50),
                              ),
                            ),
                            child: Text(
                              "Congratulations to user ${Random().nextInt(9)}${Random().nextInt(9)}***${Random().nextInt(9)}${Random().nextInt(9)} on cashing out \$1000!",
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: Color(0xffffffff),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Spacer(),
                        Flexible(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10.w,
                              vertical: 4.h,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xffFFFFFF).withValues(alpha: 0.4),
                              border: Border.all(
                                color: Color(0xffFFE345).withValues(alpha: 0.5),
                                width: 1.w,
                              ),
                              borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(50),
                              ),
                            ),
                            child: Text(
                              "Congratulations to user ${Random().nextInt(9)}${Random().nextInt(9)}***${Random().nextInt(9)}${Random().nextInt(9)} on cashing out \$1000!",
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: Color(0xffffffff),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 80.h),
                    btnClaim(),
                  ],
                ),
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
                child: TwTxtBorderC143(
                  text: "Earn More",
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
