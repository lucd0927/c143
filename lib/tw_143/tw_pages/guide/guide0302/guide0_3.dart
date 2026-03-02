import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:c143/gen/assets.gen.dart';
import 'package:c143/tw_143/tw_common/lottieeee/gesture.dart';
import 'package:c143/tw_143/tw_pages/guide/guide0302/guide_controller.dart';
import 'package:c143/tw_base/tw_gj/countryC143.dart';
import 'package:c143/tw_views/font_border.dart';
import 'package:c143/tw_views/font_gradient_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class Guide03 extends StatefulWidget {
  const Guide03({super.key, required this.onEnd});
  final VoidCallback onEnd;
  @override
  State<Guide03> createState() => _Guide03State();
}

class _Guide03State extends State<Guide03> {
  final StepAppearController _controller = StepAppearController();

  bool hasComplete = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _controller.nextStep();
      },
      child: Container(
        color: Colors.transparent,
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().screenHeight,
        child: Column(
          children: [
            SizedBox(height: 80.h),
            TwTxtGraBorderC143(
              text: "Real Cash Out ${TwCountryyC143.curCountryyyySymbolC143()}100\nNo Hacks!",
              fontSize: 28.sp,
              fontWeight: FontWeight.w800,
              height: 1.4,
            ),

            SizedBox(height: 50.h),

            StepAppear(
              controller: _controller,
              waitDuration: Duration(milliseconds: 800),
              onFinished: () {
                setState(() {
                  hasComplete = true;
                });
              },
              children: [step1(), step2(), step3()],
            ),
            SizedBox(height: 20.h),
            btnClaim(),

          ],
        ),
      ),
    );
  }

  Widget btnClaim() {
    return Center(
      child: AnimatedSize(
        duration: Duration(milliseconds: 200),
        child: hasComplete
            ? GestureDetector(
          onTap: onget,
          child: Container(
            width: 260.w,
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
                    text: "Continue",
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w900,
                    fontColor: Color(0xffffffff),
                    foreground: Color(0xff22431B),
                  ),
                ),
                Positioned(top: 30.h, right: 30.w, child: TwLottieGesture()),
              ],
            ),
          ),
        )
            : SizedBox(width: 260.h),
      ),
    );
  }



  step2() {
    return Container(
      width: 130.w,
      height: 130.w,
      // color: Colors.red,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                Assets.twimg0302.guide03Vs.path,
                width: 88.w,
                height: 88.w,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }

  step1() {
    return Container(
      width: 160.w,
      height: 360.w,
      // color: Colors.amber,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset(
                  Assets.twimg0302.guide03Error.path,
                  width: 160.w,
                  height: 360.w,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  step3() {
    return Container(
      width: 200.w,
      height: 390.w,
      // color: Colors.amber,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset(
                  Assets.twimg0302.guide03Ok.path,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }



  onget() async{
    await GuideController0302.to.onGuide3();
    widget.onEnd();
  }
}

class StepAppearController {
  late void Function() _nextStep;

  /// 主动调用进入下一步
  void nextStep() {
    _nextStep();
  }
}

class StepAppear extends StatefulWidget {
  final List<Widget> children;
  final Duration stepDuration; // 每个动画时长
  final Duration waitDuration; // 每一步停留的等待时长
  final StepAppearController? controller;
  final VoidCallback? onFinished; // 全部完成回调

  const StepAppear({
    super.key,
    required this.children,
    this.stepDuration = const Duration(milliseconds: 600),
    this.waitDuration = const Duration(seconds: 2),
    this.controller,
    this.onFinished,
  });

  @override
  State<StepAppear> createState() => _StepAppearState();
}

class _StepAppearState extends State<StepAppear> with TickerProviderStateMixin {
  late final List<AnimationController> _controllers;
  late final List<Animation<Offset>> _offsetAnimations;

  int _currentStep = 0;
  bool _finished = false;

  @override
  void initState() {
    super.initState();

    _controllers = List.generate(widget.children.length, (i) {
      return AnimationController(vsync: this, duration: widget.stepDuration);
    });

    _offsetAnimations = _controllers.map((c) {
      return Tween<Offset>(
        begin: const Offset(0, -0.5),
        end: Offset.zero,
      ).animate(CurvedAnimation(parent: c, curve: Curves.easeOut));
    }).toList();

    // 暴露控制方法给外部
    widget.controller?._nextStep = _nextStep;

    _startStep(0);
  }

  /// 执行某一步
  void _startStep(int step) async {
    if (step >= widget.children.length) {
      setState(() => _finished = true);
      widget.onFinished?.call();
      return;
    }

    _currentStep = step;
    _controllers[step].forward();

    // 等待动画 + 停留时间
    await Future.delayed(widget.stepDuration + widget.waitDuration);

    // 如果没有被手动跳过并且还没结束 -> 自动进入下一步
    if (mounted && step == _currentStep && !_finished) {
      _startStep(step + 1);
    }
  }

  /// 主动进入下一步（内部用 / 外部调用）
  void _nextStep() {
    if (_finished) return;
    _startStep(_currentStep + 1);
  }

  @override
  void dispose() {
    for (var c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int i = 0;
    Widget child1 = SlideTransition(
      position: _offsetAnimations[i],
      child: FadeTransition(
        opacity: _controllers[i],
        child: widget.children[i],
      ),
    );

    int ii = 1;
    Widget child2 = SlideTransition(
      position: _offsetAnimations[ii],
      child: FadeTransition(
        opacity: _controllers[ii],
        child: widget.children[ii],
      ),
    );
    int q = 2;
    Widget child3 = SlideTransition(
      position: _offsetAnimations[q],
      child: FadeTransition(
        opacity: _controllers[q],
        child: widget.children[q],
      ),
    );
    return Container(
      width: ScreenUtil().screenWidth,
      height: 430.h,
      color: Colors.yellow.withValues(alpha: 0),
      child: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [

            Positioned(
              left: 10.w,
              top: 0,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  child1,

                ],
              ),
            ),
            Positioned(left: 150.w, top: 30.h, child: child3),
            Positioned(
              child: Center(child: child2),
              top: 80.h,
              left: 100.w,
            ),
          ],
        ),
      ),
    );

  }
}
