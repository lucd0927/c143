import 'package:auto_size_text/auto_size_text.dart';
import 'package:c143/gen/assets.gen.dart';
import 'package:c143/tw_143/tw_pages/guide/guide1_water.dart';
import 'package:c143/tw_143/tw_pages/guide/guide3_adspot.dart';
import 'package:c143/tw_143/tw_pages/main/views/main_nav.dart';
import 'package:c143/tw_143/tw_pages/main_tree/main_tree_controller.dart';
import 'package:c143/tw_base/tw_gj/loggggg.dart';
import 'package:c143/tw_views/animated_count.dart';
import 'package:c143/tw_views/animated_scale.dart';
import 'package:c143/tw_views/shimmer_effect.dart';
import 'package:c143/tw_views/tw_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OverlayGuide7Rank {
  static BuildContext? guideContext;
  static Widget? guideChild;

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
          child: Guide7RankWidget(
            guideChild: guideChild!,
            guideContext: guideContext!,
            onClose: () async {
              close();
            },
          ),
        );
      },
    );
    Overlay.of(guideContext!).insert(_overlayEntry!);
    _isShowing = true;
  }

  void close() {
    _isShowing = false;
    _overlayEntry?.remove();
  }
}

class Guide7RankWidget extends StatefulWidget {
  const Guide7RankWidget({
    super.key,
    required this.guideChild,
    required this.guideContext,
    required this.onClose,
  });

  final Widget guideChild;
  final BuildContext guideContext;
  final VoidCallback onClose;

  @override
  State<Guide7RankWidget> createState() => _Guide7RankWidgetState();
}

class _Guide7RankWidgetState extends State<Guide7RankWidget> {
  int index = 0;

  bool showAnimated = false;
  Duration animD = Duration(milliseconds: 200);
  double startScale = 0.8;
  String _text = "";
  String text = "You’ve outpaced 65% of NEW USERS in earnings progress! ";
  String text2 = "You’ve entered the COIN OUT PREP ZONE! 🎉 ";
  String text3 = "Look! This spot will be YOURS SOON!! 🏆💸";
  String text4 = "Dare to challenge the COIN LEADERBOARD TOP SPOT?! 🏆💥";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _text = text;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          showAnimated = true;
        });
        Future.delayed(Duration(milliseconds: 3000), () {
          if (mounted) {
            setState(() {
              _text = text2;
            });
            Future.delayed(Duration(milliseconds: 3000), () {
              if (mounted) {
                setState(() {
                  _text = text3;
                });
                Future.delayed(Duration(milliseconds: 3000), () {});
              }
            });
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    RenderBox box = widget.guideContext.findRenderObject() as RenderBox;

    var topLeftPosition = box.localToGlobal(Offset.zero);

    return AnimatedContainer(
      duration: animD,
      color: Colors.black.withValues(alpha: showAnimated ? overlayOpacity : 0),
      child: AnimatedScale(
        duration: animD,
        scale: showAnimated ? 1.0 : startScale,
        child: SizedBox(
          width: ScreenUtil().screenWidth,
          height: ScreenUtil().screenHeight,
          child: IndexedStack(
            index: index,
            children: [
              GestureDetector(
                onTap: () {
                  widget.onClose();
                },
                child: Container(
                  color: Colors.red.withValues(alpha: 0.0),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        left: topLeftPosition.dx,
                        top: topLeftPosition.dy,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            IgnorePointer(
                              child: Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Positioned(
                                    top: -22.h,
                                    left: -topLeftPosition.dx,
                                    right: -0.w,
                                    bottom: 0,
                                    child: Container(
                                      color: Color(0xff0E226C),
                                      height: 22.h,
                                      width: double.infinity,
                                    ),
                                  ),
                                  widget.guideChild,
                                  Positioned(
                                    top: -22.h,
                                    left: -topLeftPosition.dx,
                                    right: -0.w,
                                    child: Container(
                                      color: Color(0xff0E226C),
                                      height: 22.h,
                                      width: double.infinity,
                                    ),
                                  ),
                                  Positioned(
                                    top: -42.h,
                                    left: -topLeftPosition.dx,
                                    right: -0.w,
                                    child: Image.asset(
                                      Assets.twimg.mainRankDes.path,
                                      width: double.infinity,
                                      height: 52.h,
                                      fit: BoxFit.fill,
                                      gaplessPlayback: true,
                                    ),
                                  ),



                                  Positioned(
                                    bottom: 320.h,
                                    left: -topLeftPosition.dx,
                                    right: -topLeftPosition.dx,
                                    child: _Guide7ScaleOverlayAnim(
                                      key: ValueKey(_text),
                                      text: _text,
                                    ),
                                  ),
                                  Positioned(
                                    top: -130.h,
                                    left: 0,
                                    right: 0,
                                    child: IgnorePointer(
                                      child: AnimatedSize(
                                        duration: Duration(milliseconds: 800),
                                        alignment: Alignment.topCenter,
                                        child: _text == text2
                                            ? Container(
                                          color: Colors.red.withValues(alpha: 0),
                                          child: Image.asset(
                                            Assets.twimg.guide7ArrowDown1.path,
                                            width: 88.h,
                                            height: 88.h,
                                          ),
                                        )
                                            : SizedBox(width: 88.h, height: 0.h),
                                      ),
                                    ),
                                  ),

                                  Positioned(
                                    top: -120.h,
                                    left: 0,
                                    right: 0,
                                    child: IgnorePointer(
                                      child: AnimatedSize(
                                        duration: Duration(milliseconds: 800),
                                        alignment: Alignment.topCenter,
                                        child: _text == text3
                                            ? Image.asset(
                                          Assets.twimg.guide7ArrowDown2.path,
                                          width: 120.h,
                                          height: 120.h,
                                        )
                                            : const SizedBox(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),





                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: IgnorePointer(child: MainNav()),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



class _Guide7ScaleOverlayAnim extends StatefulWidget {
  const _Guide7ScaleOverlayAnim({super.key, required this.text});

  final String text;

  @override
  State<_Guide7ScaleOverlayAnim> createState() =>
      _Guide7ScaleOverlayAnimState();
}

class _Guide7ScaleOverlayAnimState extends State<_Guide7ScaleOverlayAnim>
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
                            Assets.twimg.animatedBg21.path,

                            width: 360.w,
                            height: 124.h,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.w),
                            child: Text(
                              widget.text,
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
                        Assets.twimg.animatedBg22.path,
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
                      Assets.twimg.animatedBg23.path,
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
