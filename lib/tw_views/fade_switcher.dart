
import 'package:flutter/material.dart';

class FadeSwitcher extends StatefulWidget {
  final List<Widget> children;
  final Duration fadeDuration;
  final Duration displayDuration;

  const FadeSwitcher({
    super.key,
    required this.children,
    this.fadeDuration = const Duration(milliseconds: 200),
    this.displayDuration = const Duration(seconds: 3),
  });

  @override
  State<FadeSwitcher> createState() => _FadeSwitcherState();
}

class _FadeSwitcherState extends State<FadeSwitcher>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    final totalDuration =
        widget.fadeDuration * 2 + widget.displayDuration; // 淡入+停留+淡出

    _controller = AnimationController(vsync: this, duration: totalDuration);

    // 0~0.3 淡入，0.3~0.7 保持，0.7~1.0 淡出
    _fadeAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: 1.0), weight: 30),
      TweenSequenceItem(tween: ConstantTween(1.0), weight: 40),
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 0.0), weight: 30),
    ]).animate(_controller);

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _currentIndex = (_currentIndex + 1) % widget.children.length;
        });
        _controller.forward(from: 0); // 无限循环
      }
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: widget.children[_currentIndex],
    );
  }
}