import 'dart:math';

import 'package:c143/gen/assets.gen.dart';
import 'package:c143/tw_143/tw_pages/main_tree/main_tree.dart';
import 'package:c143/tw_base/tw_gj/loggggg.dart';
import 'package:c143/tw_base/tw_gj/login_trackkkk.dart';
import 'package:c143/tw_base/tw_gj/number_extend.dart';
import 'package:c143/tw_hive/twhive.dart';
import 'package:c143/tw_views/font_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainRank extends StatefulWidget {
  const MainRank({super.key});

  @override
  State<MainRank> createState() => _MainRankState();
}

class _MainRankState extends State<MainRank> {
  List historyData = [];
  var box = TwHive.box;

  static const String twkeyHistoryData = "twkeyHistoryData";
  static const String twkeyHistoryDataAvatar = "hHistoryDataAvatar";

  int length = 40;

  randomNum() {
    final random = Random();
    final tmpNum = <int>{};

    // 保证不重复，直到取到 3 个数
    while (tmpNum.length < 3) {
      tmpNum.add(random.nextInt(22)); // 生成 0-21 的数字
    }
    return tmpNum.toList();
  }

  initData() {
    historyData = [];
    final tmpRandom = Random();

    // 生成 50 个 [0, 100] 内的随机 double
    List<double> numbers = List.generate(length, (_) {
      double tmp = (tmpRandom.nextDouble() * 12000) + 1000;

      return tmp.toAsFixedFloor(2);
    });

    // 排序，从大到小
    numbers.sort((a, b) => b.compareTo(a));

    final randInt = Random();

    // 生成 50 个 [0, 100] 内的随机整数
    List<int> numbersInt = List.generate(
      length,
      (_) => randInt.nextInt(99) + 1,
    );

    // 排序，从大到小
    numbersInt.sort((a, b) => b.compareTo(a));
    for (int i = 0; i < length; i++) {
      const zifuc = '0123456789abcdefghijklmnopqrstuvwxyz';
      final random = zifuc[Random().nextInt(zifuc.length)];
      final rand1 = zifuc[Random().nextInt(zifuc.length)];
      final rand2 = zifuc[Random().nextInt(zifuc.length)];
      final rand3 = zifuc[Random().nextInt(zifuc.length)];

      String userName = "$random$rand1****$rand2$rand3";
      historyData.add([userName, numbers[i], numbersInt[i], i]);
    }

    box.put(twkeyHistoryData, historyData);
    box.put(twkeyHistoryDataAvatar, randomNum());
  }

  List<Widget> children = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    historyData = box.get(twkeyHistoryData) ?? [];
    historyData = [];
    if (TwLoginnnTrackkkk.isFirstLoginToday || historyData.isEmpty) {
      initData();
    }

    for (int i = 3; i < length; i++) {
      int index = i;

      Widget item = _itemWidget(index);
      children.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    twLooog("=====");
    return ClipRect(
      child: Container(
        // clipBehavior: Clip.none,
        width: double.infinity,
        height: ScreenUtil().screenHeight - minPinnedHeight - 20.h,
        //
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  SizedBox(height: 22.h),

                  Expanded(
                    child: SingleChildScrollView(
                      physics: ClampingScrollPhysics(),
                      child: Container(
                        color: Color(0xff0E226C),
                        child: Column(
                          children: [
                            SizedBox(height: 20.h),
                            rankTopWidget(),

                            // _itemWidget(1),
                            SizedBox(height: 20.h),
                            ...children,
                            SizedBox(height: 90.h),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              top: 0.h,
              child: Image.asset(
                Assets.twimg.mainRankDes.path,
                width: double.infinity,
                height: 52.h,
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _itemWidget(int index) {
    int tmpRank = index + 1;
    List tmpHistoryData = historyData[index];
    String userName = tmpHistoryData[0]?.toString() ?? "";
    String earing = "Total earning:${tmpHistoryData[1].toStringAsFixed(0)}";
    String adCount = "Ads watched::${tmpHistoryData[2]}";
    return Center(
      child: Container(
        width: 336.w,
        height: 72.h,
        margin: EdgeInsets.only(bottom: 10.h),
        child: Stack(
          children: [
            Image.asset(
              Assets.twimg.mainRankBg.path,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),

            Positioned(
              left: 8.w,
              top: 26.h,
              child: Container(
                width: 20.w,
                height: 20.h,
                color: Colors.red.withValues(alpha: 0.0),
                child: Center(
                  child: TwTxtBorder(
                    text: "$tmpRank",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    foreground: Color(0xff7D502E),
                    fontColor: Color(0xffffffff),
                  ),
                ),
              ),
            ),

            Positioned(
              left: 40.w,
              child: Container(
                width: 280.w,
                height: 70.h,

                color: Colors.blue.withValues(alpha: 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      userName,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 14.sp,
                        color: Color(0xff372D22),
                      ),
                    ),
                    Text(
                      earing,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12.sp,
                        color: Color(0xff7D522B),
                      ),
                    ),
                    Text(
                      adCount,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 12.sp,
                        color: Color(0xff7D522B),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  rankTopWidget() {
    return Container(
      width: 344.w,
      height: 208.h,
      child: Stack(
        children: [
          Center(
            child: Image.asset(
              Assets.twimg.mainRankTop.path,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          rank2(),
          rank3(),
          rank1(),
          rankDes2(),
          rankDes1(),
          rankDes3(),
        ],
      ),
    );
  }

  Positioned rankDes3() {
    List tmpHistoryData = historyData[2];
    String userName = tmpHistoryData[0]?.toString() ?? "";
    String earing = "Total earning:${tmpHistoryData[1].toStringAsFixed(0)}";
    String adCount = "Ads watched::${tmpHistoryData[2]}";
    return Positioned(
      right: 20.w,
      top: 120.h,
      child: Container(
        width: 94.w,
        height: 80.h,
        color: Colors.amber.withValues(alpha: 0.0),
        child: Column(
          children: [
            TwTxtBorder(
              text: userName,
              foreground: Color(0xff15436F),
              fontColor: Color(0xffADDDF3),
              fontWeight: FontWeight.w700,
              fontSize: 14.sp,
            ),
            SizedBox(height: 20.h),
            Text(
              earing,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 8.sp,
                color: Color(0xff7D522B),
              ),
            ),
            Text(
              adCount,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 8.sp,
                color: Color(0xff7D522B),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Positioned rankDes1() {
    List tmpHistoryData = historyData[0];
    String userName = tmpHistoryData[0]?.toString() ?? "";
    String earing = "Total earning:${tmpHistoryData[1].toStringAsFixed(0)}";
    String adCount = "Ads watched::${tmpHistoryData[2]}";
    return Positioned(
      left: 115.w,
      top: 100.h,
      child: Container(
        width: 116.w,
        height: 90.h,
        color: Colors.amber.withValues(alpha: 0.0),
        child: Column(
          children: [
            TwTxtBorder(
              text: userName,
              foreground: Color(0xff15436F),
              fontColor: Color(0xffADDDF3),
              fontWeight: FontWeight.w700,
              fontSize: 14.sp,
            ),
            SizedBox(height: 30.h),
            Text(
              earing,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 8.sp,
                color: Color(0xff7D522B),
              ),
            ),
            Text(
              adCount,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 8.sp,
                color: Color(0xff7D522B),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Positioned rankDes2() {
    List tmpHistoryData = historyData[1];
    String userName = tmpHistoryData[0]?.toString() ?? "";
    String earing = "Total earning:${tmpHistoryData[1].toStringAsFixed(0)}";
    String adCount = "Ads watched::${tmpHistoryData[2]}";
    return Positioned(
      left: 20.w,
      top: 120.h,
      child: Container(
        width: 94.w,
        height: 80.h,
        color: Colors.amber.withValues(alpha: 0.0),
        child: Column(
          children: [
            TwTxtBorder(
              text: userName,
              foreground: Color(0xff15436F),
              fontColor: Color(0xffADDDF3),
              fontWeight: FontWeight.w700,
              fontSize: 14.sp,
            ),
            SizedBox(height: 20.h),
            Text(
              earing,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 8.sp,
                color: Color(0xff7D522B),
              ),
            ),
            Text(
              adCount,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 8.sp,
                color: Color(0xff7D522B),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Positioned rank1() {
    return Positioned(
      left: 148.w,
      top: 14.h,
      child: Image.asset(
        Assets.avatar.avatar3.path,
        width: 48.w,
        height: 48.h,
        fit: BoxFit.fill,
      ),
    );
  }

  Positioned rank3() {
    return Positioned(
      right: 44.w,
      top: 47.h,
      child: Image.asset(
        Assets.avatar.avatar2.path,
        width: 36.w,
        height: 36.h,
        fit: BoxFit.fill,
      ),
    );
  }

  Positioned rank2() {
    return Positioned(
      left: 45.w,
      top: 47.h,
      child: Image.asset(
        Assets.avatar.avatar1.path,
        width: 36.w,
        height: 36.h,
        fit: BoxFit.fill,
      ),
    );
  }
}
