import 'package:flutter/material.dart';

/// 一个通用闪光特效组件，可用于任意子Widget
class TwShiningEffect extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final bool enabled;
  final double shineWidth; // 闪光带宽占比 (0.0 - 1.0)，相对于控件宽度
  final Color shineColor;
  final double opacity;
  final double angle;
  final double? borderRadius;
  final bool topLeft;

  const TwShiningEffect({
    super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 1800),
    this.enabled = true,
    this.shineWidth = 0.3,
    this.shineColor = Colors.white,
    this.opacity = 0.6,
    this.borderRadius,
    this.angle = 1.4,
    this.topLeft = true,
  });

  @override
  State<TwShiningEffect> createState() => _TwShiningEffectState();
}

class _TwShiningEffectState extends State<TwShiningEffect>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controllerC143;

  @override
  void initState() {
    super.initState();
    _controllerC143 = AnimationController(vsync: this, duration: widget.duration);

    if (widget.enabled) {
      _controllerC143.repeat();
    }
  }

  @override
  void didUpdateWidget(covariant TwShiningEffect oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.enabled && !_controllerC143.isAnimating) {
      _controllerC143.repeat();
    } else if (!widget.enabled && _controllerC143.isAnimating) {
      _controllerC143.stop();
    }
    if (oldWidget.duration != widget.duration) {
      _controllerC143.duration = widget.duration;
      if (widget.enabled) {
        _controllerC143
          ..reset()
          ..repeat();
      }
    }
  }

  @override
  void dispose() {
    _controllerC143.dispose();
    super.dispose();
  }

  /// percent: 0.0 -> 1.0
  /// 我们把 startX 计算成从 -width 到 +width，这样渐变会从左外侧扫到右外侧
  @override
  Widget build(BuildContext context) {
    if (!widget.enabled) return widget.child;

    return LayoutBuilder(
      builder: (context, c) {
        return AnimatedBuilder(
          animation: _controllerC143,
          builder: (context, child) {
            final double percent = _controllerC143.value;
            return ShaderMask(
              blendMode: BlendMode.srcATop, // 保留子控件原色并在上面叠加高光
              shaderCallback: (Rect bounds) {
                final double widthC143 = bounds.width;
                final double heightC143 = bounds.height;

                // 计算闪光带在控件坐标系内的偏移 - 从 -width 到 +width
                final double startX = widthC143 * (percent * 2 - 1);

                // 闪光带实际像素宽度
                final double shinePixel = (widthC143 * widget.shineWidth).clamp(
                  1.0,
                  widthC143,
                );

                // 为了让渐变平滑，构建比控件宽度更长的 rect（覆盖左右移动范围）
                // 这里我们把 shaderRect 放在 startX - shinePixel ... startX + shinePixel
                final double shaderLeft = startX - shinePixel;
                final double shaderWidth = widthC143 + shinePixel * 2;

                // 渐变颜色与定位：透明 -> 高亮 -> 透明
                final gradient = LinearGradient(
                  begin: widget.topLeft?Alignment.topLeft:Alignment.bottomRight,
                  end: widget.topLeft?Alignment.bottomRight:Alignment.topLeft,
                  transform: GradientRotation(widget.angle),
                  colors: [
                    Colors.transparent,
                    widget.shineColor.withValues(alpha: 0.1),
                    widget.shineColor.withValues(alpha: widget.opacity),
                    widget.shineColor.withValues(alpha: 0.1),
                    Colors.transparent,
                  ],
                  stops: [0, 0.44, 0.5, 0.56, 1],

                );

                // createShader 的 Rect 决定了渐变的位置与伸展，这里通过偏移 rect 实现移动效果
                return gradient.createShader(
                  Rect.fromLTWH(shaderLeft, 0, shaderWidth, heightC143),
                );
              },
              child: child,
            );
          },
          child: widget.child,
        );
      },
    );
  }
}