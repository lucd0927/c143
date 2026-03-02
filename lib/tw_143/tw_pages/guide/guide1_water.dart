import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:c143/gen/assets.gen.dart';
import 'package:c143/tw_143/tw_common/lottieeee/gesture.dart';
import 'package:c143/tw_143/tw_pages/guide/guide2_coin.dart';
import 'package:c143/tw_143/tw_pages/main_tree/main_tree_controller.dart';
import 'package:c143/tw_base/tw_ad/guiyin/package.dart';
import 'package:c143/tw_base/tw_gj/overlay_manager.dart';
import 'package:c143/tw_base/tw_http/event_report.dart';
import 'package:c143/tw_views/animated_scale.dart';
import 'package:c143/tw_views/shimmer_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

const double overlayOpacity = 0.79;

class OverlayGuide1Water {
  static BuildContext? guideContext;
  static Widget? guideChild;

  OverlayEntry? _overlayEntry;

  ///是否真正显示
  bool get isShowing => _isShowing;
  bool _isShowing = false;

  void show() {
    _overlayEntry = null;
    TwMaiDiannnn.guide_water_tap();
    // _overlayEntry = OverlayEntry(
    //   builder: (context) {
    //     return Material(
    //       color: Colors.transparent,
    //       child: Guide1WaterWidget(
    //         guideChild: guideChild!,
    //         guideContext: guideContext!,
    //         onClose: () async {
    //           close();
    //
    //           MainTreeController.to.onAddWaterCount(
    //             onEnd: () {
    //               MainTreeController.to.saveGuideIndexData(
    //                 MainTreeController.guide1,
    //               );
    //
    //               OverlayGuide2Coin().show();
    //             },
    //             showAd: false,
    //           );
    //         },
    //       ),
    //     );
    //   },
    // );
    // Overlay.of(guideContext!).insert(_overlayEntry!);
    Widget child = Material(
      color: Colors.transparent,
      child: Guide1WaterWidget(
        guideChild: guideChild!,
        guideContext: guideContext!,
        onClose: () async {
          close();

          MainTreeController.to.onAddWaterCount(
            onEnd: () {
              MainTreeController.to.saveGuideIndexData(
                MainTreeController.guide1,
              );

              OverlayGuide2Coin().show();
            },
            showAd: false,
          );
        },
      ),
    );
    kHashCode = OverlayManager.show(context: guideContext!, child: child);

    _isShowing = true;
  }

  String kHashCode = "";

  void close() {
    _isShowing = false;
    _overlayEntry?.remove();
    OverlayManager.clearOverlayEntry(kHashCode);
  }
}

class Guide1WaterWidget extends StatefulWidget {
  const Guide1WaterWidget({
    super.key,
    required this.guideChild,
    required this.guideContext,
    required this.onClose,
  });

  final Widget guideChild;
  final BuildContext guideContext;
  final VoidCallback onClose;

  @override
  State<Guide1WaterWidget> createState() => _Guide1WaterWidgetState();
}

class _Guide1WaterWidgetState extends State<Guide1WaterWidget> {
  int index = 0;

  bool showAnimated = false;
  Duration animD = Duration(milliseconds: 200);
  double startScale = 0.8;
  Timer? _timer;
  final Duration _timerD = Duration(milliseconds: 2000);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          showAnimated = true;
        });

      }
      initTimer();
    });
  }
  initTimer() {
    _timer?.cancel();
    _timer = Timer(_timerD, () {
      _timer?.cancel();
      if (mounted) {
        setState(() {
          index = 1;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
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
              Center(child: _Guide1ScaleOverlayAnim()),
              GestureDetector(
                onTap: () {
                  widget.onClose();
                },
                child: GuideWidget(
                  guideChild: widget.guideChild,
                  guideContext: widget.guideContext,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GuideWidget extends StatelessWidget {
  const GuideWidget({
    super.key,
    required this.guideChild,
    required this.guideContext,
  });

  final Widget guideChild;
  final BuildContext guideContext;

  @override
  Widget build(BuildContext context) {
    RenderBox box = guideContext.findRenderObject() as RenderBox;

    var topLeftPosition = box.localToGlobal(Offset.zero);
    return Container(
      color: Colors.transparent,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: topLeftPosition.dx,
            top: topLeftPosition.dy,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                // IgnorePointer(child: guideChild),
                IgnorePointer(
                  child: Container(
                    width: 60.h,
                    height: 60.h,
                    child: TwShiningEffect(
                      duration: Duration(milliseconds: 2000),
                      shineColor: Color(0xffffffff),
                      opacity: 1,
                      angle: -0.9,
                      topLeft: false,
                      child: Image.asset(
                        Assets.twimg.mainWater.path,
                        width: double.infinity,
                        height: double.infinity,
                        gaplessPlayback: true,
                      ),
                    ),
                  ),
                ),
                Positioned(top: 30.h, left: 30.w, child: TwLottieGesture()),

                Positioned(
                  top: -82.h,
                  right: 0,
                  child: Image.asset(
                    TwPackageABC143.isPackageB()
                        ? Assets.twimg0302.guide1Watertips.path
                        : Assets.twimg.guide1waterTips.path,
                    width: 272.h,
                    height: 80.h,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class _Guide1ScaleOverlayAnim extends StatefulWidget {
  const _Guide1ScaleOverlayAnim({super.key});

  @override
  State<_Guide1ScaleOverlayAnim> createState() =>
      _Guide1ScaleOverlayAnimState();
}

class _Guide1ScaleOverlayAnimState extends State<_Guide1ScaleOverlayAnim>
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
                        TwShiningEffect(
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
                              "Advertisers dropping cash! Claim yours now!",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w900,
                                color: Color(0xffffffff),
                              ),
                              textAlign: TextAlign.center,
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

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
}