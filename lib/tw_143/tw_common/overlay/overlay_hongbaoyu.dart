import 'dart:async';
import 'dart:math';

import 'package:c143/gen/assets.gen.dart';
import 'package:c143/sfcj/floating_particles/src/models/direction.dart';
import 'package:c143/sfcj/floating_particles/src/models/particle_config.dart';
import 'package:c143/sfcj/floating_particles/src/models/particle_type.dart';
import 'package:c143/sfcj/floating_particles/src/widgets/particle_effects_widget.dart';
import 'package:c143/tw_143/tw_common/overlay/overlay_get.dart';
import 'package:c143/tw_143/tw_common/view/progress.dart';
import 'package:c143/tw_143/tw_pages/guide/guide1_water.dart';
import 'package:c143/tw_143/tw_pages/main_tree/main_tree_controller.dart';
import 'package:c143/tw_base/tw_gj/logC143.dart';
import 'package:c143/tw_hive/twhiveC143.dart';
import 'package:c143/tw_views/animated_count.dart';
import 'package:c143/tw_views/font_border.dart';
import 'package:c143/tw_views/tw_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shiny_striped_progress_bar/shiny_striped_progress_bar.dart';

class OverlayHongbaoyu {
  OverlayEntry? _overlayEntry;

  ///是否真正显示
  bool get isShowing => _isShowing;
  bool _isShowing = false;

  void show({required VoidCallback onEnd}) {
    _overlayEntry = null;

    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Material(
          color: Colors.transparent,
          child: _hongbaoyuuu(
            onClose: (value) async {
              close();

              OverlayGetCoins().show(
                coins: value,
                onBtn: () {
                  onEnd();
                },
                onClose: () {
                  onEnd();
                },
                type: TwEnumGetCoinsType.hongbaoRainMoney,
              );
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

class _hongbaoyuuu extends StatefulWidget {
  const _hongbaoyuuu({required this.onClose});

  final ValueChanged<double> onClose;

  @override
  State<_hongbaoyuuu> createState() => _hongbaoyuuuState();
}

class _hongbaoyuuuState extends State<_hongbaoyuuu> {
  var box = TwHive.box;
  String twkeyFirst = "asfdasf12444Bbb";

  int index = 0;

  bool showAnimated = false;
  Duration animD = Duration(milliseconds: 200);
  double startScale = 0.8;

  Timer? _cutdownTimer;
  Timer? _jishiTimer;
  int maxTimer = 15;

  double getCoins = 0;

  bool hasFirst() {
    return box.get(twkeyFirst) ?? true;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          showAnimated = true;
        });
        bool _hasF = hasFirst();
        if (_hasF) {
          initJishiTimer();
        }
      }
    });
  }

  int daojishiCount = 3;

  initJishiTimer() {
    _jishiTimer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      int itke = timer.tick;

      if (itke >= 3) {
        _jishiTimer?.cancel();
       setState(() {
         daojishiCount = 0;
         initCutdownTimer();
       });
      } else {
        if (mounted) {
          setState(() {
            daojishiCount = daojishiCount - 1;
            if (daojishiCount <= 0) {
              daojishiCount = 0;
            }
            twLooog("====daojishiCount:$daojishiCount");
          });
        }
      }
    });
  }

  double progress = 0;
  String timeText = "";

  String _formatDuration(int seconds) {
    if (seconds <= 0) {
      return "";
    }

    Duration duration = Duration(seconds: seconds);
    String twoDigits(int n) => n.toString().padLeft(2, '0');

    String hours = twoDigits(duration.inHours);
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String secs = twoDigits(duration.inSeconds.remainder(60));

    return '$hours:$minutes:$secs';
  }

  initCutdownTimer() {
    timeText = _formatDuration(maxTimer);
    _cutdownTimer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      int tick = timer.tick;
      int left = maxTimer - tick;
      if (left < 0) {
        left = 0;
      }
      timeText = _formatDuration(left);
      if (tick >= maxTimer) {
        timer.cancel();
        if (mounted) {
          setState(() {
            progress = 1;
          });
        }
        widget.onClose(getCoins);
      } else {
        if (mounted) {
          setState(() {
            progress = tick / maxTimer;
            if (progress >= 1) {
              progress = 1;
            }
          });
        }
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
          child: daojishiCount == 0
              ? Stack(
                  // index: index,
                  children: [
                    Image.asset(
                      Assets.twimgB.moneyRainBg.path,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.fill,
                    ),
                    Hongbaoyu(
                      onClickValue: (value) {
                        if (mounted) {
                          setState(() {
                            getCoins = getCoins + value;
                          });
                        }
                      },
                    ),

                    Positioned(
                      left: 0,
                      right: 0,
                      top: 100.h,
                      child: IgnorePointer(
                        child: Container(
                          width: double.infinity,
                          height: 50.h,
                          decoration: BoxDecoration(
                            color: Colors.amber.withValues(alpha: 0),
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 30.w),
                              Container(
                                width: 219.w,
                                height: 28.h,
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Image.asset(
                                      Assets.twimg.hongbaoyuLeftbg.path,
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.fill,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: ClipPath(
                                        clipper: TrapezoidClipper(),
                                        child: AnimatedContainer(
                                          height: 20.h,
                                          duration: Duration(milliseconds: 500),
                                          width: 219.w * progress,
                                          color: Colors.amber.withValues(
                                            alpha: 0.0,
                                          ),
                                          child: ShinyStripedProgressBar(
                                            targetProgress: 1,
                                            backgroundColor: Colors.transparent,
                                            // height: 15.w,
                                            duration: Duration(
                                              microseconds: 100,
                                            ),
                                            progressColor: Color(
                                              0xffFFDC2B,
                                            ).withValues(alpha: 0.35),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(0.w),
                                            ),
                                            stripeAngle: StripeAngle.angle45,
                                            stripeColor: Color(
                                              0xffFFA339,
                                            ).withValues(alpha: 0.38),
                                          ),
                                        ),
                                      ),
                                    ),

                                    Positioned(
                                      top: -6.h,
                                      bottom: -6.h,
                                      left: -20.w,
                                      child: Image.asset(
                                        Assets.twimg.hongbaoyuTimer.path,
                                        width: 40.w,
                                        height: 40.h,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    Center(
                                      child: TwTxtBorderC143(text: timeText),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Container(
                                width: 104.w,
                                height: 28.h,

                                child: Stack(
                                  children: [
                                    Image.asset(
                                      Assets.twimg.hongbaoyuRightbg.path,
                                      width: double.infinity,
                                      height: double.infinity,
                                      fit: BoxFit.fill,
                                    ),

                                    Positioned.fill(
                                      left: -10.w,
                                      child: Row(
                                        children: [
                                          SizedBox(width: 10.w),
                                          Image.asset(
                                            MainTreeController.to
                                                .moneyIconTreeChild(),
                                            width: 24.w,
                                            height: 24.w,
                                          ),
                                          SizedBox(width: 4.w),

                                          TwAnimatedCountttt(
                                            value: getCoins,
                                            fractionDigits: 2,
                                            textStyle: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 14.sp,
                                              color: Color(0xffFFAA00),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      top: 50.h,
                      left: 16.w,
                      child: GestureDetector(
                        onTap: () {
                          _cutdownTimer?.cancel();
                          widget.onClose(getCoins);
                        },
                        child: Container(
                          width: 40.w,
                          height: 40.h,
                          color: Colors.amber.withValues(alpha: 0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Image.asset(
                              Assets.twimg.back.path,
                              width: 24.w,
                              height: 24.h,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : Stack(
                  children: [
                    Image.asset(
                      Assets.twimgB.moneyRainBg.path,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.fill,
                    ),

                    Positioned(
                      left: 0,
                      right: 0,
                      top: 0.h,
                      bottom: 100.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            Assets.twimgB.moneyRainTxt.path,
                            width: 280.w,
                            height: 120.h,
                          ),

                          Center(
                            child: Container(
                              width: 120.w,
                              height: 120.w,
                              decoration: BoxDecoration(
                                color: Color(0xffFFFFFF).withValues(alpha: 0.2),
                                borderRadius: BorderRadius.circular(120.w),
                              ),
                              child: Center(
                                child: TwAnimatedCountttt(
                                  value: daojishiCount,
                                  strokeWidth: 1.w,
                                  strokeColor: Color(0xff133F88),
                                  textGradient: LinearGradient(
                                    colors: [
                                      Color(0xffFFDF12),
                                      Color(0xffFFAA00),
                                    ],
                                    end: Alignment.bottomCenter,
                                    begin: Alignment.topCenter,
                                  ),
                                  textStyle: TextStyle(
                                    fontSize: 40.sp,
                                    color: Color(0xffFFDF12),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 50.h,
                      left: 16.w,
                      child: GestureDetector(
                        onTap: () {
                          _cutdownTimer?.cancel();
                          widget.onClose(getCoins);
                        },
                        child: Container(
                          width: 40.w,
                          height: 40.h,
                          color: Colors.amber.withValues(alpha: 0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Image.asset(
                              Assets.twimg.back.path,
                              width: 24.w,
                              height: 24.h,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _cutdownTimer?.cancel();
    _jishiTimer?.cancel();
  }
}

class Hongbaoyu extends StatelessWidget {
  const Hongbaoyu({super.key, required this.onClickValue});

  final ValueChanged<double> onClickValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withValues(alpha: 0.0),
      child: ParticleEffects(
        isEnabled: true,
        config: ParticleConfig(
          particleType: ParticleType.image,
          direction: ParticleDirection.topToBottom,
          // Already falling
          particleCount: 10,
          imagePath: MainTreeController.to.moneyIconTreeChild(),
          minSize: 50.w,
          maxSize: 50.w,
          enableRotation: false,
          // enableSizeVariation: true,
          velocityMultiplier: 2,
          animationDuration: Duration(seconds: 10),
          minOpacity: 1.0,
          maxOpacity: 1.0,
        ),
        onClickValue: (double value) {
          onClickValue(value);
        },
        child: Container(
          width: ScreenUtil().screenWidth,
          height: ScreenUtil().screenHeight,
          // width: 375.w,
          // height: 400.h,
          color: Colors.yellow.withValues(alpha: 0.0),
        ),
      ),
    );
  }
}

class TrapezoidClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width - size.height * 0.4, size.height)
      ..lineTo(0, size.height)
      // ..quadraticBezierTo(size.width, 0, size.width, 20)
      ..close();
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
