import 'dart:ui';

import 'package:c143/tw_base/tw_ad/dialooooo/ad_failed.dart';
import 'package:get/get.dart';
import 'package:c143/tw_views/pb_tushi.dart';

class TwAdsTips {
  static void toast({
    String text = "Ad loading failed, please try again later",
  }) {
    twToast(text: text);
  }

  static noAds({
    required VoidCallback onTryAgain,
    required VoidCallback onClose,
  }) async {
    showAdFailedDialog(
      Get.context!,
      onBtn: () {
        onTryAgain();
      },
      onClose: () {
        onClose();
      },
    );
  }
}
