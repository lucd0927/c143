import 'package:c143/gen/assets.gen.dart';
import 'package:c143/tw_143/tw_pages/main_cash/main_cash_controller.dart';
import 'package:c143/tw_143/tw_pages/main_cash/overlayc143/pay_change.dart';
import 'package:c143/tw_143/tw_pages/main_cash/overlayc143/withdraw_succpop.dart';
import 'package:c143/tw_143/tw_pages/main_cash/viewC143/cash_account_detail.dart';
import 'package:c143/tw_143/tw_pages/main_cash/viewC143/cash_progress.dart';
import 'package:c143/tw_143/tw_pages/main_cash/viewC143/cash_top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainCash extends StatefulWidget {
  const MainCash({super.key});

  @override
  State<MainCash> createState() => _MainCashState();
}

class _MainCashState extends State<MainCash> {

  @override
  void initState() {
    super.initState();
    // 页面初始化后启动弹窗循环
    WidgetsBinding.instance.addPostFrameCallback((_) {
      TopNotificationManager.instance.startLoop(context);
    });
  }
  @override
  Widget build(BuildContext context) {
    return OverlayPortal(
      controller: MainCashController.overlayPortalController,
      overlayChildBuilder: (BuildContext context){
        return CashTopChange(onClose: () {
          MainCashController.overlayPortalController.hide();
        },);
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color(0xffF2F2F2),
        child: SingleChildScrollView(
          child: Column(
            children: [CashTopBar(), CashAccountDetail(), CashProgress()],
          ),
        ),
      ),
    );
  }
}
