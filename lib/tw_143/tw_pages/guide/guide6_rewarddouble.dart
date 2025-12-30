import 'package:auto_size_text/auto_size_text.dart';
import 'package:c143/gen/assets.gen.dart';
import 'package:c143/tw_base/tw_gj/loggggg.dart';
import 'package:c143/tw_views/animated_scale.dart';
import 'package:c143/tw_views/font_border.dart';
import 'package:c143/tw_views/shimmer_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OverlayGuide6RewardDouble {
  OverlayEntry? _overlayEntry;

  ///是否真正显示
  bool get isShowing => _isShowing;
  bool _isShowing = false;

  void show() {
    _overlayEntry = null;

    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Material(
          color: Colors.transparent,
          child: Container(
            color: Colors.black.withValues(alpha: 0.6),

            child: Guide6RewardDouble(
              onClose: () async {
                twLooog("=====OverlayGuideTestAnim=close");
                close();
              },
            ),
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

class Guide6RewardDouble extends StatefulWidget {
  const Guide6RewardDouble({super.key, required this.onClose});

  final VoidCallback onClose;

  @override
  State<Guide6RewardDouble> createState() => _Guide6RewardDoubleState();
}

class _Guide6RewardDoubleState extends State<Guide6RewardDouble> {
  int index = 0;
  double itemHgith = 0;

  bool showEffect = false;

  bool showAnimated = false;
  Duration animD = Duration(milliseconds: 200);
  double startScale = 0.8;

  bool showDoubleEx = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          showAnimated = true;
        });

        Future.delayed(Duration(milliseconds: 5000), () {
          if (mounted) {
            setState(() {
              showDoubleEx = true;
            });
            Future.delayed(Duration(milliseconds: 2000), () {
              widget.onClose();
            });
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        twLooog("=====_GuideTestWidgetState=close");
        // widget.onClose();
      },
      child: AnimatedContainer(
        duration: animD,
        color: Colors.black.withValues(alpha: showAnimated ? 0.6 : 0),
        child: AnimatedScale(
          duration: animD,
          scale: showAnimated ? 1.0 : 1.0,
          child: Container(
            width: ScreenUtil().screenWidth,
            height: ScreenUtil().screenHeight,
            color: Colors.black.withValues(alpha: 0.0),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Center(
                  child: showDoubleEx
                      ? _coinDouble()
                      : FittedBox(child: ScaleOverlayAnim()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _coinDouble() {
    return TwAScale(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 176.h,
            height: 176.h,
            child: Stack(
              children: [
                Image.asset(
                  Assets.twimg.coinGuide6.path,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),

          TwTxtBorder(
            text: "x2",
            fontWeight: FontWeight.w900,
            fontSize: 40.sp,
            fontColor: Color(0xffFFE56F),
            foreground: Color(0xff9D790E),
          ),
        ],
      ),
    );
  }
}

class ScaleOverlayAnim extends StatefulWidget {
  const ScaleOverlayAnim({super.key});

  @override
  State<ScaleOverlayAnim> createState() => _ScaleOverlayAnimState();
}

class _ScaleOverlayAnimState extends State<ScaleOverlayAnim>
    with SingleTickerProviderStateMixin {
  static double containerHeight = 360.w;

  late AnimationController _controller;
  late Animation<double> heightAnim;
  late Animation<double> slideAnim;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    // 底图：先执行
    heightAnim = Tween<double>(begin: 0, end: containerHeight * 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.6, curve: Curves.easeOutCubic),
      ),
    );

    // 上下叠图：后执行
    slideAnim = Tween<double>(begin: -360.w, end: 0.w).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.6, 1.0, curve: Curves.easeInOut),
      ),
    );

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 360.w,
      height: 124.h,
      child: FittedBox(
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            // 底图
            AnimatedBuilder(
              animation: heightAnim,
              builder: (_, __) {
                return Transform.translate(
                  offset: Offset(slideAnim.value, 0),
                  child: Container(
                    width: 360.w,
                    height: 124.h,
                    child: Stack(
                      children: [
                        ShiningEffect(
                          duration: Duration(milliseconds: 2000),
                          shineColor: Color(0xffffffff),
                          opacity: 0.6,
                          angle: -0.1,
                          topLeft: false,
                          child: Image.asset(
                            Assets.twimg.animatedBg11.path,

                            width: 360.w,
                            height: 124.h,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Text(
                              "Your ad space value is SKYROCKETING!\n🚀 You’re now a TOP FEATURED SPOT on the platform!",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w900,
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),

            // 上图
            AnimatedBuilder(
              animation: _controller,
              builder: (_, __) {
                final h = heightAnim.value / 2;
                return Positioned(
                  top: -14.h,
                  child: Transform.translate(
                    offset: Offset(-slideAnim.value, 0),
                    child: Container(
                      color: Colors.white.withValues(alpha: 0),
                      child: Image.asset(
                        Assets.twimg.animatedBg12.path,
                        width: 360.w,
                        height: 28.h,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                );
              },
            ),

            // 下图
            AnimatedBuilder(
              animation: _controller,
              builder: (_, __) {
                final h = heightAnim.value / 2;
                return Positioned(
                  bottom: -14.h,
                  child: Transform.translate(
                    offset: Offset(-slideAnim.value, 0),
                    child: Image.asset(
                      Assets.twimg.animatedBg13.path,
                      width: 360.w,
                      height: 28.h,
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
