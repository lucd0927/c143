import 'package:c143/gen/assets.gen.dart';
import 'package:c143/tw_hive/twhiveC143.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum TwEnumPayType {
  paypal('paypal'),
  cashapp('cashapp');

  final String nnnname;

  const TwEnumPayType(this.nnnname);
}

class MainCashController extends GetxController {
  static MainCashController get to => Get.find();

  static OverlayPortalController overlayPortalController =
      OverlayPortalController();

  static const String twkeyPay = "twkeyPayC143";

  var curPayTypeC143 = TwEnumPayType.paypal.nnnname.obs;
  var box = TwHive.box;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    String tmpcurpay = box.get(twkeyPay) ?? TwEnumPayType.paypal.nnnname;

    curPayTypeC143 = tmpcurpay.obs;
  }

  String payIconCashTop(){
    String icon = Assets.twimgB.txPaypal.path;
    String tmpCurPaytype = curPayTypeC143.value;
    if(tmpCurPaytype == TwEnumPayType.paypal.nnnname){
      icon = Assets.twimgB.txPaypal.path;
    }else if(tmpCurPaytype == TwEnumPayType.cashapp.nnnname){
      icon = Assets.twimgB.txCashapp.path;
    }


    return icon;

  }
  String payIconMainTop(){
    String icon = Assets.twimgB.txPaypalMaintop.path;
    String tmpCurPaytype = curPayTypeC143.value;
    if(tmpCurPaytype == TwEnumPayType.paypal.nnnname){
      icon = Assets.twimgB.txPaypalMaintop.path;
    }else if(tmpCurPaytype == TwEnumPayType.cashapp.nnnname){
      icon = Assets.twimgB.txCashappMaintop.path;
    }


    return icon;

  }


  String payBgCash(){
    String icon = Assets.twimgB.txBg.path;
    String tmpCurPaytype = curPayTypeC143.value;
    if(tmpCurPaytype == TwEnumPayType.paypal.nnnname){
      icon = Assets.twimgB.txBg.path;
    }else if(tmpCurPaytype == TwEnumPayType.cashapp.nnnname){
      icon = Assets.twimgB.txBg2.path;
    }


    return icon;

  }
  List<Color> progressColors(){
    List<Color> tmpColors = [Color(0xff0056F1), Color(0xff009CDE)];
    String tmpCurPaytype = curPayTypeC143.value;
    if(tmpCurPaytype == TwEnumPayType.paypal.nnnname){
      tmpColors = [Color(0xff0056F1), Color(0xff009CDE)];
    }else if(tmpCurPaytype == TwEnumPayType.cashapp.nnnname){
      tmpColors = [Color(0xff059F40), Color(0xff15CD6E)];
    }


    return tmpColors;

  }


}
