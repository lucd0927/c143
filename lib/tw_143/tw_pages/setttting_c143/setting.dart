import 'dart:io';

import 'package:c143/gen/assets.gen.dart';
import 'package:c143/tw_base/tw_gj/audio_playC143.dart';
import 'package:c143/tw_base/tw_gj/logC143.dart';
import 'package:c143/tw_views/font_border.dart';
import 'package:c143/tw_views/font_gradient_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class OverlaySettingggC143 {
  ///是否真正显示

  OverlayEntry? _overlayC143;

  void show() {
    _overlayC143 = null;
    _overlayC143 = OverlayEntry(
      builder: (context) {
        return _SettingWidgetC143(
          onClose: () {
            close();
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

class _SettingWidgetC143 extends StatefulWidget {
  const _SettingWidgetC143({super.key, required this.onClose});

  final VoidCallback onClose;

  @override
  State<_SettingWidgetC143> createState() => _SettingWidgetC143State();
}

class _SettingWidgetC143State extends State<_SettingWidgetC143> {
  bool positiveBtnMusic = audioBtn_coin1.hasOn;
  bool positiveBgMusic = audioMusic.hasOn;

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
              height: 292.h,
              color: Colors.blueAccent.withValues(alpha: 0.0),
              child: Stack(
                children: [
                  Center(
                    child: Image.asset(
                      Assets.twimgB.settingBg.path,
                      width: 336.w,
                      height: 292.h,
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
                              text: "Settings",
                              fontSize: 16.sp,
                              strokeColor: Color(0xff904833),
                              fontWeight: FontWeight.w900,
                              strokeWidth: 1.w,
                              gradient: LinearGradient(
                                colors: [Color(0xffffffff), Color(0xffFFF59B)],
                                end: Alignment.bottomCenter,
                                begin: Alignment.topCenter,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        _audioWidget(),
                        SizedBox(height: 20.h),
                        btnWdiget(
                          txt: "User Agreement",
                          onTap: () {
                            Uri uriii = Uri.parse(
                              "https://treeworldgardener.com/terms/",
                            );

                            _laUurrrr(uriii);
                          },
                        ),
                        SizedBox(height: 10.h),
                        btnWdiget(
                          txt: "Privacy Policy",
                          onTap: () {
                            Uri uriii = Uri.parse(
                              "https://treeworldgardener.com/privacy/",
                            );

                            _laUurrrr(uriii);
                          },
                        ),
                        SizedBox(height: 10.h),
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

  btnWdiget({required String txt, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 184.w,
        height: 45.h,
        color: Colors.transparent,
        child: Stack(
          children: [
            Positioned.fill(
              bottom: 4.h,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.w),
                  border: Border.all(color: Color(0xff712A26), width: 2.w),
                  color: Colors.blueAccent.withValues(alpha: 0.0),
                ),

                child: Center(
                  child: TwTxtBorderC143(
                    text: txt,
                    fontSize: 16.sp,
                    fontColor: Color(0xffffffff),
                    foreground: Color(0xff712A26),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _onBtnMusic(bool toggle) {
    setState(() {
      positiveBtnMusic = !positiveBtnMusic;
      twLooog("== sound=toggle:$toggle==");
      audioBtn_coin1.setSWHasOn(positiveBtnMusic, showAudioPlayOrPause: false);
    });
  }

  _onBgMusic(bool toggle) {
    setState(() {
      positiveBgMusic = !positiveBgMusic;
      twLooog("== music=toggle:$positiveBgMusic==");
      audioMusic.setSWHasOn(positiveBgMusic, showAudioPlayOrPause: true);
    });
  }

  onClose() async {
    twLooog("======Setting close");
    // setState(() {
    //   showAnimated = false;
    // });
    // await Future.delayed(animD);
    widget.onClose();
  }



  _audioWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: (){
              _onBtnMusic(positiveBtnMusic);
            },
            child: Image.asset(
              !positiveBtnMusic?Assets.twimgB.settingVolumeUn.path: Assets.twimgB.settingVolume.path,
              width: 68.w,
              height: 68.h,
              fit: BoxFit.fill,
            ),
          ),
          GestureDetector(
            onTap: (){
              _onBgMusic(positiveBgMusic);
            },
            child: Image.asset(
              !positiveBgMusic?Assets.twimgB.settingMusicUn.path:  Assets.twimgB.settingMusic.path,
              width: 68.w,
              height: 68.h,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> _laUurrrr(
  Uri uri, {
  LaunchMode mode = LaunchMode.platformDefault,
}) async {
  if (!await launchUrl(uri)) {
    // throw Exception('Could not launch $uri');
  }
}

// Future<void> _launEeeee() async {
//   final Uri emailLaunchUri = Uri(
//     scheme: 'mailto',
//     path: 'luckySlots@gmail.com',
//     queryParameters: {'subject': '', 'body': ''},
//   );
//
//   if (await canLaunchUrl(emailLaunchUri)) {
//     await launchUrl(emailLaunchUri);
//   } else {
//     throw 'Could not launch email app';
//   }
// }
