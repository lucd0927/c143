import 'dart:async';

import 'package:c143/tw_143/tw_common/tw_router.dart';
import 'package:c143/tw_base/tw_ad/ads_iddddd.dart';
import 'package:c143/tw_base/tw_ad/base_ads.dart';
import 'package:c143/tw_base/tw_ad/guiyin/package.dart';
import 'package:c143/tw_base/tw_configgg/config.dart';
import 'package:c143/tw_base/tw_configgg/enum_app_evn.dart';
import 'package:c143/tw_base/tw_gj/loggggg.dart';
import 'package:c143/tw_base/tw_gj/login_trackkkk.dart';
import 'package:c143/tw_base/tw_http/tw_net_check.dart';
import 'package:c143/tw_hive/twhive.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:spine_flutter/spine_flutter.dart';
import 'package:toastification/toastification.dart';
 main() async{

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

// // 2 本地存储
  twLooog("====initFlutter=");
  await Hive.initFlutter();
  await Hive.openBox(TwHive.hBox);
  twLooog("====initSpineFlutter=");
  await initSpineFlutter(enableMemoryDebugging: false);
// 设置只允许竖屏
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    // DeviceOrientation.portraitDown, // 可选：允许上下颠倒的竖屏
  ]);
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge,);
  TwConfigggg.initEvn(TwConfiggEnv.dev);

  twLooog("====SSDlTracking.init=");
  TwLoginnnTrackkkk.init();
  TwNetCheckkkk().isOnline();
  ssNetChecccc.init();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 780),
      minTextAdapt: true,
      // splitScreenMode: true,
      child: GlobalLoaderOverlay(
        child: ToastificationWrapper(
          child: GetMaterialApp(
            // main: MyHomePage(title: '1'),
            title: "Lucky Claus Slots",
            initialRoute: TwRouters.splash,
            builder: (BuildContext context, Widget? child) {
              return Overlay(
                initialEntries: <OverlayEntry>[
                  OverlayEntry(
                    builder: (BuildContext ctx) {
                      return child!;
                    },
                  ),
                ],
              );
              return Overlay();
            },
            // theme: ThemeData(fontFamily: FontFamily.rubik),
            getPages: TwRouters.pages,

            // translations: FanyiTools(),
            // 你的翻译
            // fallbackLocale: Locale('en', 'US'), // 添加一个回调语言选项，以备上面指定的语言翻译不存在
          ),
        ),
      ),
    );
  }
}




Timer? _bgTtttt;
bool sssshowAd = false;

void lcChange() {
  SystemChannels.lifecycle.setMessageHandler((msg) async {
    twLooog('lifecycle> $msg');
    // if(!GGABPackage.isPackageB()){
    //   return msg;
    // }
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top,SystemUiOverlay.bottom]);
    // msg是个字符串，是下面的值
    // AppLifecycleState.resumed
    // AppLifecycleState.inactive
    // AppLifecycleState.paused
    // AppLifecycleState.detached
    if (msg == "AppLifecycleState.resumed") {


      // JCShijianBaogao.session();
      _bgTtttt?.cancel();
      if (sssshowAd) {
        twLooog("===前后切换加载=GGCommonAds().showInterstitialAd=${TwCommonAds.hasDisplayAd()}=");
        if (!TwCommonAds.hasDisplayAd()) {
          twLooog("===前后切换加载=GGCommonAds().showInterstitialAd==");

          if (TwPackageAB.isPackageB()) {
            TwCommonAds().showInterstitialAd(
              adPosId: TwAdsPosId.test,
              ignored_hasDisplayAd: false,
              canTryAgain: false,
            );
          }
        }
      }
      sssshowAd = false;
    } else {
      // bgMusic.pause();
      // bgMusicFreeSpin.pause();
      if (msg == "AppLifecycleState.paused") {
        twLooog("====AppLifecycleState.paused===");
        // JCShijianBaogao.app_background();
        sssshowAd = false;
        _bgTtttt?.cancel();
        _bgTtttt = Timer(Duration(seconds: 3), () {
          sssshowAd = true;
          twLooog("====AppLifecycleState.paused==showAd:$sssshowAd=");
          _bgTtttt?.cancel();
        });
      } else if (msg == "AppLifecycleState.detached") {
      } else if (msg == "AppLifecycleState.inactive") {}
    }

    return msg;
  });
}
