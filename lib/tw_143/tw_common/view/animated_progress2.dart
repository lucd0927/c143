import 'dart:async';

import 'package:c143/tw_base/tw_gj/countryC143.dart';
import 'package:c143/tw_base/tw_gj/logC143.dart';
import 'package:c143/tw_views/font_border.dart';
import 'package:c143/tw_views/font_gradient_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shiny_striped_progress_bar/shiny_striped_progress_bar.dart';

class TwAnimatedProgress2 extends StatefulWidget {
  const TwAnimatedProgress2({
    super.key,
    required this.width,
    required this.height,
    this.maxProgress = 1.0,
  });

  final double width;
  final double height;
  final double maxProgress;

  @override
  State<TwAnimatedProgress2> createState() => _TwAnimatedProgress2State();
}

class _TwAnimatedProgress2State extends State<TwAnimatedProgress2> {
  double startTime = 0.0;
  late Timer _timer;
  final Duration _delayTime = Duration(milliseconds: _oneTime);
  double _allTime = 2000;
  static const int _oneTime = 100;
  bool canGoToMain = true;
  Timer? _delayTimer;
  double value = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      twLooog("======= _allTime: $_allTime");
      double count = _allTime / _oneTime;
      _timer = Timer.periodic(_delayTime, (time) {
        // ggPrint("time:${time.tick} =========count:$count");
        int tick = time.tick;

        if (tick > count + 1) {
          _timer.cancel();
        } else {
          setState(() {
            startTime = tick * _oneTime / _allTime;
            value = startTime * 100;
            if (startTime >= 1) {
              startTime = 1.0;
              value = 100;
            }
          });
        }
      });
      // abInitttt();
    });
  }

  xiayigeyemina() {}

  @override
  Widget build(BuildContext context) {
    double curProgreeToNum = startTime*100;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Progress to: ",
              style: TextStyle(
                fontSize: 16.sp,
                color: Color(0xffA4FFBC),
                fontWeight: FontWeight.w700,
              ),
            ),
            TwTxtGraBorderC143(
              text:
              "${TwCountryyC143.curCountryyyySymbolC143()}${curProgreeToNum.toStringAsFixed(0)}",
              fontSize: 16.sp,
            ),
          ],
        ),
        SizedBox(height: 4.h),
        Container(
          width: widget.width,
          height: widget.height,

          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.centerLeft,
            children: [
              SizedBox(
                width: widget.width,
                height: widget.height,
                child: _AnimatedGradientProgressBar(
                  value: startTime, // 表示 60%
                  gradientColors: [
                    Color(0xffEFFF04),
                    Color(0xffF9B821),
                    Color(0xffF7AA0C),
                    Color(0xffFBD107),
                  ],
                  height: widget.height - 2.h,
                  borderRadius: BorderRadius.circular(30.w),
                ),
              ),
              Center(
                child: TwTxtBorderC143(
                  text: "${(startTime * 100.toInt()).toStringAsFixed(0)}%",
                  foreground: Color(0xff3D100E),
                  fontWeight: FontWeight.w700,
                  fontSize: 20.sp,
                  fontColor: Color(0xffF9F7ED),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer.cancel();
    _delayTimer?.cancel();
  }
}

class _AnimatedGradientProgressBar extends StatelessWidget {
  final BorderRadius borderRadius;
  final double value; // 当前进度 0.0 ~ 1.0
  final double height;
  final Duration duration;
  final List<Color> gradientColors;

  const _AnimatedGradientProgressBar({
    super.key,
    required this.value,
    this.height = 8.0,
    this.duration = const Duration(milliseconds: 120),
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.gradientColors = const [Colors.blue, Colors.purple],
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: value.clamp(0.0, 1.0)),
      duration: duration,
      curve: Curves.linear,
      builder: (context, animatedValue, child) {
        return ClipRRect(
          borderRadius: borderRadius,
          child: Container(
            height: height,
            decoration: BoxDecoration(color: Color(0xff000000).withValues(alpha: 0.3)),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: animatedValue,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: gradientColors,
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      border: Border.all(color: Color(0xff421614), width: 1.w),
                      borderRadius: BorderRadius.circular(height),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}


class _AnimatedGradientProgressBar2 extends StatelessWidget {
  final BorderRadius borderRadius;
  final double value; // 当前进度 0.0 ~ 1.0
  final double height;
  final Duration duration;
  final List<Color> gradientColors;

  const _AnimatedGradientProgressBar2({
    super.key,
    required this.value,
    this.height = 8.0,
    this.duration = const Duration(milliseconds: 100),
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.gradientColors = const [Colors.blue, Colors.purple],
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: value.clamp(0.0, 1.0)),
      duration: duration,
      curve: Curves.linear,
      builder: (context, animatedValue, child) {
        return ClipRRect(
          borderRadius: borderRadius,
          child: Container(
            height: height,
            decoration: BoxDecoration(
              color: Color(0xff7F3B00),
              border: Border.all(color: Color(0xffFFC941), width: 1.w),
              borderRadius: BorderRadius.circular(height),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: animatedValue,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    // decoration: BoxDecoration(
                    //   gradient: LinearGradient(
                    //     colors: gradientColors,
                    //     begin: Alignment.topCenter,
                    //     end: Alignment.bottomCenter,
                    //   ),
                    //   border: Border.all(color: Color(0xff5CD3F4), width: 0.w),
                    //   borderRadius: BorderRadius.circular(height),
                    // ),
                    child: ShinyStripedProgressBar(
                      targetProgress: 1,
                      // height: 15.w,
                      duration: Duration(microseconds: 100),
                      progressColor: Color(0xff29BE00),
                      borderRadius: BorderRadius.all(Radius.circular(15.w)),
                      stripeAngle: StripeAngle.angle45,
                      stripeColor: Color(0xff79DD35),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          // Color(0xffffffff).withValues(alpha: 0.3),
                          Color(0xffffffff).withValues(alpha: 0.3),
                          Color(0xffffffff).withValues(alpha: 0.5),
                          Color(0xffffffff).withValues(alpha: 0.3),
                          Color(0xffffffff).withValues(alpha: 0.2),
                          Color(0xffffffff).withValues(alpha: 0.0),
                          Color(0xffffffff).withValues(alpha: 0.0),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      border: Border.all(color: Color(0xff5CD3F4), width: 0.w),
                      borderRadius: BorderRadius.circular(height),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
