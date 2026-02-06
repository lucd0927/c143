import 'dart:async';

import 'package:c143/gen/assets.gen.dart';
import 'package:c143/tw_143/tw_pages/main/main_controller.dart';
import 'package:c143/tw_143/tw_pages/main_cash/overlayc143/card_input.dart';
import 'package:c143/tw_143/tw_pages/main_tree/main_tree_controller.dart';
import 'package:c143/tw_hive/twhiveC143.dart';
import 'package:c143/tw_views/pb_tushi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum TwEnumPayType {
  paypal('Paypal'),
  cashapp('CashApp');

  final String nnnname;

  const TwEnumPayType(this.nnnname);
}

class MainCashController extends GetxController {
  static MainCashController get to => Get.find();

  static OverlayPortalController overlayPortalController =
      OverlayPortalController();

  static const String twkeyPay = "twkeyPayC143";
  static const String twkeySaveCardId = "twkeySaveCardIdC143";
  var curSaveCardIdddC143 = "".obs;
  var curPayTypeC143 = TwEnumPayType.paypal.nnnname.obs;
  var box = TwHive.box;
  var showMoneyHeorJson = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    String tmpcurpay = box.get(twkeyPay) ?? TwEnumPayType.paypal.nnnname;

    curPayTypeC143 = tmpcurpay.obs;

    String tmpcardId = box.get(twkeySaveCardId) ?? "";
    curSaveCardIdddC143 = tmpcardId.obs;
  }

  showMoneyHeroJsonTrue() {
    showMoneyHeorJson.value = true;
    // Timer(Duration(milliseconds: 5000),(){
    //   showMoneyHeorJson.value = false;
    // });
    MainTreeController.to.saveGuide7CashoutData();
  }

  savePaytypeC143(TwEnumPayType type) {
    box.put(twkeyPay, type.nnnname);
    curPayTypeC143.value = type.nnnname;
  }

  savePayIcon() {
    String tmpCurPaytype = box.get(twkeyPay) ?? TwEnumPayType.paypal.nnnname;
    String icon = Assets.twimgB.txPaypal.path;
    if (tmpCurPaytype == TwEnumPayType.paypal.nnnname) {
      icon = Assets.twimgB.txPaypal.path;
    } else if (tmpCurPaytype == TwEnumPayType.cashapp.nnnname) {
      icon = Assets.twimgB.txCashapp.path;
    }
    return icon;
  }

  savePayName() {
    String tmpCurPaytype = box.get(twkeyPay) ?? TwEnumPayType.paypal.nnnname;
    return tmpCurPaytype;
  }

  saveCardIdddd(String cardId) {
    box.put(twkeySaveCardId, cardId);

    curSaveCardIdddC143.value = cardId;
  }

  bool hasSaveCardIddddC143() {
    return curSaveCardIdddC143.value.isNotEmpty;
  }

  String payIconCashTop() {
    String icon = Assets.twimgB.txPaypal.path;
    String tmpCurPaytype = curPayTypeC143.value;
    if (tmpCurPaytype == TwEnumPayType.paypal.nnnname) {
      icon = Assets.twimgB.txPaypal.path;
    } else if (tmpCurPaytype == TwEnumPayType.cashapp.nnnname) {
      icon = Assets.twimgB.txCashapp.path;
    }

    return icon;
  }

  String payIconMainTop() {
    String icon = Assets.twimgB.txPaypalMaintop.path;
    String tmpCurPaytype = curPayTypeC143.value;
    if (tmpCurPaytype == TwEnumPayType.paypal.nnnname) {
      icon = Assets.twimgB.txPaypalMaintop.path;
    } else if (tmpCurPaytype == TwEnumPayType.cashapp.nnnname) {
      icon = Assets.twimgB.txCashappMaintop.path;
    }

    return icon;
  }

  String payIconMainTop2() {
    String icon = Assets.twimgB.txPaypalMaintop2.path;
    String tmpCurPaytype = curPayTypeC143.value;
    if (tmpCurPaytype == TwEnumPayType.paypal.nnnname) {
      icon = Assets.twimgB.txPaypalMaintop2.path;
    } else if (tmpCurPaytype == TwEnumPayType.cashapp.nnnname) {
      icon = Assets.twimgB.txCashappMaintop2.path;
    }

    return icon;
  }

  String payBgCash() {
    String icon = Assets.twimgB.txBg.path;
    String tmpCurPaytype = curPayTypeC143.value;
    if (hasSaveCardIddddC143()) {
      icon = Assets.twimgB.txBg3.path;
    } else {
      if (tmpCurPaytype == TwEnumPayType.paypal.nnnname) {
        icon = Assets.twimgB.txBg.path;
      } else if (tmpCurPaytype == TwEnumPayType.cashapp.nnnname) {
        icon = Assets.twimgB.txBg2.path;
      }
    }

    return icon;
  }

  List<Color> progressColorsMain() {
    List<Color> tmpColors = [Color(0xff003389), Color(0xff0870BB)];
    String tmpCurPaytype = curPayTypeC143.value;

    if (hasSaveCardIddddC143() && false) {
      tmpColors = [Color(0xffF4D5A4), Color(0xffD9B275)];
    } else {
      if (tmpCurPaytype == TwEnumPayType.paypal.nnnname) {
        tmpColors = [Color(0xff003389), Color(0xff0870BB)];
      } else if (tmpCurPaytype == TwEnumPayType.cashapp.nnnname) {
        tmpColors = [Color(0xff056629), Color(0xff0A963E)];
      }
    }

    return tmpColors;
  }

  List<Color> progressColors() {
    List<Color> tmpColors = [Color(0xff0056F1), Color(0xff009CDE)];
    String tmpCurPaytype = curPayTypeC143.value;

    if (hasSaveCardIddddC143()) {
      tmpColors = [Color(0xffF4D5A4), Color(0xffD9B275)];
    } else {
      if (tmpCurPaytype == TwEnumPayType.paypal.nnnname) {
        tmpColors = [Color(0xff0056F1), Color(0xff009CDE)];
      } else if (tmpCurPaytype == TwEnumPayType.cashapp.nnnname) {
        tmpColors = [Color(0xff059F40), Color(0xff15CD6E)];
      }
    }

    return tmpColors;
  }

  onWithdraw() {
    double curMonnnn = MainTreeController.to.curMoneyyyy.value;
    bool hasSvae = hasSaveCardIddddC143();
    if (hasSvae) {
      MainController.to.resetIndex(MainController.treeIndex);
    } else {
      if (curMonnnn < MainTreeController.stageB1Num) {
        // twToast(text: "Minimum withdrawal amount not reached.");
        MainController.to.resetIndex(MainController.quizIndex);
        return;
      } else {
        OverlayWithdrawCardInfoC143().show();
      }
    }
  }
}
