import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:c143/gen/assets.gen.dart';
import 'package:c143/tw_143/tw_common/lottieeee/gesture.dart';
import 'package:c143/tw_143/tw_pages/main_tree/main_tree_controller.dart';
import 'package:c143/tw_base/tw_ad/ads_idddddC143.dart';
import 'package:c143/tw_base/tw_ad/base_ads.dart';
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

class OverlayFertilizePop {
  ///是否真正显示

  OverlayEntry? _overlayC143;

  void show({required VoidCallback onEnd}) {
    _overlayC143 = null;
    _overlayC143 = OverlayEntry(
      builder: (context) {
        return FertilizePop(
          onClose: () {
            close();
            onEnd();
          },
          onBtn: () async {
            close();
            bool result = await TwCommonAds().showRewardAd(
              adPosId: TwAdsPosId.cuvxv_manure_rv,
            );
            if (result) {
              MainTreeController.to.cutdown2ZeroFertilize();
            }
            onEnd();
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

class FertilizePop extends StatefulWidget {
  const FertilizePop({super.key, required this.onClose, required this.onBtn});

  final VoidCallback onClose;
  final VoidCallback onBtn;

  @override
  State<FertilizePop> createState() => _FertilizePopState();
}

class _FertilizePopState extends State<FertilizePop> {
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
              height: 300.h,
              color: Colors.blueAccent.withValues(alpha: 0.0),
              child: Stack(
                children: [
                  Center(
                    child: Image.asset(
                      Assets.twimgB.mainFertilizePop.path,
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
                              text: "Fertilizing in Progress",
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
                        Image.asset(
                          Assets.twimg.mainFertilize.path,
                          width: 100.h,
                          height: 100.h,
                        ),

                        SizedBox(height: 20.h),
                        btnClaim(),
                        SizedBox(height: 4.h),

                        GestureDetector(
                          onTap: onClose,
                          child: Text(
                            "Wait",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Color(0xffFFF1AC),
                              fontSize: 14.sp,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
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
                  text: "Unlock Early",
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w900,
                  fontColor: Color(0xffffffff),
                  foreground: Color(0xff22431B),
                ),
              ),
              Positioned(top: 30.h, right: 0.w, child: TwLottieGesture()),

              Positioned(
                top: -10.h,
                right: -5.h,
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
    );
  }

  void onClaim() {

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
