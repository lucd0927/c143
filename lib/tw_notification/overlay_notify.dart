import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:c143/gen/assets.gen.dart';
import 'package:c143/tw_143/tw_common/lottieeee/gesture.dart';
import 'package:c143/tw_base/tw_gj/audio_playC143.dart';
import 'package:c143/tw_base/tw_gj/logC143.dart';
import 'package:c143/tw_base/tw_gj/login_trackC143.dart';
import 'package:c143/tw_base/tw_http/event_report.dart';
import 'package:c143/tw_views/font_border.dart';
import 'package:c143/tw_views/font_gradient_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class OverlayTzNotify {
  ///是否真正显示

  OverlayEntry? _overlayC143;

  void show({required VoidCallback onEnd}) {
    TwMaiDiannnn.notification_prompt_show(
      TwLoginnnTrackC143.qidongduoshaoDay() <= 1 ? "new" : "old",
    );
    _overlayC143 = null;
    _overlayC143 = OverlayEntry(
      builder: (context) {
        return TzNotifyWidget(
          onClose: () {
            close();
            onEnd();
            TwMaiDiannnn.notification_denied();
          },
          onBtn: () {
            close();
            onEnd();
            TwMaiDiannnn.notification_granted();
          },
        );
      },
    );
    Overlay.of(Get.context!).insert(_overlayC143!);
  }

  void close() {
    _overlayC143?.remove();
    _overlayC143 = null;
  }
}

class TzNotifyWidget extends StatefulWidget {
  const TzNotifyWidget({super.key, required this.onClose, required this.onBtn});

  final VoidCallback onClose;
  final VoidCallback onBtn;

  @override
  State<TzNotifyWidget> createState() => _TzNotifyWidgetState();
}

class _TzNotifyWidgetState extends State<TzNotifyWidget> {
  bool positive = audioMusic.hasOn;
  bool positive2 = audioBtn_Dingdong1.hasOn;

  bool showAnimated = false;
  Duration animD = Duration(milliseconds: 200);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        showAnimated = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: AnimatedContainer(
        duration: animD,
        color: Colors.black.withValues(alpha: showAnimated ? 0.7 : 0),
        child: Center(
          child: AnimatedScale(
            duration: animD,
            // offset: showAnimated ? Offset.zero : Offset(0, 1),
            scale: showAnimated ? 1.0 : 0.8,
            child: Container(
              width: 336.w,
              height: 436.h,
              color: Colors.blueAccent.withValues(alpha: 0.0),
              child: Stack(
                children: [
                  Center(
                    child: Image.asset(
                      Assets.twimgB.notificationBg.path,
                      width: 336.w,
                      height: 436.h,
                      fit: BoxFit.fill,
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
                            child: TwTxtGraBorderC143(
                              text: "Notification Permission",
                              fontSize: 16.sp,
                              strokeColor: Color(0xff904833),
                              fontWeight: FontWeight.w900,
                              strokeWidth: 2.w,
                              gradient: LinearGradient(
                                colors: [Color(0xffffffff), Color(0xffFFF59B)],
                                end: Alignment.bottomCenter,
                                begin: Alignment.topCenter,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 30.h),
                        TwTxtGraBorderC143(
                          text: "Don’t Miss Tomorrow",
                          fontSize: 20.sp,
                          strokeColor: Color(0xff904833),
                          fontWeight: FontWeight.w900,
                          strokeWidth: 0.1.w,
                          gradient: LinearGradient(
                            colors: [Color(0xffFFFD97), Color(0xffFFFD97)],
                            end: Alignment.bottomCenter,
                            begin: Alignment.topCenter,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        TwTxtGraBorderC143(
                          text: "Big Reward!",
                          fontSize: 32.sp,
                          strokeColor: Color(0xff904833),
                          fontWeight: FontWeight.w900,
                          strokeWidth: 0.1.w,
                          height: 1.2,
                          gradient: LinearGradient(
                            colors: [Color(0xffFFFB2A), Color(0xffFFAA00)],
                            end: Alignment.bottomCenter,
                            begin: Alignment.topCenter,
                          ),
                        ),

                        Image.asset(
                          Assets.twimgB.notificationCenter.path,
                          width: 100.h,
                          height: 100.h,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40.w),
                          child: Text(
                            "Turn on notifications for tomorrow’s exclusive high-value bonus!",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                              fontSize: 14.sp,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 30.h),
                        btnClaim(),
                        SizedBox(height: 4.h),

                        // Text(
                        //   "Give Up",
                        //   style: TextStyle(
                        //     fontWeight: FontWeight.w700,
                        //     color: Color(0xffFFF1AC),
                        //     fontSize: 14.sp,
                        //   ),
                        //   textAlign: TextAlign.center,
                        // ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 0.w,
                    top: 15.h,
                    child: GestureDetector(
                      onTap: onClose,
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
        ),
      ),
    );
  }

  Widget btnClaim() {
    return Center(
      child: GestureDetector(
        onTap: onClaim,
        child: Container(
          width: 232.h,
          height: 52.h,
          color: Colors.black.withValues(alpha: 0.0),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Image.asset(
                Assets.twimg.btnSpin.path,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fitWidth,
              ),
              Center(
                child: TwTxtBorderC143(
                  text: "Enable For Cash-Out",
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w900,
                  fontColor: Color(0xffffffff),
                  foreground: Color(0xff22431B),
                ),
              ),
              Positioned(top: 30.h, right: 0.w, child: TwLottieGesture()),

              // Positioned(
              //   top: -10.h,
              //   left: -5.h,
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
    );
  }

  void onClaim() {
    AppSettings.openAppSettings(type: AppSettingsType.notification);
    widget.onBtn();
  }

  onClose() async {
    twLooog("======Setting close");
    // setState(() {
    //   showAnimated = false;
    // });
    // await Future.delayed(animD);
    widget.onClose();
  }
}
