import 'dart:async';

import 'package:c143/gen/assets.gen.dart';
import 'package:c143/tw_143/tw_common/event.dart';
import 'package:c143/tw_143/tw_pages/main_quiz/main_quiz_controller.dart';
import 'package:c143/tw_base/tw_ad/guiyin/package.dart';
import 'package:c143/tw_base/tw_gj/event_bus.dart';
import 'package:c143/tw_base/tw_gj/loggggg.dart';
import 'package:c143/tw_hive/twhive.dart';
import 'package:c143/tw_views/animated_scale.dart';
import 'package:c143/tw_views/font_border.dart';
import 'package:c143/tw_views/pb_tushi.dart';
import 'package:c143/tw_views/rotate.dart';
import 'package:c143/tw_views/shake.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';

enum EnumQuizgiftTypppppe { coinyu, wheel }

class TwQuizGiftWidget extends StatefulWidget {
  const TwQuizGiftWidget({super.key});

  @override
  State<TwQuizGiftWidget> createState() => _TwQuizGiftWidgetState();

  static const int chaNumber = 3;
}

class _TwQuizGiftWidgetState extends State<TwQuizGiftWidget>
    with TwEventBusMix {



  List<int> curDataaaa = [firstRightCount];

  // 当前答对多少题
  int curAnswerRightCount = 0;

  // 多少题显示宝箱
  static const int jumpCount = TwQuizGiftWidget.chaNumber;
  static const int firstRightCount = 3;

  final twBox = TwHive.box;

  String keyIndexGift__(int weizhi) {
    return "sf9ewgrgfsd$weizhi";
  }

  String keyLastIndexClick__() {
    return "tyiu42423gsghf";
  }

  bool hasFloatBox(int index) {
    bool open = false;
    var data = twBox.get(keyIndexGift__(index)) ?? {};
    open = data['floatBox'] ?? false;

    return open;
  }

  bool hasIndexOpen(int weizhi) {
    bool sdfgdsfg = false;
    var data = twBox.get(keyIndexGift__(weizhi)) ?? {};
    sdfgdsfg = data['hasOpen'] ?? false;

    return sdfgdsfg;
  }

  setIndexJsonDataaaa({
    required int index,
    required bool hasOpen,
    required double money,
    bool floatBox = false,
  }) {
    twBox.put(keyIndexGift__(index), {
      "hasOpen": hasOpen,
      "money": money,
      "floatBox": floatBox,
    });

    twBox.put(keyLastIndexClick__(), index);
  }
  late ScrollController _giftPrgresssScroller;
  late ScrollController _giftForegroundScroller;
  late LinkedScrollControllerGroup _collectScroller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _collectScroller = LinkedScrollControllerGroup();
    _giftPrgresssScroller = _collectScroller.addAndGet();
    _giftForegroundScroller = _collectScroller.addAndGet();

    initJump();
    initBaseDataaaaa();

    register<QuizGifttttEvent>(_onGiftEvent);
  }


  initJump(){
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      int index = (_quizRightCount / jumpCount).toInt();
      index = index - 1;
      if (index <= 0) {
        index = 0;
      }
      Future.delayed(Duration(milliseconds: 1200), () {
        scrollerIndex(index);
      });
    });
  }

  _onGiftEvent(QuizGifttttEvent event) {
    EnumQuizGfittt type = event.type;
    twLooog("====EnumLiwuEvent=type:$type=");
    if (type == EnumQuizGfittt.index2) {
      // _onBox(
      //   liwu: EnumQuizgiftTypppppe.coinyu,
      //   canClick: true,
      //   index: 0,
      //   hasGuide: true,
      // );
    } else if (type == EnumQuizGfittt.index8) {
      // _onBox(
      //   liwu: EnumQuizgiftTypppppe.wheel,
      //   canClick: true,
      //   index: 2,
      //   hasGuide: true,
      // );
    } else if (type == EnumQuizGfittt.scroll) {
      int index = (_quizRightCount / jumpCount).toInt();
      index = index - 2;
      if (index <= 0) {
        index = 0;
      }
      scrollerIndex(index, scrollTime: 520);
    }
  }

  // answer num

  int get _quizRightCount{
    int number = MainQuizController.to.curRightNum.value;
    number = 26;
    return number;
  }

  bool showCase = false;

  void initBaseDataaaaa() {
    List<int> tmpData = [];
    int startValue = 0;
    if (curDataaaa.isNotEmpty) {
      startValue = curDataaaa.last;
    }
    for (int i = 0; i < 100; i++) {
      int a = startValue + (i + 1) * 3;
      tmpData.add(a);
    }
    curDataaaa.addAll(tmpData);
  }

  scrollerIndex(int indexxxxx, {int scrollTime = 2000}) async {
    double width = indexxxxx * _itemWidth;
    int time = scrollTime ;
    if (indexxxxx > 0) {
      width = width + 7.w;
      if (indexxxxx == 2) {
        time = 1000;
      }
    }

    await _collectScroller.animateTo(
      width,
      duration: Duration(milliseconds: time),
      curve: Curves.linear,
    );
  }

  double _itemWidth = 0;
  bool clickGift = false;

  int curDataMaxIndex() {
    int curAnswerCount = _quizRightCount;
    int tmpCurIndex = 0;
    int index0 = firstRightCount;
    if (curAnswerCount <= index0) {
      tmpCurIndex = 0;
    } else {
      int tmpChaaaa = TwQuizGiftWidget.chaNumber;
      int startIndex = curAnswerCount - index0;

      tmpCurIndex = startIndex ~/ tmpChaaaa;
      tmpCurIndex = tmpCurIndex;
    }

    return tmpCurIndex;
  }

  double giftHeight = 70.h;

  @override
  Widget build(BuildContext context) {
    giftHeight = 70.h;
    return Obx(() {
      double allWidth = 330.w;
      double itemWidth = (allWidth - 32.w) / 4;
      _itemWidth = itemWidth;
      List<Widget> progressWidgets = [];
      List<Widget> giftWidgets = [];
      curAnswerRightCount = _quizRightCount;
      int curIndex = curDataMaxIndex();
      for (int i = 0; i < curDataaaa.length; i++) {
        bool isFirsttt = false;
        bool isLasttt = false;

        double tmpProgress = 0;
        if (i == 0) {
          isFirsttt = true;
        } else if ((i + 1) == curDataaaa.length) {
          isLasttt = true;
        }

        int count = curDataaaa[i];
        EnumQuizgiftTypppppe category = EnumQuizgiftTypppppe.coinyu;
        int tmpCategory = (count - firstRightCount) % 6;
        // jcRizhi("=====tmpCategory:$tmpCategory count:$count");
        if (tmpCategory == 0) {
          category = EnumQuizgiftTypppppe.wheel;
        } else {
          category = EnumQuizgiftTypppppe.coinyu;
        }
        twLooog("=====tmpCategory:$tmpCategory count:$count");
        // 0 3 6  9 12 15 18 21 24
        // 2 5 8 11 14 17 20 23 26

        bool hasLastOpened = false;
        if (curAnswerRightCount >= count) {
          tmpProgress = 1;
          hasLastOpened = curIndex == i;
        } else {
          int next = count - curAnswerRightCount;
          if (next >= jumpCount || curAnswerRightCount == 0) {
            tmpProgress = 0;
          } else {
            // hasLast = true;
            tmpProgress = 1 - next / jumpCount - 0.2;
          }
        }

        Widget progress = giftProgressWidget(
          width: itemWidth,
          isFirsttttt: isFirsttt,
          isLassssst: isLasttt,
          progress: tmpProgress,
        );

        Widget gift = giftForegroundWidget(
          width: itemWidth,
          giftTypeeee: category,
          hasLastOpened: hasLastOpened,
          count: count,
          index: i,
        );

        progressWidgets.add(progress);
        giftWidgets.add(gift);
      }
      return Container(
        width: double.infinity,
        height: giftHeight,
        color: Colors.green.withValues(alpha: 0.0),
        child: Stack(
          children: [
            // Positioned(
            //   top: 0.h,
            //   right: 20.w,
            //   left: 20.w,
            //   bottom: 0.h,
            //   // child: Image.asset(
            //   //   Assets.ttt.quizLevelBg.path,
            //   //   width: double.infinity,
            //   //   height: double.infinity,
            //   //   fit: BoxFit.fill,
            //   // ),
            //   child: Container(
            //     width: double.infinity,
            //     height: double.infinity,
            //     color: Colors.blue,
            //   ),
            // ),
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              bottom: 0.h,
              child: Center(
                child: SizedBox(
                  width: allWidth,
                  child: Stack(
                    clipBehavior: Clip.hardEdge,
                    children: [
                      ListView(
                        scrollDirection: Axis.horizontal,
                        controller: _giftPrgresssScroller,
                        // clipBehavior: Clip.none,
                        // padding: EdgeInsets.only(top: 0.h, bottom: 0.h),
                        children: [...progressWidgets],
                      ),
                      ListView(
                        scrollDirection: Axis.horizontal,
                        controller: _giftForegroundScroller,
                        // clipBehavior: Clip.none,
                        children: [...giftWidgets],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  giftProgressWidget({
    required double width,
    bool isFirsttttt = false,
    bool isLassssst = false,
    required double progress,
  }) {
    double tmpProgress = progress;
    double height = double.infinity;
    double outHeight = 15.h;
    double innerHeight = 10.h;
    double borderRadius = innerHeight;
    double leftDistancccce = (outHeight - innerHeight) / 2;
    double top = 30.h;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: width,
          height: height,
          // decoration: BoxDecoration(color: Colors.black),
        ),
        Positioned(
          top: top,
          child: Container(
            width: width,
            height: outHeight,
            padding: EdgeInsets.only(
              left: isFirsttttt ? leftDistancccce : 0,
              right: isLassssst ? leftDistancccce : 0,
            ),
            decoration: BoxDecoration(
              color: Color(0xff883D13),
              borderRadius: isLassssst
                  ? BorderRadius.only(
                      topRight: Radius.circular(borderRadius),
                      bottomRight: Radius.circular(borderRadius),
                    )
                  : (isFirsttttt
                        ? BorderRadius.only(
                            topLeft: Radius.circular(borderRadius),
                            bottomLeft: Radius.circular(borderRadius),
                          )
                        : BorderRadius.zero),
            ),
            child: Row(
              children: [
                Flexible(
                  child: Container(
                    width: width * tmpProgress,
                    height: innerHeight,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xffA0FFa6), Color(0xff00CA1a)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: isLassssst
                          ? BorderRadius.only(
                              topRight: Radius.circular(borderRadius),
                              bottomRight: Radius.circular(borderRadius),
                            )
                          : (isFirsttttt
                                ? BorderRadius.only(
                                    topLeft: Radius.circular(borderRadius),
                                    bottomLeft: Radius.circular(borderRadius),
                                  )
                                : BorderRadius.zero),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // giftCategory: 1 转盘，2 金蛋，3 可以打开的

  double maxBoxValue() {
    return 0;
    // double v = ShuzhiShuju.box_prize_max();
    // return v;
  }

  giftForegroundWidget({
    required double width,
    bool hasLastOpened = false, // 是否是进度条已经打开的最后一个
    required EnumQuizgiftTypppppe giftTypeeee,
    required int count,
    required int index,
  }) {
    // 是否已经打开
    bool hasOpened = hasIndexOpen(index);
    bool floatBox = hasFloatBox(index);
    double height = giftHeight;
    String bottomText = "${index + 1}";
    bottomText = "$count";
    Widget answerCountItem = TwTxtBorder(
      text: bottomText,
      fontWeight: FontWeight.w700,
      fontSize: 12.sp,
    );
    bool hasCurLastIndex = index == curDataMaxIndex();
    // jcRizhi("==giftCategory:$liwuType=count:$count=index:$index=${curMaxIndex()}",);
    bool heziLeixing = giftTypeeee == EnumQuizgiftTypppppe.coinyu;
    String icon = heziLeixing
        ? Assets.twimg.quizCoinYuUn.path
        : Assets.twimg.quizSpinUn.path;
    // 能否打开
    bool canOpen = curAnswerRightCount >= count;
    hasOpened = !TwPackageAB.isPackageB();
    if (canOpen && hasOpened) {
      icon = heziLeixing
          ? Assets.twimg.quizCoinYu.path
          : Assets.twimg.quizSpin.path;
    }


    Widget gift = Image.asset(icon, width: 37.h, height: 37.h);
    Widget tmpImage = Stack(
      clipBehavior: Clip.none,
      children: [
        if (canOpen && !hasOpened)
          Positioned(
            right: -10.w,
            top: -10.h,
            child: TwRotateWidggggg(
              // child: Image.asset(
              //   Assets.bbb.quizXuanguang.path,
              //   width: 60.w,
              //   height: 60.h,
              // ),
              child: Container(width: 60.h, height: 60.h, color: Colors.blue.withValues(alpha: 0)),
            ),
          ),
        gift,

        Positioned(
          bottom: -14.h,
          right: 0,
          left: 0,
          child: Center(child: answerCountItem),
        ),
      ],
    );
    // if (count == 2 || count == 8) {
    //   tmpImage = Builder(
    //     builder: (context) {
    //       Widget child = Stack(
    //         clipBehavior: Clip.none,
    //         children: [
    //           if (canOpen && !hasOpened)
    //             Positioned(
    //               right: -10.w,
    //               top: -10.h,
    //               // child: TwRotateWidggggg(
    //               //   child: Image.asset(
    //               //     Assets.bbb.quizXuanguang.path,
    //               //     width: 60.w,
    //               //     height: 60.h,
    //               //   ),
    //               // ),
    //               child: Container(
    //                 width: 60.h,
    //                 height: 60.h,
    //                 color: Colors.blue,
    //               ),
    //             ),
    //           gift,
    //         ],
    //       );
    //       Widget child2 = Stack(
    //         clipBehavior: Clip.none,
    //         children: [
    //           child,
    //           Positioned(
    //             bottom: -14.h,
    //             right: 0,
    //             left: 0,
    //             child: Center(child: answerCountItem),
    //           ),
    //         ],
    //       );
    //       // if (count == 2) {
    //       //   GuideRight2.guideChild = child;
    //       //   GuideRight2.guideContext = context;
    //       // } else if (count == 8) {
    //       //   GuideRight8.guideChild = child;
    //       //   GuideRight8.guideContext = context;
    //       // }
    //
    //       // if(!DtController.to.hasGuideRight2()){
    //       //   GuideRight2.guideChild = child;
    //       //   GuideRight2.guideContext = context;
    //       // }else{
    //       //   GuideRight8.guideChild = child;
    //       //   GuideRight8.guideContext = context;
    //       // }
    //
    //       return child2;
    //     },
    //   );
    // }
    Widget gesture = IgnorePointer(
      child: TwAScale(
        child: Image.asset(
          Assets.twimg.gesture.path,
          width: 40.w,
          height: 40.w,
        ),
      ),
    );
    // ggPrint("==_GiftProgressState=count:$count===index:$index=canOpen:$canOpen===hasLastOpened:$hasLastOpened=clickGift:$clickGift=hasOpened:$hasOpened");
    return Center(
      child: GestureDetector(
        onTap: () {
          _onBox(canClick: canOpen, index: index, liwu: giftTypeeee);
        },
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              // color: index % 2 == 0
              //     ? Colors.red.withValues(alpha: 0.4)
              //     : Colors.green.withValues(alpha: 0.4),
              width: width,
              height: height,
              // decoration: BoxDecoration(color: Colors.red.withValues(alpha: 0.0)),
            ),

            Positioned(
              top: 18.h,
              right: -2.w,
              child: hasCurLastIndex && canOpen && !hasOpened
                  ? TwShakeWidget(
                      mode: ShakeMode.rotate,
                      offset: 8,
                      child: tmpImage,
                    )
                  : tmpImage,
            ),
            // if (canOpen && !clickGift && !hasOpened)
            //   Positioned(bottom: 0.h, right: -20.w, child: gesture),

            // if (canOpen && !hasOpened && heziLeixing)
            //   Positioned(
            //     right: -18.w,
            //     top: -5.h,
            //     child: Container(
            //       width: 68.w,
            //       height: 28.h,
            //       child: Container(
            //         width: 68.w,
            //         height: 28.h,
            //         color: Colors.green,
            //         // child: Stack(
            //         //   children: [
            //         //     Image.asset(
            //         //       Assets.bbb.quizGiftBoxTips.path,
            //         //       width: double.infinity,
            //         //       height: double.infinity,
            //         //       fit: BoxFit.fill,
            //         //     ),
            //         //     Positioned(
            //         //       left: 0,
            //         //       right: 0,
            //         //       top: 0,
            //         //       bottom: 6.h,
            //         //       child: Container(
            //         //         color: Colors.red.withValues(alpha: 0.0),
            //         //         child: Center(
            //         //           child: Text(
            //         //             "Max \$${maxBoxValue().toStringAsFixed(0)}",
            //         //             style: TextStyle(
            //         //               fontWeight: FontWeight.w700,
            //         //               fontSize: 12.sp,
            //         //               color: Color(0xffA63617),
            //         //               height: 1,
            //         //             ),
            //         //           ),
            //         //         ),
            //         //       ),
            //         //     ),
            //         //   ],
            //         // ),
            //       ),
            //     ),
            //   ),
            if (hasOpened)
              Positioned(
                top: 22.h,
                right: -8.w,
                // child: Image.asset(
                //   Assets.bbb.quizGiftOpen.path,
                //   width: 15.h,
                //   height: 15.h,
                // ),
                child: Container(width: 15.h, height: 15.h, color: Colors.blue.withValues(alpha: 0)),
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

    _giftPrgresssScroller.dispose();
    _giftForegroundScroller.dispose();
  }

  // giftCategory: 1 可以打开的，2 广告，3 普通礼物
  _onBox({
    required EnumQuizgiftTypppppe liwu,
    required bool canClick,
    required int index,
    bool hasGuide = false,
  }) {
    twLooog(
      "===canClick:$canClick==index:$index curAnswerCount:$curAnswerRightCount",
    );
    bool sfDakai = hasIndexOpen(index);
    // sfDakai = false;
    // canClick = true;

    if (sfDakai) {
      String text = "Today’s treasure chest reward has been collected";
      if (liwu == EnumQuizgiftTypppppe.wheel) {
        text = "The wheel reward has been received";
      }
      twToast(text: text);
      return;
    }

    if (canClick) {
      setIndexJsonDataaaa(index: index, hasOpen: true, money: 0);
      if (liwu == EnumQuizgiftTypppppe.wheel) {
      } else {}

      setState(() {});
    }
  }

  // giftC
}
