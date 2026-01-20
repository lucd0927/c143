import 'dart:math';

import 'package:c143/gen/assets.gen.dart';
import 'package:c143/tw_143/tw_common/event.dart';
import 'package:c143/tw_143/tw_common/firebase_json/number_json.dart';
import 'package:c143/tw_143/tw_common/lottieeee/gesture.dart';
import 'package:c143/tw_143/tw_common/overlay/overlay_get.dart';
import 'package:c143/tw_143/tw_common/overlay/overlay_hongbaoyu.dart';
import 'package:c143/tw_143/tw_pages/main/main_controller.dart';
import 'package:c143/tw_143/tw_pages/main_spin/main_spin_controller.dart';
import 'package:c143/tw_143/tw_pages/main_spin/views/overlay_win_reward.dart';
import 'package:c143/tw_143/tw_pages/main_tree/main_tree_controller.dart';
import 'package:c143/tw_base/tw_ad/ads_idddddC143.dart';
import 'package:c143/tw_base/tw_ad/base_ads.dart';
import 'package:c143/tw_base/tw_ad/guiyin/package.dart';
import 'package:c143/tw_base/tw_gj/audio_playC143.dart';
import 'package:c143/tw_base/tw_gj/countryC143.dart';
import 'package:c143/tw_base/tw_gj/event_busC143.dart';
import 'package:c143/tw_base/tw_gj/logC143.dart';
import 'package:c143/tw_base/tw_http/event_report.dart';
import 'package:c143/tw_views/animated_count.dart';
import 'package:c143/tw_views/animated_scale.dart';
import 'package:c143/tw_views/font_border.dart';
import 'package:c143/tw_views/font_gradient_border.dart';
import 'package:c143/tw_views/pb_tushi.dart';
import 'package:c143/tw_views/shimmer_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:tuple/tuple.dart';

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
    with SingleTickerProviderStateMixin, TwEventBusMix {
  late AnimationController _controller;
  late Animation<int> _animation;
  List<double> tmpCoins = [];
  List<Tuple3<String, double, double>> tmpMoneys = [];

  List<int> _cashSmall2BigIndex = [];
  List<int> _cutdownCashIndex = [];
  List<int> _cashIndex = [];
  List<int> _phoneIndex = [];
  List<int> _cashRainIndex = [];
  List<int> _cashOutIndex = [];
  List<int> _x2Index = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    register<SpinEvent>((SpinEvent event) {
      if (mounted) {
        _nextSpin();
      }
    });
    generatedCoins();
  }

  resetIndexes() {
    _cutdownCashIndex = [];
    _cashSmall2BigIndex = [];
    _cashIndex = [];
    _phoneIndex = [];
    _cashRainIndex = [];
    _cashOutIndex = [];
    _x2Index = [];
    tmpCoins = [];
    tmpMoneys = [];
  }

  generatedCoins() {
    if (TwPackageABC143.isPackageB()) {
      resetIndexes();
      List<Tuple3<String, double, double>> tmpTupe3 = TwNumberJson.moneyWheel();
      tmpMoneys = tmpTupe3;
      Map<double, int> _kNumber_vIndex = {};
      for (int i = 0; i < tmpTupe3.length; i++) {
        var daaa = tmpTupe3[i];
        double money = TwNumberJson.moneyTree();
        tmpCoins.add(money);

        String type = daaa.item1;
        // twLooog("=type:$type=====");
        if (type == TwEnumWheelType.cash.nnname) {
          _cashIndex.add(i);
          _kNumber_vIndex[money] = i;
        } else if (type == TwEnumWheelType.cash_out.nnname) {
          _cashOutIndex.add(i);
        } else if (type == TwEnumWheelType.cash_rain.nnname) {
          _cashRainIndex.add(i);
        } else if (type == TwEnumWheelType.phone.nnname) {
          _phoneIndex.add(i);
        } else if (type == TwEnumWheelType.x2.nnname) {
          _x2Index.add(i);
        }
      }
      twLooog("=_kIndex_vNumber:$_kNumber_vIndex=====");
      var _moneys = _kNumber_vIndex.keys.toList();
      _moneys.sort((a, b) => a.compareTo(b));
      twLooog("=_moneys:$_moneys=====");
      _moneys.forEach((value) {
        int index = _kNumber_vIndex[value] ?? -1;
        _cashSmall2BigIndex.add(index);
      });

      twLooog("=_cashIndex:$_cashIndex=====");
      twLooog("=_cutdownCashIndex:$_cutdownCashIndex=====");
      twLooog("=_cashSmall2BigIndex:$_cashSmall2BigIndex=====");
      twLooog("=_cashOutIndex:$_cashOutIndex=====");
      twLooog("=_cashRainIndex:$_cashRainIndex=====");
      twLooog("=_phoneIndex:$_phoneIndex=====");
      twLooog("=_x2Index:$_x2Index=====");
      return;
    } else {
      tmpCoins = [];
      for (int i = 0; i < 18; i++) {
        int coin = 100 + Random().nextInt(90);
        tmpCoins.add(coin * 1.0);
      }
    }
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
    bool hasMoneyRain = false,
  }) {

    final int targetAngle = round * indexCount + targetIndex;
    _animation =
        IntTween(begin: startIndex, end: targetAngle).animate(
          CurvedAnimation(
            parent: _controller,
            // curve: Curves.easeInOutCubic, // 先加速后减速
            curve: Curves.fastOutSlowIn, // 先加速后减速
          ),
        )..addListener(() {
          if (mounted) {
            // var value2 = _animation.value;
            // twLooog("=====value2:$value2");
            // return;
            int value = _animation.value;
            int tmpSelectIndex = value % indexCount;
            _selectIndex = tmpSelectIndex;
            // twLooog("======aaaastatus:$value");
            setState(() {});
          }
        });

    _controller
      ..reset()
      ..forward().whenComplete(() {
        audioBtn_spin.pause();
        if (mounted) {
          setState(() {
            _startIndex = targetIndex;
            canClick = true;
          });

          if (hasMoneyRain) {
            OverlayHongbaoyu().show(
              onEnd: () {
                _nextSpin();
              },
            );

            return;
          }

          OverlayGetCoins().show(
            coins: tmpCoins[_startIndex],
            onBtn: () {
              _nextSpin();
            },
            type: TwEnumGetCoinsType.wheelMoney,
            onClose: () {
              _nextSpin();
            },
          );
          twLooog("======whenComplete:whenComplete");
        }
      });
  }

  _nextSpin() {
    if (mounted) {
      setState(() {
        generatedCoins();
      });
      MainSpinController.to.resetWinbigCount();
    }
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

              if (TwPackageABC143.isPackageB()) centerBtnWinbig(),
            ],
          ),
        ),
        SizedBox(height: 12.h),
        btnDrawNow(),
      ],
    );
  }

  Widget btnDrawNow() {
    return Obx(() {
      int count = MainSpinController.to.curTwSpinNum.value;
      if (count <= 0) {
        count = 0;
      }
      return Center(
        child: GestureDetector(
          onTap: onDraw,
          child: Container(
            width: 260.h,
            height: 56.h,
            color: Colors.black.withValues(alpha: 0.0),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                canClick
                    ? TwShiningEffect(
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
                      )
                    : ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          Colors.grey,
                          BlendMode.modulate,
                        ),
                        child: Image.asset(
                          Assets.twimg.btnSpin.path,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.fill,
                        ),
                      ),
                if (canClick)
                  Positioned(
                    bottom: -30.h,
                    right: -30.h,
                    child: IgnorePointer(
                      // child: TwAScale(
                      //   child: Image.asset(
                      //     Assets.twimg.gesture.path,
                      //     width: 70.w,
                      //     height: 70.w,
                      //   ),
                      // ),
                      child: TwLottieGesture(),
                    ),
                  ),
                Center(
                  child: TwTxtBorderC143(
                    text: "Draw Now",
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w900,
                    fontColor: Color(0xffffffff),
                    foreground: Color(0xff22431B),
                  ),
                ),

                // Positioned(
                //   top: -10.h,
                //   left: -5.h,
                //   child: Image.asset(
                //     Assets.twimg.ad.path,
                //     width: 28.h,
                //     height: 28.h,
                //   ),
                // ),
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
                      "$count Change Left",
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
    });
  }

  Widget centerBtnWinbig() {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 80.h,
      child: Center(
        child: GestureDetector(
          onTap: _onWinbig,
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
                      "${MainSpinController.to.curWinbigCount.value}/3",
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
  _indexItemA({required int index}) {
    String icon = Assets.twimg.wheelCoin.path;
    Widget txt = const SizedBox();

    bool showGrey = false;
    if (true) {
      icon = TwPackageABC143.isPackageB()
          ? MainTreeController.to.moneyIconTreeChild()
          : Assets.twimg.wheelCoin.path;
      bool showSun = MainTreeController.to.showMoneyStatusSunIcon();
      bool showFlower = MainTreeController.to.showMoneyStatusFlowerIcon();
      int fraction = TwPackageABC143.isPackageB() ? 2 : 0;
      if (showFlower || showSun) {
        fraction = 0;
      }

      showGrey = _cutdownCashIndex.contains(index);
      txt = Center(
        child: TwAnimatedCountttt(
          value: tmpCoins[index],
          fractionDigits: fraction,
          textStyle: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: TwPackageABC143.isPackageB() ? 16.sp : 20.sp,
          ),
          textGradient: LinearGradient(
            colors: [Color(0xffFFDF12), Color(0xffFFAA00)],
            end: Alignment.bottomCenter,
            begin: Alignment.topCenter,
          ),
          strokeColor: Color(0xff42362b),
          strokeWidth: 1.w,
        ),
      );
    }

    Widget child = Container(
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
                    border: Border.all(
                      color: Colors.red.withValues(alpha: 0.5),
                      width: 2.w,
                    ),
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
    if (showGrey) {
      return ColorFiltered(
        colorFilter: ColorFilter.mode(Colors.grey, BlendMode.modulate),
        child: child,
      );
    }
    return child;
  }
  _indexItemB({required int index}) {
    if(!TwPackageABC143.isPackageB()){
      return _indexItemA(index: index);
    }


    String icon = Assets.twimg.wheelCoin.path;
    Widget txt = const SizedBox();
    String type = tmpMoneys[index].item1.toUpperCase();
    bool showGrey = false;
    if (type == TwEnumWheelType.cash.nnname || !TwPackageABC143.isPackageB()) {
      icon = TwPackageABC143.isPackageB()
          ? MainTreeController.to.moneyIconTreeChild()
          : Assets.twimg.wheelCoin.path;
      bool showSun = MainTreeController.to.showMoneyStatusSunIcon();
      bool showFlower = MainTreeController.to.showMoneyStatusFlowerIcon();
      int fraction = TwPackageABC143.isPackageB() ? 2 : 0;
      if (showFlower || showSun) {
        fraction = 0;
      }

      showGrey = _cutdownCashIndex.contains(index);
      txt = Center(
        child: TwAnimatedCountttt(
          value: tmpCoins[index],
          fractionDigits: fraction,
          textStyle: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: TwPackageABC143.isPackageB() ? 16.sp : 20.sp,
          ),
          textGradient: LinearGradient(
            colors: [Color(0xffFFDF12), Color(0xffFFAA00)],
            end: Alignment.bottomCenter,
            begin: Alignment.topCenter,
          ),
          strokeColor: Color(0xff42362b),
          strokeWidth: 1.w,
        ),
      );
    } else if (type == TwEnumWheelType.phone.nnname) {
      icon = Assets.twimgB.wheelPhone.path;
      txt = Positioned(
        left: -10.w,
        right: -10.w,
        bottom: 0,
        top: 0,
        child: Center(
          child: TwTxtGraBorderC143(
            text: "",
            fontWeight: FontWeight.w700,
            fontSize: 20.sp,
            strokeColor: Color(0xffBD5500),
          ),
        ),
      );
    } else if (type == TwEnumWheelType.cash_rain.nnname) {
      icon = Assets.twimgB.moneyRain.path;
      txt = Positioned(
        left: -10.w,
        right: -10.w,
        bottom: 0,
        top: 0,
        child: Center(
          child: TwTxtGraBorderC143(
            text: "",
            fontWeight: FontWeight.w700,
            fontSize: 20.sp,
            strokeColor: Color(0xffBD5500),
          ),
        ),
      );
    } else if (type == TwEnumWheelType.x2.nnname) {
      icon = Assets.twimg.wheelDoubleex.path;
      // icon = Assets.twimg.wheelCoin.path;
      txt = Positioned(
        left: -10.w,
        right: -10.w,
        bottom: 0,
        child: Center(
          child: TwTxtGraBorderC143(
            text: "Double\nEarning",
            fontWeight: FontWeight.w700,
            fontSize: 10.sp,
            strokeColor: Color(0xff42362b),
          ),
        ),
      );
    } else if (type == TwEnumWheelType.cash_out.nnname) {
      icon = Assets.twimgB.moneyFloating.path;
      // icon = Assets.twimg.wheelCoin.path;
      txt = Positioned(
        left: -10.w,
        right: -10.w,
        bottom: 0,
        top: 0,
        child: Center(
          child: TwTxtGraBorderC143(
            text: "1000",
            fontWeight: FontWeight.w700,
            fontSize: 16.sp,
            strokeColor: Color(0xff42362b),
          ),
        ),
      );
    }

    Widget child = Container(
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
                    border: Border.all(
                      color: Colors.red.withValues(alpha: 0.5),
                      width: 2.w,
                    ),
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
    if (showGrey) {
      return ColorFiltered(
        colorFilter: ColorFilter.mode(Colors.grey, BlendMode.modulate),
        child: child,
      );
    }
    return child;
  }

  index0() {
    double left = _imgWidth / 2 - _imgItemWidth / 2;
    double top = 10.h;
    return Positioned(left: left, top: top, child: _indexItemB(index: 0));
  }

  index6() {
    double left = _imgWidth / 2 - _imgItemWidth / 2;
    double top = 268.h;
    return Positioned(left: left, top: top, child: _indexItemB(index: 6));
  }

  index1() {
    double left = _imgWidth / 2 - _imgItemWidth / 2 + 70.h;
    double top = 30.h;
    return Positioned(left: left, top: top, child: _indexItemB(index: 1));
  }

  index11() {
    double left = 74.h;
    double top = 30.h;
    return Positioned(left: left, top: top, child: _indexItemB(index: 11));
  }

  index2() {
    double left = _imgWidth / 2 - _imgItemWidth / 2 + 120.h;
    double top = 80.h;
    return Positioned(left: left, top: top, child: _indexItemB(index: 2));
  }

  index10() {
    double left = 25.h;
    double top = 80.h;
    return Positioned(left: left, top: top, child: _indexItemB(index: 10));
  }

  index3() {
    double left = _imgWidth / 2 - _imgItemWidth / 2 + 130.h;
    double top = 145.h;
    return Positioned(left: left, top: top, child: _indexItemB(index: 3));
  }

  index9() {
    double left = 8.h;
    double top = 148.h;
    return Positioned(left: left, top: top, child: _indexItemB(index: 9));
  }

  index4() {
    double left = _imgWidth / 2 - _imgItemWidth / 2 + 115.h;
    double top = 210.h;
    return Positioned(left: left, top: top, child: _indexItemB(index: 4));
  }

  index8() {
    double left = 28.h;
    double top = 210.h;
    return Positioned(left: left, top: top, child: _indexItemB(index: 8));
  }

  index5() {
    double left = _imgWidth / 2 - _imgItemWidth / 2 + 64.h;
    double top = 250.h;
    return Positioned(left: left, top: top, child: _indexItemB(index: 5));
  }

  index7() {
    double left = 74.h;
    double top = 250.h;
    return Positioned(left: left, top: top, child: _indexItemB(index: 7));
  }

  bool canClick = true;

  void onDraw() {
    if(TwPackageABC143.isPackageB()){
      onDrawB();
      return;
    }
    twLooog("=======onWinbig canClick:$canClick");
    if (!canClick) {
      return;
    }

    int curSpinNum = MainSpinController.to.curTwSpinNum.value;
    if (curSpinNum <= 0) {
      twToast(text: "You can earn spins by answering questions.");
      MainController.to.resetIndex(MainController.quizIndex);
      return;
    }
    canClick = false;
    MainSpinController.to.subSpinNum();

    if (_selectIndex <= 0) {
      _startIndex = 0;
    }

    double random = Random().nextDouble();
    int targeIndex = Random().nextInt(12);
    bool hasMoneyRain = false;
    int length = 12;
    targeIndex = Random().nextInt(length);
    twLooog("=====random:$random=targeIndex:$targeIndex");

    startSpin(
      startIndex: _startIndex,
      targetIndex: targeIndex,
      hasMoneyRain: hasMoneyRain,
    );
  }

  void onDrawB() {
    twLooog("=======onWinbig canClick:$canClick");
    if (!canClick) {
      return;
    }

    int curSpinNum = MainSpinController.to.curTwSpinNum.value;
    if (curSpinNum <= 0) {
      twToast(text: "You can earn spins by answering questions.");
      MainController.to.resetIndex(MainController.quizIndex);
      return;
    }
    canClick = false;
    MainSpinController.to.subSpinNum();

    if (_selectIndex <= 0) {
      _startIndex = 0;
    }

    double random = Random().nextDouble();
    int targeIndex = Random().nextInt(12);
    bool hasMoneyRain = false;
    String type = "cash";
    // cash
    if (random > 0.5) {
      List<int> _tmpCashIndex = [];
      _cashIndex.forEach((index) {
        bool hasCccc = _cutdownCashIndex.contains(index);
        if (!hasCccc) {
          _tmpCashIndex.add(index);
        }
      });
      int length = _tmpCashIndex.length;
      targeIndex = _tmpCashIndex[Random().nextInt(length)];
    }
    // cash rain
    else if (random > 0.0) {
      type = "cash_rain";
      int length = _cashRainIndex.length;
      targeIndex = _cashRainIndex[Random().nextInt(length)];
      hasMoneyRain = true;
    }
    // x2
    else if (random >= 0) {
      int length = _x2Index.length;
      targeIndex = _x2Index[Random().nextInt(length)];
    }
    twLooog("=====random:$random=targeIndex:$targeIndex");
    TwMaiDiannnn.spin_click();
    TwMaiDiannnn.spin_result(type);
    audioBtn_spin.play();
    startSpin(
      startIndex: _startIndex,
      targetIndex: targeIndex,
      hasMoneyRain: hasMoneyRain,
    );
  }
  bool canClickWinbig = true;
  _onWinbig() async {
    if(!canClickWinbig){
      return;
    }



    canClickWinbig = false;
    TwMaiDiannnn.spin_ad_boost();
    bool result = MainSpinController.to.hasClickWinBigFirst();
    // result = false;
    if (!result) {
      OverlayWinReward().show(
        coins: 0,
        onBtn: () async{
          bool adresult = await TwCommonAds().showRewardAd(adPosId: TwAdsPosId.cuvxv_increaseprob_rv);
          if (!adresult) {
            return;
          }
          __onWinbigg();
        },
        onClose: () {

        },
      );
      return;
    }
    bool adresult = await TwCommonAds().showRewardAd(adPosId: TwAdsPosId.cuvxv_increaseprob_rv);
    if (!adresult) {
      return;
    }
    __onWinbigg();
  }

  __onWinbigg() {
    int curNum = MainSpinController.to.curWinbigCount.value;
    canClickWinbig = true;
    if (curNum > 0) {
      if (mounted) {
        setState(() {
          MainSpinController.to.subWinbigCount();
          int length = _cutdownCashIndex.length;

          _cutdownCashIndex.add(_cashSmall2BigIndex[length]);
          twLooog("=_cashIndex:$_cashIndex=====");
          twLooog("=_cutdownCashIndex:$_cutdownCashIndex=====");
          twLooog("=_cashSmall2BigIndex:$_cashSmall2BigIndex=====");
        });
      }
    }
  }
}

enum TwEnumWheelType {
  cash("CASH"),
  x2("2X"),
  cash_rain("CASH_RAIN"),
  phone("PHONE"),
  cash_out("CASH_OUT");

  final String nnname;

  const TwEnumWheelType(this.nnname);
}
