import 'package:auto_size_text/auto_size_text.dart';
import 'package:c143/gen/assets.gen.dart';
import 'package:c143/tw_143/tw_pages/guide/guide2_coin.dart';
import 'package:c143/tw_views/animated_scale.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OverlayGuide1Water {
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
          child: Guide1WaterWidget(
            guideChild: guideChild!,
            guideContext: guideContext!,
            onClose: () async {
              close();

              OverlayGuide2Coin().show();
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
            left: topLeftPosition.dx,
            top: topLeftPosition.dy,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                IgnorePointer(child: guideChild),
                Positioned(
                  top: 30.h,
                  left: 30.w,
                  child: TwAScale(
                    child: Image.asset(
                      Assets.twimg.gesture.path,
                      width: 70.w,
                      height: 70.w,
                    ),
                  ),
                ),

                Positioned(
                  top: -80.h,
                  right: 0,
                  child: Image.asset(
                    Assets.twimg.guide1waterTips.path,
                    width: 270.h,
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
