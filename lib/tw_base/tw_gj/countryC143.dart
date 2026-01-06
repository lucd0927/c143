
import 'dart:io';


class TwCountryyC143 {
  // 美国
  static const String usCountry = "ssssss";

  // 巴西
  static const String brCountry = "Bxxxxx";

  static bool hasUSAC143() {
    bool result = _huoquGuojiaC143() == usCountry;
    // result = false;
    // ggPrint("=Country====isUSA==$result=");
    return result;
  }

  // static bool isBR() {
  //   bool result = _getCountryFromPlatform() == brCountry;
  //   // result = true;
  //   // ggPrint("=Country====isBR==$result=");
  //   return result;
  // }

  // 当前货币符号
  static String curCountryyyySymbolC143() {
    String symbol = "\$";
    if (!hasUSAC143()) {
      symbol = "R\$";
    }
    return symbol;
  }

  static String _huoquGuojiaC143() {
    String name = Platform.localeName.toLowerCase(); // e.g. "en_US", "pt_BR"
    // ggPrint("=x_getCountryFromPlatform==localeName:$localeName=Get.deviceLocale:${Get.deviceLocale}");
    if (name.startsWith('en')) {
      return usCountry;
    } else if (name.startsWith('pt')) {
      return brCountry;
    }
    return usCountry;
  }

}
