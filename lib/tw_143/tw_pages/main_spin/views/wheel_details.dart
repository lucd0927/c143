import 'dart:math';

import 'package:c143/gen/assets.gen.dart';
import 'package:c143/tw_base/tw_gj/loggggg.dart';
import 'package:c143/tw_views/animated_scale.dart';
import 'package:c143/tw_views/font_border.dart';
import 'package:c143/tw_views/font_gradient_border.dart';
import 'package:c143/tw_views/shimmer_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:hive_ce_flutter/adapters.dart';

double _imgWidth = 336.h;
double _imgHeight = 324.h;
double _imgItemWidth = 52.h;

class SpinWheelDetails extends StatefulWidget {
  const SpinWheelDetails({super.key});

  @override
  State<SpinWheelDetails> createState() => _SpinWheelDetailsState();
}

class _SpinWheelDetailsState extends State<SpinWheelDetails> {
  @override
  Widget build(BuildContext context) {
    _imgWidth = 336.h;
    _imgHeight = 324.h;
    return Column(
      children: [
        SizedBox(height: 60.h),
        Container(
          color: Colors.blue.withValues(alpha: 0),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                color: Colors.red.withValues(alpha: 0),
                child: Center(
                  child: Image.asset(
                    Assets.twimg.spinWheel.path,
                    fit: BoxFit.fill,
                    width: _imgWidth,
                    height: _imgHeight,
                  ),
                ),
              ),

              PositionItems(),
            ],
          ),
        ),
      ],
    );
  }
}

class PositionItems extends StatefulWidget {
  const PositionItems({super.key});

  @override
  State<PositionItems> createState() => _PositionItemsState();
}

class _PositionItemsState extends State<PositionItems>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 6),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  int _selectIndex = -1;

  int indexCount = 12;
  int _startIndex = 0;

  void startSpin({
    int round = 5, // 转多少圈
    int startIndex = 0,
    int targetIndex = 3, // 最终停在哪个 icon
  }) {
    final int targetAngle = round * indexCount + targetIndex;
    _animation =
        IntTween(begin: startIndex, end: targetAngle).animate(
            CurvedAnimation(
              parent: _controller,
              // curve: Curves.easeInOutCubic, // 先加速后减速
              curve: Curves.fastOutSlowIn, // 先加速后减速
            ),
          )
          ..addListener(() {
            if (mounted) {
              // var value2 = _animation.value;
              // twLooog("=====value2:$value2");
              // return;
              int value = _animation.value;
              int tmpSelectIndex = value % indexCount;
              _selectIndex = tmpSelectIndex;

              setState(() {});
            }
          })
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              if (mounted) {
                setState(() {
                  _startIndex = targetIndex;
                });
              }
            }
          });

    _controller
      ..reset()
      ..forward();
  }

  @override
  Widget build(BuildContext context) {
    _imgItemWidth = 52.h;
    return Column(
      children: [
        Container(
          width: _imgWidth,
          height: _imgHeight,
          color: Colors.red.withValues(alpha: 0.0),
          child: Stack(
            children: [
              index0(),
              index1(),
              index2(),
              index3(),
              index4(),
              index5(),
              index6(),
              index7(),
              index8(),
              index9(),
              index10(),
              index11(),

              // centerBtnWinbig(),
            ],
          ),
        ),
        SizedBox(height: 12.h,),
        btnDrawNow(),
      ],
    );
  }

  Widget btnDrawNow() {
    return Center(
      child: GestureDetector(
        onTap: onWinbig,
        child: Container(
          width: 260.h,
          height: 56.h,
          color: Colors.black.withValues(alpha: 0.0),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              ShiningEffect(
                duration: Duration(milliseconds: 2000),
                shineColor: Color(0xffffffff),
                opacity: 0.6,
                angle: -0.1,
                topLeft: false,
                child: Image.asset(
                  Assets.twimg.btnSpin.path,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              Positioned(
                bottom: -30.h,
                right: -30.h,
                child: IgnorePointer(
                  child: TwAScale(
                    child: Image.asset(
                      Assets.twimg.gesture.path,
                      width: 70.w,
                      height: 70.w,
                    ),
                  ),
                ),
              ),
              Center(
                child: TwTxtBorder(
                  text: "Draw Now",
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w900,
                  fontColor: Color(0xffffffff),
                  foreground: Color(0xff22431B),
                ),
              ),
              Positioned(
                top: -10.h,
                left: -5.h,
                child: Image.asset(
                  Assets.twimg.ad.path,
                  width: 28.h,
                  height: 28.h,
                ),
              ),

              Positioned(
                top: -0.h,
                right: -5.h,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 0.h, horizontal: 4.h),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xffFF5151), Color(0xffCC0909)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Text(
                    "3 Change Left",
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w700,
                      color: Color(0xffFFD059),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget centerBtnWinbig() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 80.h,
      child: Center(
        child: GestureDetector(
          onTap: onWinbig,
          child: Container(
            width: 124.h,
            height: 44.h,
            color: Colors.black.withValues(alpha: 0.0),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset(
                  Assets.twimg.btnSpinWinbig.path,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.fill,
                ),

                Positioned(
                  top: -10.h,
                  left: -5.h,
                  child: Image.asset(
                    Assets.twimg.ad.path,
                    width: 28.h,
                    height: 28.h,
                  ),
                ),

                Positioned(
                  top: -0.h,
                  right: -5.h,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 0.h,
                      horizontal: 4.h,
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xffFF5151), Color(0xffCC0909)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Text(
                      "3/3",
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w700,
                        color: Color(0xffFFD059),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _indexItem({required int index}) {
    String icon = Assets.twimg.wheelCoin.path;
    Widget txt = const SizedBox();
    if (index == 0 ||
        index == 4 ||
        index == 5 ||
        index == 6 ||
        index == 7 ||
        index == 8 ||
        index == 9 ||
        index == 10 ||
        index == 11) {
      icon = Assets.twimg.wheelCoin.path;

      txt = Center(
        child: TwTxtGraBorder(
          text: "100",
          fontWeight: FontWeight.w700,
          fontSize: 20.sp,
          strokeColor: Color(0xffBD5500),
        ),
      );
    } else if (index == 1) {
      icon = Assets.twimg.wheelFeiliangad.path;
      txt = Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        child: TwTxtGraBorder(
          text: "speed up recovery",
          fontWeight: FontWeight.w700,
          fontSize: 8.sp,
          strokeColor: Color(0xffBD5500),
        ),
      );
    } else if (index == 2) {
      icon = Assets.twimg.wheelFeiliang.path;
      txt = Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        child: TwTxtGraBorder(
          text: "speed up recovery",
          fontWeight: FontWeight.w700,
          fontSize: 8.sp,
          strokeColor: Color(0xffBD5500),
        ),
      );
    } else if (index == 3) {
      icon = Assets.twimg.wheelDoubleex.path;
      txt = Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        child: TwTxtGraBorder(
          text: "double earnings",
          fontWeight: FontWeight.w700,
          fontSize: 8.sp,
          strokeColor: Color(0xffBD5500),
        ),
      );
    }

    return Container(
      width: _imgItemWidth,
      height: _imgItemWidth,
      color: Colors.amber.withValues(alpha: 0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Image.asset(
            icon,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.contain,
          ),
          if (_selectIndex == index)
            Positioned(
              left: -10.h,
              right: -10.h,
              top: -10.h,
              bottom: -10.h,
              child: Center(
                child: Container(
                  width: _imgItemWidth + 10.h,
                  height: _imgItemWidth + 10.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(_imgItemWidth),
                    border: Border.all(color: Colors.red.withValues(alpha: 0.5), width: 2.w),
                  ),
                  child: Stack(
                    children: [Image.asset(Assets.twimg.wheelScroll.path)],
                  ),
                ),
              ),
            ),
          txt,
        ],
      ),
    );
  }

  index0() {
    double left = _imgWidth / 2 - _imgItemWidth / 2;
    double top = 10.h;
    return Positioned(left: left, top: top, child: _indexItem(index: 0));
  }

  index6() {
    double left = _imgWidth / 2 - _imgItemWidth / 2;
    double top = 268.h;
    return Positioned(left: left, top: top, child: _indexItem(index: 6));
  }

  index1() {
    double left = _imgWidth / 2 - _imgItemWidth / 2 + 70.h;
    double top = 30.h;
    return Positioned(left: left, top: top, child: _indexItem(index: 1));
  }

  index11() {
    double left = 74.h;
    double top = 30.h;
    return Positioned(left: left, top: top, child: _indexItem(index: 11));
  }

  index2() {
    double left = _imgWidth / 2 - _imgItemWidth / 2 + 120.h;
    double top = 80.h;
    return Positioned(left: left, top: top, child: _indexItem(index: 2));
  }

  index10() {
    double left = 25.h;
    double top = 80.h;
    return Positioned(left: left, top: top, child: _indexItem(index: 10));
  }

  index3() {
    double left = _imgWidth / 2 - _imgItemWidth / 2 + 130.h;
    double top = 145.h;
    return Positioned(left: left, top: top, child: _indexItem(index: 3));
  }

  index9() {
    double left = 8.h;
    double top = 148.h;
    return Positioned(left: left, top: top, child: _indexItem(index: 9));
  }

  index4() {
    double left = _imgWidth / 2 - _imgItemWidth / 2 + 115.h;
    double top = 210.h;
    return Positioned(left: left, top: top, child: _indexItem(index: 4));
  }

  index8() {
    double left = 28.h;
    double top = 210.h;
    return Positioned(left: left, top: top, child: _indexItem(index: 8));
  }

  index5() {
    double left = _imgWidth / 2 - _imgItemWidth / 2 + 64.h;
    double top = 250.h;
    return Positioned(left: left, top: top, child: _indexItem(index: 5));
  }

  index7() {
    double left = 74.h;
    double top = 250.h;
    return Positioned(left: left, top: top, child: _indexItem(index: 7));
  }

  void onWinbig() {
    if (_selectIndex <= 0) {
      _startIndex = 0;
    }
    int targeIndex = Random().nextInt(12);
    startSpin(startIndex: _startIndex, targetIndex: targeIndex);
  }
}
