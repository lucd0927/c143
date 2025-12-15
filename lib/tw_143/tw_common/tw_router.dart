
import 'package:c143/tw_143/tw_pages/main/main_page.dart';
import 'package:c143/tw_143/tw_pages/splash/splash.dart';
import 'package:get/get.dart';

class TwRouters {
  static const splash = "/splash";
  static const main = "/main";


  static List<GetPage> pages = [
    GetPage(name: splash, page: () =>  TwSplash()),
    GetPage(name: main, page: () =>  TwMainPage()),
  ];
}