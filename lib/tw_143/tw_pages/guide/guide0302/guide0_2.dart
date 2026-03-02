import 'dart:async';
import 'dart:ui';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:c143/gen/assets.gen.dart';
import 'package:c143/tw_143/tw_common/lottieeee/gesture.dart';
import 'package:c143/tw_143/tw_pages/guide/guide0302/guide_controller.dart';
import 'package:c143/tw_base/tw_gj/countryC143.dart';
import 'package:c143/tw_views/font_border.dart';
import 'package:c143/tw_views/font_gradient_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Guide02 extends StatefulWidget {
  const Guide02({super.key});

  @override
  State<Guide02> createState() => _Guide02State();
}

class _Guide02State extends State<Guide02> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: Colors.transparent,
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().screenHeight,
        child: Column(
          children: [
            SizedBox(height: 80.h),
            step1(),
            step2(),
            step3(),
            SizedBox(height: 50.h),
            btnClaim(),
          ],
        ),
      ),
    );
  }

  Widget btnClaim() {
    return Center(
      child: AnimatedSize(
        duration: Duration(milliseconds: 200),
        child: GestureDetector(
          onTap: onget,
          child: Container(
            width: 260.w,
            height: 56.h,
            color: Colors.black.withValues(alpha: 0.0),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset(
                  Assets.twimg.btnSpin.path,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.fill,
                ),
                Center(
                  child: TwTxtBorderC143(
                    text: "LET’S START EARNING",
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w900,
                    fontColor: Color(0xffffffff),
                    foreground: Color(0xff22431B),
                  ),
                ),
                Positioned(top: 30.h, right: 30.w, child: TwLottieGesture()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  step1() {
    return Column(
      children: [
        Text(
          "ADVERTISERS PAY",
          style: TextStyle(
            fontSize: 24.sp,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        TwTxtGraBorderC143(
          text: "WE PAY YOU 80%",
          fontSize: 28.sp,
          fontWeight: FontWeight.w800,
          height: 1.4,
        ),
      ],
    );
  }

  adImage({required String icon}) {
    double width = 68.w;
    double height = 44.w;
    return Image.asset(icon, width: width, height: height, fit: BoxFit.fill);
  }

  List<String> imgs = [
    Assets.twimg0302.guideAd.img0.path,
    Assets.twimg0302.guideAd.img1.path,
    Assets.twimg0302.guideAd.img2.path,
    Assets.twimg0302.guideAd.img3.path,
    Assets.twimg0302.guideAd.img4.path,
    Assets.twimg0302.guideAd.img5.path,
    Assets.twimg0302.guideAd.img6.path,
    Assets.twimg0302.guideAd.img7.path,
    Assets.twimg0302.guideAd.img8.path,
  ];

  List<String> imgs2 = [
    Assets.twimg0302.guideAd.img9.path,
    Assets.twimg0302.guideAd.img10.path,
    Assets.twimg0302.guideAd.img11.path,
    Assets.twimg0302.guideAd.img12.path,
    Assets.twimg0302.guideAd.img13.path,
    Assets.twimg0302.guideAd.img14.path,
    Assets.twimg0302.guideAd.img15.path,
    Assets.twimg0302.guideAd.img16.path,
    Assets.twimg0302.guideAd.img17.path,
  ];

  step2() {
    List<Widget> topAdImgs = [];
    for (int i = 0; i < 9; i++) {
      topAdImgs.add(adImage(icon: imgs[i]));
      topAdImgs.add(SizedBox(width: 20.w));
    }

    List<Widget> topAdImgs2 = [];
    for (int i = 0; i < 9; i++) {
      topAdImgs2.add(adImage(icon: imgs2[i]));
      topAdImgs2.add(SizedBox(width: 20.w));
    }
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(height: 20.h),
            Text(
              "TRUSTED PARTNERS",
              style: TextStyle(
                fontSize: 14.sp,
                color: Color(0xff8FBFD1),
                fontWeight: FontWeight.w700,
              ),
            ),
            InfiniteScroll(
              speed: 180,
              direction: ScrollDirection.rightToLeft, // 换成 leftToRight 反向
              child: Row(children: topAdImgs),
            ),
            SizedBox(height: 4.h),
            InfiniteScroll(
              speed: 180,
              direction: ScrollDirection.leftToRight, // 换成 leftToRight 反向
              child: Row(children: topAdImgs2),
            ),
          ],
        ),
      ],
    );
  }

  step3() {
    return Column(
      children: [
        SizedBox(height: 20.h),
        Image.asset(
          Assets.twimg0302.guideTree2.path,
          width: 180.w,
          height: 220.w,
          fit: BoxFit.fill,
        ),
        SizedBox(height: 10.h),
        Container(
          width: 220.w,
          height: 60.h,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xffFFAE00), width: 2.w),
            color: Color(0xff0F2C74),
            borderRadius: BorderRadius.circular(16.w),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(Assets.twimg.ad.path, width: 28.w, height: 28.w),
              SizedBox(width: 8.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "ACTION",
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Color(0xff8FBFD1),
                      fontWeight: FontWeight.w700,
                      height: 1,
                    ),
                  ),
                  Text(
                    "WATCH ADS & EARN",
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Color(0xffffffff),
                      fontWeight: FontWeight.w800,
                      height: 1,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  void onget() {
    GuideController0302.to.onGuide2();
  }
}

enum ScrollDirection { leftToRight, rightToLeft }

class InfiniteScroll extends StatefulWidget {
  final Widget child;
  final double speed; // px/s
  final ScrollDirection direction;

  const InfiniteScroll({
    super.key,
    required this.child,
    this.speed = 50,
    this.direction = ScrollDirection.rightToLeft,
  });

  @override
  State<InfiniteScroll> createState() => _InfiniteScrollState();
}

class _InfiniteScrollState extends State<InfiniteScroll>
    with SingleTickerProviderStateMixin {
  late final ScrollController _scrollController;
  late final Ticker _ticker;
  double _scrollPos = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _ticker = createTicker(_tick)..start();
  }

  void _tick(Duration elapsed) {
    if (!_scrollController.hasClients) return;

    // 每帧滚动距离
    final dx = widget.speed / 60; // 假设 60fps
    _scrollPos += widget.direction == ScrollDirection.rightToLeft ? dx : -dx;

    // 循环滚动
    final maxScroll = _scrollController.position.maxScrollExtent;
    if (_scrollPos > maxScroll) _scrollPos = 0;
    if (_scrollPos < 0) _scrollPos = maxScroll;

    _scrollController.jumpTo(_scrollPos);
  }

  @override
  void dispose() {
    _ticker.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      controller: _scrollController,
      physics: const NeverScrollableScrollPhysics(),
      child: Row(
        children: [
          widget.child,
          widget.child, // 复制一份，用于无缝循环
        ],
      ),
    );
  }
}
