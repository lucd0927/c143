import 'dart:async';

import 'package:c143/tw_143/tw_common/tw_router.dart';
import 'package:c143/tw_base/tw_ad/base_ads.dart';
import 'package:c143/tw_base/tw_ad/guiyin/package.dart';
import 'package:c143/tw_base/tw_configgg/config.dart';
import 'package:c143/tw_base/tw_configgg/enum_app_evn.dart';
import 'package:c143/tw_base/tw_gj/logC143.dart';
import 'package:c143/tw_base/tw_gj/login_trackC143.dart';
import 'package:c143/tw_base/tw_http/tw_net_check.dart';
import 'package:c143/tw_hive/twhiveC143.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:spine_flutter/spine_flutter.dart';
import 'package:toastification/toastification.dart';

main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // // 2 本地存储
  twLooog("====initFlutter=");
  await Hive.initFlutter();
  await Hive.openBox(TwHive.twkeyBox);

  // 设置只允许竖屏
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    // DeviceOrientation.portraitDown, // 可选：允许上下颠倒的竖屏
  ]);
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  twLooog("====initSpineFlutter=");
  await initSpineFlutter(enableMemoryDebugging: false);
  TwConfigggg.initEvn(TwConfiggEnv.dev);

  twLooog("====SSDlTracking.init=");
  TwLoginnnTrackC143.init();
  TwNetCheckC143().isOnline();
  ssNetCheckC143.initC143();

  runApp(const MyAppC143());
}

class MyAppC143 extends StatelessWidget {
  const MyAppC143({super.key});

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
            title: "TreeWorld",
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
            getPages: TwRouters.pagesC143,

            // translations: FanyiTools(),
            // 你的翻译
            // fallbackLocale: Locale('en', 'US'), // 添加一个回调语言选项，以备上面指定的语言翻译不存在
          ),
        ),
      ),
    );
  }
}

Timer? _bgTttttC143;
bool sssshowAdC143 = false;

void lcChangeC143() {
  SystemChannels.lifecycle.setMessageHandler((msg) async {
    twLooog('lifecycleC143> $msg');
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
      _bgTttttC143?.cancel();
      if (sssshowAdC143) {
        twLooog(
          "===前后切换加载=TwCommonAds().showInterstitialAd=${TwCommonAds.hasDisplayAd()}=",
        );
        if (!TwCommonAds.hasDisplayAd()) {
          twLooog("===前后切换加载=TwCommonAds().showInterstitialAd==");

          if (TwPackageABC143.isPackageB()) {
            // TwCommonAds().showInterstitialAd(
            //   adPosId: TwAdsPosId.test,
            //   ignored_hasDisplayAd: false,
            //   canTryAgain: false,
            // );
          }
        }
      }
      sssshowAdC143 = false;
    } else {
      // bgMusic.pause();
      // bgMusicFreeSpin.pause();
      if (msg == "AppLifecycleState.paused") {
        twLooog("====AppLifecycleState.paused===");
        // JCShijianBaogao.app_background();
        sssshowAdC143 = false;
        _bgTttttC143?.cancel();
        _bgTttttC143 = Timer(Duration(seconds: 3), () {
          sssshowAdC143 = true;
          twLooog("====AppLifecycleState.paused==showAd:$sssshowAdC143=");
          _bgTttttC143?.cancel();
        });
      } else if (msg == "AppLifecycleState.detached") {
      } else if (msg == "AppLifecycleState.inactive") {}
    }

    return msg;
  });
}
