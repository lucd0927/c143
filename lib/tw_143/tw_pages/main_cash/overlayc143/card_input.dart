import 'dart:async';

import 'package:c143/gen/assets.gen.dart';
import 'package:c143/tw_143/tw_pages/main/main_controller.dart';
import 'package:c143/tw_143/tw_pages/main_cash/main_cash_controller.dart';
import 'package:c143/tw_143/tw_pages/main_cash/overlayc143/overlay_tx_step.dart';
import 'package:c143/tw_base/tw_gj/logC143.dart';
import 'package:c143/tw_views/pb_tushi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OverlayWithdrawCardInfoC143 {
  ///是否真正显示

  OverlayEntry? _overlay;

  void show({
    bool showNext = true,
}) {
    // if (_isShowing) return;
    _overlay = null;
    _overlay = OverlayEntry(
      builder: (context) {
        return WithdrawCardInfoC143Widget(
          onClose: () {
            close();
          },
          onBtn: () {
            close();
            // twToast(text: "")
            if(showNext){
              OverlayTxStep().show(coins: 10, onBtn: (va) {});
            }

          },
        );
      },
    );
    Overlay.of(Get.context!).insert(_overlay!);
  }

  void close() {
    _overlay?.remove();
    _overlay = null;
  }
}

class WithdrawCardInfoC143Widget extends StatefulWidget {
  const WithdrawCardInfoC143Widget({
    super.key,
    required this.onClose,
    required this.onBtn,
  });

  final VoidCallback onClose;
  final VoidCallback onBtn;

  @override
  State<WithdrawCardInfoC143Widget> createState() =>
      _WithdrawCardInfoC143WidgetState();
}

class _WithdrawCardInfoC143WidgetState extends State<WithdrawCardInfoC143Widget>
    with WidgetsBindingObserver {
  bool showAnimatedC143 = false;
  Duration animDC143 = Duration(milliseconds: 250);
  Timer? _timerC143;

  final FocusNode focusNodeC143 = FocusNode();
  final TextEditingController textEditingControllerC143 =
      TextEditingController();
  late VoidCallback focusListenerC143;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          showAnimatedC143 = true;
        });
      }

      Future.delayed(Duration(milliseconds: 300), () {
        if (mounted) {
          focusNodeC143.requestFocus();
        }
      });
    });
    focusListenerC143 = () {
      _listenerC143();
    };

    focusNodeC143.addListener(focusListenerC143);
  }

  double topHeightC143 = 0.h;
  String _inputCarddddd = "";

  TwEnumPayType _enumPayType = TwEnumPayType.paypal;

  _listenerC143() {
    twLooog("==focusListeners:${focusNodeC143.hasFocus}==");
    if (mounted) {
      setState(() {
        if (focusNodeC143.hasFocus) {
          topHeightC143 = 140.h;
        } else {
          topHeightC143 = 0.h;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: _onTapppp,
        child: AnimatedContainer(
          duration: animDC143,
          color: Colors.black.withValues(alpha: showAnimatedC143 ? 0.8 : 0),
          child: Center(
            child: AnimatedScale(
              duration: animDC143,
              scale: showAnimatedC143 ? 1.0 : 0.8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 296.w,
                    height: 280.h,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 1.0),
                      borderRadius: BorderRadius.circular(12.h),
                    ),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 12.h),

                              Center(
                                child: Text(
                                  "Payment Information",
                                  style: TextStyle(
                                    color: Color(0xff000000),
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20.h),
                              tabTopItem(),
                              SizedBox(height: 20.h),
                              Padding(
                                padding: EdgeInsets.only(left: 16.w),
                                child: Text(
                                  "Account/Phone",
                                  style: TextStyle(
                                    color: Color(0xff000000),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              SizedBox(height: 8.h),
                              inputWidget(),

                              SizedBox(height: 5.h),
                              Padding(
                                padding: EdgeInsets.only(left: 16.w),
                                child: Text(
                                  "Direct to your paypal instant payment",
                                  style: TextStyle(
                                    color: Color(0xff686D73),
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),

                              Expanded(
                                child: Center(
                                  child: GestureDetector(
                                    onTap: onWithdrawwww,
                                    child: Container(
                                      width: 230.h,
                                      height: 42.h,
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color(0xff0056F1),
                                            Color(0xff009CDE),
                                          ],
                                        ),
                                        borderRadius: BorderRadius.circular(
                                          100,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Cash Out",
                                          style: TextStyle(
                                            color: Color(0xffffffff),
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Positioned(
                          right: 8.w,
                          top: 16.h,
                          child: GestureDetector(
                            onTap: onClose,
                            child: Icon(
                              Icons.close,
                              size: 24.w,
                              color: Color(0xe8000000),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 40.h),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 250),
                    height: topHeightC143,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapppp() {
    focusNodeC143.unfocus();
  }

  Container tabTopItem() {
    return Container(
      height: 44.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: _onTopItem,
            child: Container(
              width: 132.w,
              height: 44.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.w),
                color: _enumPayType == TwEnumPayType.paypal
                    ? Colors.white
                    : Color(0xffE8E8E8),
                border: Border.all(
                  color: Color(0xff009CDE).withValues(
                    alpha: _enumPayType == TwEnumPayType.paypal ? 1 : 0,
                  ),
                  width: 2.w,
                ),
              ),
              child: Center(
                child: Image.asset(Assets.twimgB.txPaypal.path, width: 100.w),
              ),
            ),
          ),

          GestureDetector(
            onTap: _onTopItem,
            child: Container(
              width: 132.w,
              height: 44.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.w),
                color: _enumPayType == TwEnumPayType.cashapp
                    ? Colors.white
                    : Color(0xffE8E8E8),
                border: Border.all(
                  color: Color(0xff009CDE).withValues(
                    alpha: _enumPayType == TwEnumPayType.cashapp ? 1 : 0,
                  ),
                  width: 2.w,
                ),
              ),
              child: Center(
                child: Image.asset(Assets.twimgB.txCashapp.path, width: 100.w),
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool containsEmail(String input) {
    final emailRegex = RegExp(
      r'[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}',
    );
    return emailRegex.hasMatch(input);
  }

  bool isDigitStringOfLength(String input, int length) {
    final regex = RegExp(r'^\d{' + length.toString() + r'}$');
    return regex.hasMatch(input);
  }

  bool isDigitsOnly(String s) => RegExp(r'^\d+$').hasMatch(s);

  void onWithdrawwww() {

    bool isEeee = containsEmail(_inputCarddddd);
    bool _isNnnnn = isDigitsOnly(_inputCarddddd);

    if (_inputCarddddd.isEmpty ) {
      twToast(text: "Please check your input.");
      return;
    }
    if(_enumPayType == TwEnumPayType.paypal){
      bool hasConnnn = isEeee || _isNnnnn;
      if(!hasConnnn){
        twToast(text: "Please check your input.");
        return;
      }
    }



    MainCashController.to.saveCardIdddd(_inputCarddddd);
    MainCashController.to.savePaytypeC143(_enumPayType);

    _timerC143?.cancel();
    twLooog("======Setting close");
    // setState(() {
    //   showAnimated = false;
    // });
    // await Future.delayed(animD);
    widget.onBtn();
  }

  inputWidget() {
    return Center(
      child: Container(
        width: 260.w,
        height: 40.h,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(
          color: Color(0xffEDF0F7),
          borderRadius: BorderRadius.circular(8.w),
          border: Border.all(color: Color(0xffEAEBEF), width: 1.w),
        ),
        child: Center(
          child: TextField(
            controller: textEditingControllerC143,
            focusNode: focusNodeC143,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xff000000),
            ),
            decoration: InputDecoration.collapsed(
              hintText: "E.G. 12345678 abc.com",
              hintStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xff6B7280),
              ),
            ),
            keyboardType: TextInputType.text,
            onChanged: (text) {
              twLooog("===input text:$text===");
              _inputCarddddd = text;
            },
          ),
        ),
      ),
    );
  }

  onClose() async {
    _timerC143?.cancel();
    twLooog("======Setting close");
    // setState(() {
    //   showAnimated = false;
    // });
    // await Future.delayed(animD);
    widget.onClose();
  }

  double _keyboardHeight = 0;

  @override
  void didChangeMetrics() {
    // 获取键盘高度
    final bottomInset = WidgetsBinding.instance.window.viewInsets.bottom;
    if (bottomInset > 0 && _keyboardHeight == 0) {
      print('🧭 键盘弹起');
      focusNodeC143.requestFocus();
    } else if (bottomInset == 0 && _keyboardHeight > 0) {
      print('🎯 键盘收起');
      focusNodeC143.unfocus();
    }
    _keyboardHeight = bottomInset;
    twLooog("===_keyboardHeight:$_keyboardHeight===");
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    focusNodeC143.removeListener(focusListenerC143);
    focusNodeC143.dispose();
    textEditingControllerC143.dispose();
    super.dispose();
  }

  void _onTopItem() {
    setState(() {
      if (_enumPayType == TwEnumPayType.paypal) {
        _enumPayType = TwEnumPayType.cashapp;
      } else {
        _enumPayType = TwEnumPayType.paypal;
      }
    });
  }
}
