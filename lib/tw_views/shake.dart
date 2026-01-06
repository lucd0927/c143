import 'package:flutter/material.dart';

enum ShakeModeC143 {
  translate, // 平移抖动
  rotate,    // 旋转抖动
}

class TwShakeWidgetC143 extends StatefulWidget {
  final Widget child;
  final Duration duration; // 单次抖动动画时长
  final double offset; // 抖动幅度
  final Axis axis; // 平移方向
  final ShakeModeC143 mode; // 抖动模式
  final Duration pause; // 抖动后停顿时间
  final bool autoPlay; // 是否自动运行

  const TwShakeWidgetC143({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
    this.offset = 10.0,
    this.axis = Axis.horizontal,
    this.mode = ShakeModeC143.translate,
    this.pause = const Duration(seconds: 2),
    this.autoPlay = true,
  });

  @override
  State<TwShakeWidgetC143> createState() => _TwShakeWidgetC143State();
}

class _TwShakeWidgetC143State extends State<TwShakeWidgetC143>
    with SingleTickerProviderStateMixin {
  late AnimationController _controllerC143;
  late Animation<double> _animationC143;

  @override
  void initState() {
    super.initState();

    _controllerC143 = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    _animationC143 = Tween(begin: 0.0, end: widget.offset)
        .chain(CurveTween(curve: Curves.elasticIn))
        .animate(_controllerC143);

    if (widget.autoPlay) {
      _startLoopC143();
    }
  }

  /// 自动循环：抖动一次 → 停顿 → 再抖动
  void _startLoopC143() async {
    while (mounted && widget.autoPlay) {
      await _controllerC143.forward();
      await _controllerC143.reverse();
      await Future.delayed(widget.pause); // 停顿
    }
  }

  /// 手动触发一次抖动
  Future<void> shakeOnce() async {
    await _controllerC143.forward();
    await _controllerC143.reverse();
  }

  @override
  void dispose() {
    _controllerC143.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationC143,
      builder: (context, child) {
        if (widget.mode == ShakeModeC143.translate) {
          final offset = widget.axis == Axis.horizontal
              ? Offset(_animationC143.value, 0)
              : Offset(0, _animationC143.value);
          return Transform.translate(offset: offset, child: child);
        } else {
          return Transform.rotate(
            angle: _animationC143.value * 0.01,
            child: child,
          );
        }
      },
      child: widget.child,
    );
  }
}