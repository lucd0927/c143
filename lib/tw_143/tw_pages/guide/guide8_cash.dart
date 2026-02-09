import 'package:auto_size_text/auto_size_text.dart';
import 'package:c143/gen/assets.gen.dart';
import 'package:c143/tw_143/tw_common/lottieeee/gesture.dart';
import 'package:c143/tw_143/tw_pages/guide/guide1_water.dart';
import 'package:c143/tw_143/tw_pages/guide/guide4_fertilize.dart';
import 'package:c143/tw_143/tw_pages/guide/guide6_rewarddouble.dart';
import 'package:c143/tw_143/tw_pages/main/main_controller.dart';
import 'package:c143/tw_143/tw_pages/main_cash/main_cash_controller.dart';
import 'package:c143/tw_143/tw_pages/main_tree/main_tree_controller.dart';
import 'package:c143/tw_base/tw_ad/guiyin/package.dart';
import 'package:c143/tw_base/tw_gj/countryC143.dart';
import 'package:c143/tw_base/tw_gj/logC143.dart';
import 'package:c143/tw_base/tw_gj/overlay_manager.dart';
import 'package:c143/tw_base/tw_http/event_report.dart';
import 'package:c143/tw_views/animated_count.dart';
import 'package:c143/tw_views/animated_scale.dart';
import 'package:c143/tw_views/font_border.dart';
import 'package:c143/tw_views/font_gradient_border.dart';
import 'package:c143/tw_views/tw_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OverlayGuide8Cash {
  OverlayEntry? _overlayEntry;

  ///是否真正显示
  bool get isShowing => _isShowing;
  bool _isShowing = false;

  void show({required double coins}) {
    _overlayEntry = null;
    TwMaiDiannnn.new_cash_v();
    MainController.to.resetIndex(MainController.cashIndex);

    Widget child = Material(
      color: Colors.transparent,
      child: Guide8Cash(
        coins: coins,
        onClose: () async {
          close();
          TwMaiDiannnn.new_cash_c();
          MainCashController.to.showMoneyHeroJsonTrue();
        },
      ),
    );
    kHashCode = OverlayManager.show(context: Get.context!, child: child);

    _isShowing = true;
  }

  String kHashCode = "";

  void close() {
    _isShowing = false;
    _overlayEntry?.remove();
    OverlayManager.clearOverlayEntry(kHashCode);
  }
}

class Guide8Cash extends StatefulWidget {
  const Guide8Cash({super.key, required this.onClose, required this.coins});

  final VoidCallback onClose;
  final double coins;

  @override
  State<Guide8Cash> createState() => _Guide8CashState();
}

class _Guide8CashState extends State<Guide8Cash> {
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
      color: Colors.black.withValues(alpha: showAnimated ? overlayOpacity : 0),
      child: AnimatedScale(
        duration: animD,
        scale: showAnimated ? 1.0 : startScale,
        child: SizedBox(
          width: ScreenUtil().screenWidth,
          height: ScreenUtil().screenHeight,
          child: IndexedStack(index: index, children: [contentB()]),
        ),
      ),
    );
  }

  Widget contentB() {
    List<Color> prgressTxt = MainCashController.to.progressColors();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 10.h),
        Center(
          child: Container(
            width: 296.w,
            height: 368.h,
            child: Stack(
              children: [
                Image.asset(
                  Assets.twimgB.guideWithdd.path,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.fill,
                ),
                Center(
                  child: Column(
                    children: [
                      SizedBox(height: 120.h),
                      Container(
                        height: 40.h,
                        child: Center(
                          child: TwTxtGraBorderC143(
                            text: "Congrats!",
                            gradient: LinearGradient(
                              colors: [
                                Color(0xff000000),
                                Color(0xff000000),
                                Color(0xff000000),
                                Color(0xff000000),
                              ],
                              end: Alignment.bottomCenter,
                              begin: Alignment.topCenter,
                            ),
                            height: 1.3,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Container(
                        width: 272.w,
                        height: 84.h,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xffEDFCFF), Color(0xffD8F2FF)],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          borderRadius: BorderRadius.circular(8.h),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "You Received",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Color(0xff686D73),
                                fontWeight: FontWeight.w700,
                              ),
                            ),

                            Text(
                              "${TwCountryyC143.curCountryyyySymbolC143()}${MainTreeController.to.curMoneyyyy.value.toStringAsFixed(2)}",
                              style: TextStyle(
                                fontSize: 36.sp,
                                color: Color(0xff004ECB),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40.h),
                      GestureDetector(
                        onTap: onClaim,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              width: 272.w,
                              height: 40.h,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: prgressTxt,
                                  // begin: Alignment.topCenter,
                                  // end: Alignment.bottomCenter,
                                ),
                                borderRadius: BorderRadius.circular(8.h),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 0),
                                    blurRadius: 8.w,
                                    color: Color(0xff66CAFF),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  "Cash-Out Today",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 24.sp,
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 20.h,
                              right: -30.w,
                              // child: TwAScale(
                              //   child: Image.asset(
                              //     Assets.twimg.gesture.path,
                              //     width: 70.w,
                              //     height: 70.w,
                              //   ),
                              // ),
                              child: TwLottieGesture(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void onClaim() {
    widget.onClose();
  }
}
