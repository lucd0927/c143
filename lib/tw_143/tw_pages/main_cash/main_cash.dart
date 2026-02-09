import 'package:c143/gen/assets.gen.dart';
import 'package:c143/tw_143/tw_common/lottieeee/common.dart';
import 'package:c143/tw_143/tw_pages/main_cash/main_cash_controller.dart';
import 'package:c143/tw_143/tw_pages/main_cash/overlayc143/pay_change.dart';
import 'package:c143/tw_143/tw_pages/main_cash/overlayc143/withdraw_succpop.dart';
import 'package:c143/tw_143/tw_pages/main_cash/viewC143/cash_account_detail.dart';
import 'package:c143/tw_143/tw_pages/main_cash/viewC143/cash_progress.dart';
import 'package:c143/tw_143/tw_pages/main_cash/viewC143/cash_top_bar.dart';
import 'package:c143/tw_143/tw_pages/main_tree/main_tree_controller.dart';
import 'package:c143/tw_base/tw_ad/guiyin/package.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
      if (TwPackageABC143.isPackageB()) {
        TopNotificationManager.instance.startLoop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return OverlayPortal(
      controller: MainCashController.overlayPortalController,
      overlayChildBuilder: (BuildContext context) {
        return CashTopChange(
          onClose: () {
            MainCashController.overlayPortalController.hide();
          },
        );
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color(0xffF2F2F2),
        child: Stack(
          children: [
            Positioned.fill(
              child: SingleChildScrollView(
                child: Column(
                  children: [CashTopBar(), CashAccountDetail(), CashProgress()],
                ),
              ),
            ),

            Obx(() {
              bool show = MainCashController.to.showMoneyHeorJson.value;
              if(!show){
                return const SizedBox();
              }
              return Positioned.fill(
                  child: IgnorePointer(child: TwLottieCommon(type: EnumTwLottttieJson.moneyHero)));
            }),
          ],
        ),
      ),
    );
  }
}
