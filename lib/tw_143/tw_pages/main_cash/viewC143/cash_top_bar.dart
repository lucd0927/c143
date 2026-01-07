import 'package:c143/gen/assets.gen.dart';
import 'package:c143/tw_143/tw_pages/main_cash/main_cash_controller.dart';
import 'package:c143/tw_base/tw_gj/logC143.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CashTopBar extends StatefulWidget {
  const CashTopBar({super.key});

  @override
  State<CashTopBar> createState() => _CashTopBarState();
}

class _CashTopBarState extends State<CashTopBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120.h,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xffC8DEFF), Color(0xffC9E5FF).withValues(alpha: 0)],
          end: Alignment.bottomCenter,
          begin: Alignment.topCenter,
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 60.h),
          Container(
            height: 36.h,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                GestureDetector(
                  onTap:_onPayChange,
                  child: Container(
                    width: 120.w,
                    height: 36.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(36.h),
                    ),
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
                ),
                SizedBox(width: 8.w),
                GestureDetector(
                  onTap: _onPayChange,
                  child: Container(
                    width: 28.w,
                    height: 28.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(36.h),
                    ),
                    child: Stack(
                      children: [
                        Center(
                          child: Image.asset(
                            Assets.twimgB.txPaychange.path,
                            width: 28.w,
                            height: 28.h,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),

                Image.asset(
                  Assets.twimgB.txSetting.path,
                  width: 28.h,
                  height: 28.h,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onPayChange() {
    bool isS = MainCashController.overlayPortalController.isShowing;
    twLooog("=====_onPayChange isS:$isS");
    if(isS){
      MainCashController.overlayPortalController.hide();
    }else{
      MainCashController.overlayPortalController.show();
    }

  }
}
