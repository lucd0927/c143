import 'package:auto_size_text/auto_size_text.dart';
import 'package:c143/gen/assets.gen.dart';
import 'package:c143/tw_143/tw_common/view/progress.dart';
import 'package:c143/tw_143/tw_pages/guide/guide1_water.dart';
import 'package:c143/tw_143/tw_pages/guide/guide4_fertilize.dart';
import 'package:c143/tw_143/tw_pages/guide/guide6_rewarddouble.dart';
import 'package:c143/tw_143/tw_pages/main/main_controller.dart';
import 'package:c143/tw_143/tw_pages/main_tree/main_tree_controller.dart';
import 'package:c143/tw_base/tw_ad/guiyin/package.dart';
import 'package:c143/tw_base/tw_gj/logC143.dart';
import 'package:c143/tw_base/tw_gj/overlay_manager.dart';
import 'package:c143/tw_base/tw_http/event_report.dart';
import 'package:c143/tw_notification/android_notification.dart';
import 'package:c143/tw_notification/overlay_notify.dart';
import 'package:c143/tw_views/animated_count.dart';
import 'package:c143/tw_views/animated_scale.dart';
import 'package:c143/tw_views/font_border.dart';
import 'package:c143/tw_views/font_gradient_border.dart';
import 'package:c143/tw_views/tw_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OverlayGuide14HighLight {
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
    //       child: Guide14HighLight(
    //         onClose: () async {
    //           close();
    //           MainTreeController.to.saveGuideIndexData(
    //             MainTreeController.guide14,
    //           );
    //           MainController.to.resetIndex(MainController.treeIndex);
    //
    //           bool showTz = true;
    //           if (TwPackageABC143.isPackageB()) {
    //             showTz = await TwNotificationnn().requestNotificationPermission();
    //           }
    //           twLooog("===OverlayGuide14HighLight==showTz:$showTz");
    //           if (!showTz) {
    //             OverlayTzNotify().show(onEnd: (){
    //
    //             });
    //           }
    //         },
    //       ),
    //     );
    //   },
    // );
    // Overlay.of(Get.context!).insert(_overlayEntry!);


    Widget child = Material(
      color: Colors.transparent,
      child: Guide14HighLight(
        onClose: () async {
          close();
          MainTreeController.to.saveGuideIndexData(
            MainTreeController.guide14,
          );
          MainController.to.resetIndex(MainController.treeIndex);

          bool showTz = true;
          if (TwPackageABC143.isPackageB()) {
            showTz = await TwNotificationC143().requestNotificationPermission();
          }
          twLooog("===OverlayGuide14HighLight==showTz:$showTz");
          if (!showTz) {
            OverlayTzNotify().show(onEnd: (){

            });
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

class Guide14HighLight extends StatefulWidget {
  const Guide14HighLight({super.key, required this.onClose});

  final VoidCallback onClose;

  @override
  State<Guide14HighLight> createState() => _Guide14HighLightState();
}

class _Guide14HighLightState extends State<Guide14HighLight> {
  int index = 0;

  bool showAnimated = false;
  Duration animD = Duration(milliseconds: 200);
  double startScale = 0.8;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    TwMaiDiannnn.high_begin_v();
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
                  SizedBox(height: 40.h),
                  Image.asset(
                    TwPackageABC143.isPackageB()
                        ? Assets.twimgB.guide14bTxt.path
                        : Assets.twimg.guide14Txt.path,
                    width: 261.w,
                    height: 76.h,
                  ),
                  SizedBox(height: 60.h),
                  Center(
                    child: TwAnimatedProgress(
                      width: 312.w,
                      height: 16.h,
                      maxProgress: 0.6,
                    ),
                  ),
                  SizedBox(height: 120.h),
                  Text(
                    TwPackageABC143.isPackageB()?"Cash out NOW\nDon’t let fast money slip away!":"Don’t let fast coin slip away!",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Color(0xffffffff),
                      fontSize: 14.sp,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 120.h),
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
                child: TwTxtBorderC143(
                  text: TwPackageABC143.isPackageB()
                      ? "SPRINT FOR CASH!"
                      : "SPRINT FOR COINS",
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
    TwMaiDiannnn.high_begin_c();
    widget.onClose();
  }
}
