
import 'package:flutter/material.dart';

class TwFadeSwitcherC143 extends StatefulWidget {
  final List<Widget> children;
  final Duration fadeDuration;
  final Duration displayDuration;

  const TwFadeSwitcherC143({
    super.key,
    required this.children,
    this.fadeDuration = const Duration(milliseconds: 200),
    this.displayDuration = const Duration(seconds: 3),
  });

  @override
  State<TwFadeSwitcherC143> createState() => _TwFadeSwitcherC143State();
}

class _TwFadeSwitcherC143State extends State<TwFadeSwitcherC143>
    with SingleTickerProviderStateMixin {
  late AnimationController _controllerC143;
  late Animation<double> _fadeAnimationC143;

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    final totalDuration =
        widget.fadeDuration * 2 + widget.displayDuration; // 淡入+停留+淡出

    _controllerC143 = AnimationController(vsync: this, duration: totalDuration);

    // 0~0.3 淡入，0.3~0.7 保持，0.7~1.0 淡出
    _fadeAnimationC143 = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.0), weight: 30),
      TweenSequenceItem(tween: ConstantTween(1.0), weight: 40),
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.0), weight: 30),
    ]).animate(_controllerC143);

    _controllerC143.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _currentIndex = (_currentIndex + 1) % widget.children.length;
        });
        _controllerC143.forward(from: 0); // 无限循环
      }
    });

    _controllerC143.forward();
  }

  @override
  void dispose() {
    _controllerC143.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimationC143,
      child: widget.children[_currentIndex],
    );
  }
}