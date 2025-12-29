import 'package:auto_size_text/auto_size_text.dart';
import 'package:c143/gen/assets.gen.dart';
import 'package:c143/tw_143/tw_pages/main_tree/main_tree_controller.dart';
import 'package:c143/tw_base/tw_gj/loggggg.dart';
import 'package:c143/tw_views/animated_count.dart';
import 'package:c143/tw_views/animated_scale.dart';
import 'package:c143/tw_views/tw_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OverlayGuide2Coin {
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
          child: Guide2CoinWidget(
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

class Guide2CoinWidget extends StatefulWidget {
  const Guide2CoinWidget({
    super.key,
    required this.guideChild,
    required this.guideContext,
    required this.onClose,
  });

  final Widget guideChild;
  final BuildContext guideContext;
  final VoidCallback onClose;

  @override
  State<Guide2CoinWidget> createState() => _Guide2CoinWidgetState();
}

class _Guide2CoinWidgetState extends State<Guide2CoinWidget> {
  int index = 0;

  bool showAnimated = false;
  Duration animD = Duration(milliseconds: 200);
  double startScale = 0.8;

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
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: animD,
      color: Colors.black.withValues(alpha: showAnimated ? 0.6 : 0),
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
            left: 0,
            right: 0,
            top: 200.h,
            child: Center(
              child: Container(
                width: double.infinity,
                height: 320.h,
                color: Colors.amber.withValues(alpha: 0.0),
                child: Center(
                  child: Obx(() {
                    String icon = MainTreeController.to.treeIcon();
                    return Container(
                      width: 280.h,
                      height: 280.h,
                      child: Stack(
                        children: [
                          Image.asset(
                            icon,
                            width: 280.h,
                            height: 280.h,
                            gaplessPlayback: true,
                          ),
                          Positioned(
                            child: levelWidget(),
                            left: 0,
                            right: 0,
                            bottom: 0.h,
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
          Positioned(
            left: topLeftPosition.dx,
            top: topLeftPosition.dy,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                IgnorePointer(child: guideChild),
                Positioned(
                  top: 20.h,
                  left: 20.w,
                  child: TwAScale(
                    child: Image.asset(
                      Assets.twimg.gesture.path,
                      width: 70.w,
                      height: 70.w,
                    ),
                  ),
                ),


              ],
            ),
          ),

          Positioned(
            top: 80.h,
            right: 0,
            left: 0,
            child: Center(
              child: Image.asset(
                Assets.twimg.guide2cointips.path,
                width: 324.h,
                height: 160.h,
                fit: BoxFit.fill,
              ),
            ),
          ),

        ],
      ),
    );
  }


  levelWidget() {
    int curLevel = MainTreeController.to.curLevel.value;
    double progress = MainTreeController.to.curLevelProgress();
    twLooog("=====progress:$progress");
    return Center(
      child: Container(
        width: 140.w,
        height: 16.h,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xffFAE4B6), Color(0xffFAC986)],
            end: Alignment.bottomCenter,
            begin: Alignment.topCenter,
          ),
          borderRadius: BorderRadius.circular(16.h),
          border: Border.all(color: Color(0xffDEB378), width: 0.5.w),
        ),
        child: Row(
          children: [
            SizedBox(width: 8.w),
            TwAnimatedCountttt(
              value: curLevel,
              fractionDigits: 0,

              prefix: "Lv.",
              textStyle: TextStyle(
                fontSize: 14.sp,
                color: Color(0xff634417),
                height: 1,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  double maxWidth = constraints.maxWidth;

                  return TwProgress(
                    height: 12.h,
                    innerHeight: 8.h,
                    width: maxWidth,
                    progress: progress,
                    gradientColors: [Color(0xffFFB52B), Color(0xffFF5F03)],
                    bgColor: Color(0xffC18420),
                  );
                },
              ),
            ),
            SizedBox(width: 8.w),
          ],
        ),
      ),
    );
  }
}
