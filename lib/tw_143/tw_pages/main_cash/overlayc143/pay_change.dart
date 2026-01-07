import 'dart:async';

import 'package:c143/gen/assets.gen.dart';
import 'package:c143/tw_143/tw_pages/main_cash/main_cash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CashTopChange extends StatefulWidget {
  const CashTopChange({super.key, required this.onClose});

  final VoidCallback onClose;

  @override
  State<CashTopChange> createState() => _CashTopChangeState();
}

class _CashTopChangeState extends State<CashTopChange> {
  bool showAnimated = false;
  Duration animD = Duration(milliseconds: 200);
  double startScale = 0.8;
  Timer? _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        showAnimated = true;
      });

      // _timer = Timer(Duration(milliseconds: 4000), () {
      //   onClose();
      // });
    });
  }

  onClose() async {
    _timer?.cancel();
    // if (mounted) {
    //   setState(() {
    //     showAnimated = false;
    //     startScale = 1.0;
    //   });
    // }
    //
    // await Future.delayed(animD);

    widget.onClose();
  }

  @override
  Widget build(BuildContext context) {
    double left = 0;
    if (left <= 0) {
      left = 0;
    }
    String curPay = MainCashController.to.curPayTypeC143.value;

    List<Widget> children = [];
    if (curPay == TwEnumPayType.paypal.nnnname) {
      children = [
        paypalwidget(),
        cashwidget(),
      ];
    } else {
      children = [
        cashwidget(),
        paypalwidget(),
      ];
    }

    return Stack(
      children: [
        Positioned(
          left: 16.w,
          top: 60.h,
          child: GestureDetector(
            onTap: onClose,
            child: Material(
              color: Colors.teal.withValues(alpha: 0.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.h),
                ),
                child: Column(children: [
                  children[0],
                  AnimatedContainer(
                    duration: animD,
                    width: 120.w,
                    height: showAnimated ? 36.h : 0,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    child:  children[1],
                  ),
                ]),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget paypalwidget() {
    return GestureDetector(
      onTap: () {
        _onChange(TwEnumPayType.paypal);
      },
      child: Container(
        width: 120.w,
        height: 36.h,
        color: Colors.transparent,
        child: Stack(
          children: [
            Center(
              child: Image.asset(
                Assets.twimgB.txPaypal.path,
                width: 96.w,
                height: 32.h,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cashwidget() {
    return GestureDetector(
      onTap: () {
        _onChange(TwEnumPayType.cashapp);
      },
      child: Container(
        width: 120.w,
        height: 36.h,

        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Center(
              child: Image.asset(
                Assets.twimgB.txCashapp.path,
                width: 96.w,
                height: 32.h,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onChange(TwEnumPayType type) {
    MainCashController.to.curPayTypeC143.value = type.nnnname;
    widget.onClose();
  }
}
