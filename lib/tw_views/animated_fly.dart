import 'dart:math';

import 'package:c143/gen/assets.gen.dart';
import 'package:c143/tw_base/tw_gj/logC143.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

TwOverlayAnimatedS2T overlayCoinMain = TwOverlayAnimatedS2T();

class TwOverlayAnimatedS2T {
  ///是否真正显示
  bool get hasShow => _isShowing;
  bool _isShowing = false;
  OverlayEntry? _overlay;
  BuildContext? childContext;
  BuildContext? targetContext;

  void show({
    required Widget heroChild,
    int count = 10,
    VoidCallback? onEnd,
    bool showTargetWidget = false,
  }) {
    try {
      _overlay = null;
      if (childContext == null) {
        return;
      }
      if (targetContext == null) {
        return;
      }
      List<Widget> childrenC143 = [];
      for (int i = 0; i < count; i++) {
        childrenC143.add(heroChild);
      }
      if (childrenC143.isEmpty) {
        return;
      }

      RenderBox box = childContext!.findRenderObject() as RenderBox;
      Size startSize = box.size;
      var topLeftPosition = box.localToGlobal(Offset.zero);
      if (targetContext != null && targetContext!.mounted) {
        RenderBox targetBox = targetContext!.findRenderObject() as RenderBox;
        Size endSize = targetBox.size;
        var targetLocation = targetBox.localToGlobal(Offset.zero);
        twLooog(
          "=show==topLeftPosition:$topLeftPosition==targetLocation:$targetLocation",
        );
        _innerOverlayC143(
          childrenC143,
          topLeftPosition,
          targetLocation,
          startSize,
          endSize,
          onEnd,
          showTargetWidget,
        );
      }
    } catch (e) {
      twLooog("==SWAnimatedWidgetOverlay==error:$e=");
    }
  }

  void _innerOverlayC143(
    List<Widget> children,
    Offset topLeftPosition,
    Offset targetLocation,
    Size startSize,
    Size endSize,
    VoidCallback? onEnd,
    bool showTargetWidget,
  ) {
    _overlay = OverlayEntry(
      builder: (context) {
        return Material(
          color: Colors.red.withValues(alpha: 0.0),
          child: IgnorePointer(
            child: _Source2FlyTargetC143(
              start: topLeftPosition,
              end: targetLocation,
              arcHeight: 10,
              startSize: startSize,
              endSize: endSize,
              duration: Duration(milliseconds: 800),
              delayBetween: Duration(milliseconds: 20),
              onFinish: () {
                close();
                if (onEnd != null) {
                  onEnd();
                }
              },
              showTargetWidget: showTargetWidget,
              children: children,
            ),
          ),
        );
      },
    );
    Overlay.of(Get.context!).insert(_overlay!);
    _isShowing = true;
  }

  void showWithSize({
    Widget? heroChild,
    required Size childSize,
    int count = 10,
    VoidCallback? onEnd,
    Offset? topLeftOffset,
    bool showTargetWidget = false,
  }) {
    // if (_isShowing) return;
    _overlay = null;
    twLooog("=======showWithSize==targetContext:$targetContext");
    if (targetContext == null) {
      onEnd?.call();
      return;
    }

    List<Widget> children = [];
    heroChild ??= Image.asset(
      Assets.twimg.coin.path,
      width: 24.w,
      height: 24.w,
      fit: BoxFit.fill,
    );
    for (int i = 0; i < count; i++) {
      children.add(heroChild);
    }

    if (children.isEmpty) {
      return;
    }

    Size startSize = childSize;
    var topLeftPosition =
        topLeftOffset ??
        Offset(
          ScreenUtil().screenWidth / 2 - startSize.width / 2,
          ScreenUtil().screenHeight / 2,
        );
    if (targetContext != null && targetContext!.mounted) {
      RenderBox targetBox = targetContext!.findRenderObject() as RenderBox;
      Size endSize = targetBox.size;
      var targetLocation = targetBox.localToGlobal(Offset.zero);
      twLooog(
        "=showWithSize==topLeftPosition:$topLeftPosition==targetLocation:$targetLocation",
      );
      _innerOverlayC143(
        children,
        topLeftPosition,
        targetLocation,
        startSize,
        endSize,
        onEnd,
        showTargetWidget,
      );
    }
  }

  void close() {
    _isShowing = false;
    _overlay?.remove();
    _overlay = null;
    // childContext = null;
    // targetContext = null;
  }
}

class _Source2FlyTargetC143 extends StatefulWidget {
  final List<Widget> children;
  final Offset start;
  final Offset end;
  final double arcHeight;
  final Duration duration;
  final Duration delayBetween; // 每个 widget 的启动间隔
  final VoidCallback? onFinish;
  final Size startSize; // 初始大小
  final Size endSize; // 最终大小
  final bool showTargetWidget;

  const _Source2FlyTargetC143({
    super.key,
    required this.children,
    required this.start,
    required this.end,
    this.arcHeight = 80,
    this.duration = const Duration(milliseconds: 1000),
    this.delayBetween = const Duration(milliseconds: 50),
    required this.startSize,
    required this.endSize,
    this.onFinish,
    required this.showTargetWidget,
  });

  @override
  State<_Source2FlyTargetC143> createState() => _Source2FlyTargetC143State();
}

class _Source2FlyTargetC143State extends State<_Source2FlyTargetC143>
    with TickerProviderStateMixin {
  final List<_FlyModelC143> _items = [];

  @override
  void initState() {
    super.initState();
    _startAllAnimationsC143();
  }

  void _startAllAnimationsC143() {
    for (int i = 0; i < widget.children.length; i++) {
      Future.delayed(widget.delayBetween * i, () {
        _createFlyingItemC143(widget.children[i], i == widget.children.length - 1);
      });
    }
  }

  void _createFlyingItemC143(Widget widgetToFly, bool isLast) {
    final controllerC143 = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    // final animation = CurvedAnimation(parent: controller, curve: Curves.linear);

    final dx = widget.start.dx;
    final dy = widget.start.dy;
    double random = Random().nextDouble() * 100 - 50;
    double random2 = Random().nextDouble() * 100 - 40;
    Offset middleOffset = Offset(dx + random, dy + random2);
    // 多段动画
    var animationC143 = TweenSequence<Offset>([
      // 第一段：从 start -> middle
      TweenSequenceItem(
        tween: Tween(
          begin: widget.start,
          end: middleOffset,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 2, // 权重决定时长比例
      ),
      // 第二段：停留在 middle
      TweenSequenceItem(
        tween: ConstantTween(middleOffset),
        weight: 2, // 停留时长
      ),
      // 第三段：middle -> end
      TweenSequenceItem(
        tween: Tween(
          begin: middleOffset,
          end: widget.end,
        ).chain(CurveTween(curve: Curves.easeInOut)),
        weight: 6,
      ),
    ]).animate(controllerC143);
    final flyingItem = _FlyModelC143(
      widget: widgetToFly,
      animation: animationC143,
      controller: controllerC143,
    );

    setState(() => _items.add(flyingItem));

    controllerC143.forward().whenComplete(() {
      setState(() => _items.remove(flyingItem));
      if (isLast) widget.onFinish?.call();
    });
  }


  double? lerpDouble(double a, double b, double t) => a + (b - a) * t;

  @override
  void dispose() {
    for (final item in _items) {
      item.controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final positionTweenC143 = Tween<Offset>(
      begin: widget.start,
      end: widget.end,
    ).chain(CurveTween(curve: Curves.easeInOut));
    final sizeTweenC143 = Tween<Size>(
      begin: widget.startSize,
      end: widget.endSize,
    ).chain(CurveTween(curve: Curves.easeInOut));
    // twLooog("===size:${widget.startSize}==widget.endSize:${widget.endSize}");
    return Stack(
      children: [
        if (widget.showTargetWidget && widget.children.isNotEmpty)
          Positioned(
            left: widget.end.dx + 0.w,
            top: widget.end.dy + 0.h,
            child: widget.children[0],
          ),
        ..._items.map((item) {
          return AnimatedBuilder(
            animation: item.animation,
            builder: (_, __) {
              final t = item.animation.value;
              final pos = positionTweenC143.evaluate(item.controller);
              final size = sizeTweenC143.evaluate(item.controller);
              // twLooog("===size:$size==");
              // final dx = lerpDouble(widget.start.dx, widget.end.dx, item.controller.value)!;
              // final dy = _calcY(
              //   item.controller.value,
              //   widget.start.dy,
              //   widget.end.dy,
              //   widget.arcHeight,
              // );

              final dx = t.dx;
              final dy = t.dy;

              // 处理大小插值
              double width = size.width;
              double height = size.height;

              Widget child = item.widget;
              if (widget.startSize != null && widget.endSize != null) {
                child = Container(
                  width: width,
                  height: height,
                  color: Colors.teal.withValues(alpha: 0.0),
                  child: FittedBox(fit: BoxFit.contain, child: item.widget),
                );
              }

              return Positioned(left: dx, top: dy, child: child);
            },
          );
        }),
      ],
    );
  }
}

class _FlyModelC143 {
  final Widget widget;
  final Animation<Offset> animation;
  final AnimationController controller;

  _FlyModelC143({
    required this.widget,
    required this.animation,
    required this.controller,
  });
}
