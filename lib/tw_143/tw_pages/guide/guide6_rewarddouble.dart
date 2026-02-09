import 'package:auto_size_text/auto_size_text.dart';
import 'package:c143/gen/assets.gen.dart';
import 'package:c143/tw_143/tw_common/lottieeee/common.dart';
import 'package:c143/tw_143/tw_pages/guide/guide7_rank.dart';
import 'package:c143/tw_143/tw_pages/guide/guide8_cash.dart';
import 'package:c143/tw_143/tw_pages/main_tree/main_tree_controller.dart';
import 'package:c143/tw_base/tw_ad/guiyin/package.dart';
import 'package:c143/tw_base/tw_gj/logC143.dart';
import 'package:c143/tw_base/tw_gj/overlay_manager.dart';
import 'package:c143/tw_views/animated_scale.dart';
import 'package:c143/tw_views/font_border.dart';
import 'package:c143/tw_views/rotate.dart';
import 'package:c143/tw_views/shimmer_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OverlayGuide6RewardDouble {
  OverlayEntry? _overlayEntry;

  ///是否真正显示
  bool get isShowing => _isShowing;
  bool _isShowing = false;

  void show({required double coins}) {
    _overlayEntry = null;

    // _overlayEntry = OverlayEntry(
    //   builder: (context) {
    //     return Material(
    //       color: Colors.transparent,
    //       child: Container(
    //         child: Guide6RewardDouble(
    //           coins: coins,
    //           onClose: () async {
    //             twLooog("=====OverlayGuideTestAnim=close");
    //             // return;
    //             close();
    //             MainTreeController.to.saveGuideIndexData(
    //               MainTreeController.guide6,
    //             );
    //
    //             MainTreeController.to.onAddMoneyyyy(
    //               coins * 2,
    //               onEnd: () {
    //                 OverlayGuide7Rank().show();
    //               },
    //             );
    //           },
    //         ),
    //       ),
    //     );
    //   },
    // );
    // Overlay.of(Get.context!).insert(_overlayEntry!);

    Widget child =  Material(
      color: Colors.transparent,
      child: Container(
        child: Guide6RewardDouble(
          coins: coins,
          onClose: () async {
            twLooog("=====OverlayGuideTestAnim=close");
            // return;
            close();
            MainTreeController.to.saveGuideIndexData(
              MainTreeController.guide6,
            );

            MainTreeController.to.onAddMoneyyyy(
              coins * 2,
              onEnd: () {
                if(TwPackageABC143.isPackageB()){
                  OverlayGuide8Cash().show(coins: 1);
                }else{
                  OverlayGuide7Rank().show();
                }
              },
            );
          },
        ),
      ),
    );
    kHashCode =  OverlayManager.show(context: Get.context!, child: child);

    _isShowing = true;
  }
  String kHashCode = "";

  void close() {
    _isShowing = false;
    _overlayEntry?.remove();
    OverlayManager.clearOverlayEntry(kHashCode);

  }
}

class Guide6RewardDouble extends StatefulWidget {
  const Guide6RewardDouble({
    super.key,
    required this.onClose,
    required this.coins,
  });

  final VoidCallback onClose;
  final double coins;

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

        Future.delayed(Duration(milliseconds: 1900), () {
          if (mounted) {
            setState(() {
              showDoubleEx = true;
            });
            Future.delayed(Duration(milliseconds: 1000), () {
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
                      : FittedBox(child: _Guide6ScaleOverlayAnim()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _coinDouble() {
    return Container(
      width: 200.h,
      height: 240.h,
      child: Stack(
        children: [
          Center(
            child: TwAScaleC143(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 176.h,
                    height: 176.h,
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Positioned(
                          left: -20.w,
                          right: -20.w,
                          top: -20.h,
                          bottom: -20.h,
                          child: TwRotateWidgggggC143(
                            duration: Duration(milliseconds: 3000),
                            child: Image.asset(
                              Assets.twimg.bghightlight.path,
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.fill,
                            ),

                            // child: Container(
                            //   width: 60.h,
                            //   height: 60.h,
                            //   color: Colors.blue.withValues(alpha: 0.5),
                            // ),
                          ),
                          //
                          // child: TwLottieCommon(
                          //   type: EnumTwLottttieJson.bghightligth,
                          // ),
                        ),
                        Image.asset(
                          MainTreeController.to.moneyIconDialog(),
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.fill,
                        ),
                      ],
                    ),
                  ),

                  TwTxtBorderC143(
                    text: "x2",
                    fontWeight: FontWeight.w900,
                    fontSize: 40.sp,
                    fontColor: Color(0xffFFE56F),
                    foreground: Color(0xff9D790E),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Guide6ScaleOverlayAnim extends StatefulWidget {
  const _Guide6ScaleOverlayAnim({super.key});

  @override
  State<_Guide6ScaleOverlayAnim> createState() =>
      _Guide6ScaleOverlayAnimState();
}

class _Guide6ScaleOverlayAnimState extends State<_Guide6ScaleOverlayAnim>
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
                              TwPackageABC143.isPackageB()
                                  ? "Your ad space value is SKYROCKETING! 🚀 You’re now a TOP FEATURED SPOT on the platform!"
                                  : "Congratulations! Your tree is growing！🚀 ",
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
}
