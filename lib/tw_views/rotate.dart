import 'package:flutter/material.dart';

class TwRotateWidgggggC143 extends StatefulWidget {
  final Widget child;
  final Duration duration; // 一圈所需时间
  final bool clockwise; // 是否顺时针
  final bool autoPlay; // 是否自动开始

  const TwRotateWidgggggC143({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 1500),
    this.clockwise = true,
    this.autoPlay = true,
  });

  @override
  State<TwRotateWidgggggC143> createState() => _TwRotateWidgggggC143State();
}

class _TwRotateWidgggggC143State extends State<TwRotateWidgggggC143>
    with SingleTickerProviderStateMixin {
  late AnimationController _controllerC143;

  @override
  void initState() {
    super.initState();
    _controllerC143 = AnimationController(
      duration: widget.duration,
      vsync: this,
    );

    if (widget.autoPlay) {
      _controllerC143.repeat(); // 无限旋转
    }
  }

  /// 外部调用：开始旋转
  void start() => _controllerC143.repeat();

  /// 外部调用：停止旋转
  void stop() => _controllerC143.stop();

  @override
  void dispose() {
    _controllerC143.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween(begin: 0.0, end: widget.clockwise ? 1.0 : -1.0)
          .animate(_controllerC143),
      child: widget.child,
    );
  }
}