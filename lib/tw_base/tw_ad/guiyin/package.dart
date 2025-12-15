
import 'dart:async';
import 'dart:io';


import 'package:rxdart/rxdart.dart';
import 'package:c143/tw_hive/twhive.dart';
import 'package:c143/tw_base/tw_ad/base_ads.dart';
import 'package:c143/tw_base/tw_ad/fengkkkong.dart';
import 'package:c143/tw_base/tw_ad/guiyin/adjust.dart';
import 'package:c143/tw_base/tw_ad/guiyin/af.dart';
import 'package:c143/tw_base/tw_ad/guiyin/firebbbbbb.dart';
import 'package:c143/tw_base/tw_gj/loggggg.dart';
import 'package:c143/tw_base/tw_http/http_dio.dart';


class TwPackageAB {
  static final TwPackageAB _instance = TwPackageAB._();

  // auto patch 642
  factory TwPackageAB() {
    return _instance;
  }

  TwPackageAB._();

  static const String cloakBData = "chromium";
  static const String cloakAData = "sprung";
  static const String afDataOrganic = "Organic";

  static const String kHivePackage = "kjdsdsfjkghj";
  static const String packageA = "ppppppA";
  static const String packageB = "ppppppB";

  static String get clockData => _cloakData;

  // static String _clockData = "";

  static bool showH5() {
    twLooog("$TGA====showH5=_cloakData:$_cloakData==cloakBData:$cloakBData");
    return _cloakData == cloakBData;
  }

  static String _name = packageA;

  // 哪个包  A包还是B包 默认A包
  static String get name => _name;
  final subject = BehaviorSubject<String>();

  static bool isPackageB() {
    return packageB == name;
  }

  var box = TwHive.box;

  void sendAAA({required String cloakData, required String afData}) {
    bool entryBBB =
        cloakData == cloakBData &&
            (afData.isNotEmpty && afData != afDataOrganic);
    twLooog(
      "$TGA=ABPackage send: cloakData:$cloakData  ====afData:$afData entryBBB:$entryBBB",
    );

    var data = box.get(kHivePackage);

    if (entryBBB) {
      if (data == packageB) {
        _name = packageB;
        return;
      }
      _name = packageB;

      box.put(kHivePackage, packageB);
      TwFengk.initNumberUnit();

      initCompleter?.complete(true);
      initCompleter = null;
      subject.add(_name);
    } else {
      _name = packageA;
      box.put(kHivePackage, packageA);
      initCompleter?.complete(false);
      initCompleter = null;
      subject.add(_name);
    }
  }

  void dispose() {
    subject.close();
  }

  void listen(void Function(String packageName) update) {
    subject.stream.listen((String a) {
      twLooog("$TGA=ABPackage: update packageName:$a");
      update(a);
    });
  }

  // 正常模式 B包 oft
  // 命中黑名单 A包   brash
  static String _cloakData = cloakAData;

  // Organic network里是否包含【Organic】字段，如果包含则为自然量用户，并且展示为A包
  String _appsFlyerData = afDataOrganic;

  static const String kkGuiyin = "sdfjkdshfgkj";

  hasSaveGuiyinData(){

  }

  guiyin(String source) {
    if (isPackageB()) {
      return;
    }
    box.put(kkGuiyin, source);
    String qs_af_on123 = TwFirebasssss().by(name: "qs_adjust_on");
    twLooog("$TGA==guiyin=pre==qs_af_on123:$qs_af_on123==");
    if (qs_af_on123.isEmpty) {
      qs_af_on123 = "1";
    }
    twLooog("$TGA==guiyin=now==qs_af_on123:$qs_af_on123==");

    if (qs_af_on123 == "1") {
      twLooog("$TGA==guiyin=now==qm_af_on: 返回1 需要判断af的数据");
      if (source.isNotEmpty && source != afDataOrganic) {
        twLooog("$TGA===========guiyin= mailiang");
        // 4.满足买量用户的判断条件
        _appsFlyerData = source;
        // JCShijianBaogao.organic_to_buy();
      } else {
        _appsFlyerData = afDataOrganic;
        twLooog("$TGA===========guiyin= zirang");
      }
      // JCShijianBaogao.adjust_suc(_appsFlyerData == afDataOrganic ? "0" : "1");
      // int mill = 12000;
      // Future.delayed(Duration(milliseconds: mill), () {
      //   // todo: 测试代码
      //   _appsFlyerData = "ddd";
      //   sendAAA(cloakData: _cloakData, afData: _appsFlyerData);
      // });

      sendAAA(cloakData: _cloakData, afData: _appsFlyerData);
    } else if (qs_af_on123 == "0") {
      twLooog("$TGA===now==qm_af_on: 返回0 不需要判断af的数据");
      _appsFlyerData = "qs_af_on123";
      sendAAA(cloakData: _cloakData, afData: _appsFlyerData);
    }
  }

  cloakAAAA({int count = 0}) async {
    // JCShijianBaogao.cloak_req();
    var data = await TwHttpDio().cloak();
    twLooog("$TGA=package cloak data:$data count:$count");

    _cloakData = data;
    // JCShijianBaogao.cloak_suc(_cloakData == cloakBData ? "1" : "0");
    // 正常模式 B包
    if (data == cloakBData) {
      twLooog("$TGA=====正常模式 B包==data:$data=");
      _cloakData = data;
      // send(cloakData: _cloakData, afData: _appsFlyerData);
      // await _initAppsFlyer();
      return data;
    }
    // 命中黑名单 A包
    else if (data == cloakAData) {
      twLooog("$TGA=====命中黑名单 A包==data:$data=");
      _cloakData = data;
      // send(cloakData: _cloakData, afData: _appsFlyerData);
      // await _initAppsFlyer();
      return data;
    }
    // 其他数据则再次请求
    else {
      if (count == 10) {
        return cloakAData;
      }

      await Future.delayed(Duration(milliseconds: 1000), () {});
      var nextCount = count + 1;
      return await cloakAAAA(count: nextCount);
    }
  }

  Future _initA() async {
    // 广告初始化
    twLooog("$TGA====_initA==cloak();==");
    var cloakData = await cloakAAAA();
    twLooog("$TGA====_initA==cloakData:$cloakData==");
    DateTime dateTime = DateTime.now();
    twLooog("$TGA===PBFireBbbbbb==${dateTime.millisecondsSinceEpoch}");
    // 初始化firebase
    await TwFirebasssss().init();
    DateTime dateTime2 = DateTime.now();
    twLooog(
      "$TGA===PBFireBbbbbb==${dateTime2.millisecondsSinceEpoch - dateTime.millisecondsSinceEpoch}",
    );
    await _chushiGuiyin();



  }

  Future _initB() async {
    // await TBDeviceManager.isLimitAdTrackingEnabled();
    // 广告初始化
    twLooog("$TGA===_initB===GGCommonAds().init start==");
    int time = DateTime.now().millisecondsSinceEpoch;
    // await GGCommonAds().init();
    int time2 = DateTime.now().millisecondsSinceEpoch;
    twLooog("$TGA===_initB===GGCommonAds().init end===耗时:${time2 - time}");
    var box = TwHive.box;
    box.put(kHivePackage, packageB);
    twLooog("$TGA===_initB===_initAppsFlyer() start==");
    await _chushiGuiyin();
    int time3 = DateTime.now().millisecondsSinceEpoch;
    twLooog("$TGA===_initB===_initAppsFlyer() end===耗时:${time3 - time2}");
    if (Platform.isAndroid) {
      await TwFengk.initNumberUnit();
      int time4 = DateTime.now().millisecondsSinceEpoch;
      twLooog("$TGA===_initB===SWFengKong() end===耗时:${time4 - time3}");
    }

    // JCShijianBaogao.cloak_req();
    TwHttpDio().cloak().then((v) {
      _cloakData = v ?? "";
      if (v.isEmpty) {
        _cloakData = cloakAData;
      }
      // JCShijianBaogao.cloak_suc(_cloakData == cloakBData ? "1" : "0");

    });

    initCompleter?.complete(true);
  }

  // auto patch 285

  Completer<bool>? initCompleter;
  static const String TGA = "QuizPackage:";

  Future<bool> init() async {
    initCompleter = Completer<bool>();
    var box = TwHive.box;
    var packageName = box.get(kHivePackage) ?? packageA;
    // packageName = packageB;

    _name = packageName;
    twLooog("$TGA=package==init:$packageName==");
    if (packageName == packageB) {
      DateTime dateTime = DateTime.now();
      twLooog("$TGA===PBFireBbbbbb==${dateTime.millisecondsSinceEpoch}");
      // 初始化firebase
      await TwFirebasssss().init();
      DateTime dateTime2 = DateTime.now();
      twLooog(
        "$TGA===PBFireBbbbbb==${dateTime2.millisecondsSinceEpoch - dateTime.millisecondsSinceEpoch}",
      );

      await _initB();
    } else {
      await _initA();
    }

    bool result = (await initCompleter?.future) ?? false;
    twLooog("$TGA=package==result:$result==isPackageB:${isPackageB()}");
    if (isPackageB()) {
      DateTime dd = DateTime.now();
      // 初始化firebase
      await TwCommonAds().init();
      DateTime dddd = DateTime.now();
      twLooog(
        "$TGA===PBCommonAds==${dddd.millisecondsSinceEpoch - dd.millisecondsSinceEpoch}",
      );
    }

    return result;
  }

  bool sfChushiAF = false;
  bool hasAdjust = true;

  _chushiGuiyin() async {
    if (!sfChushiAF) {
      sfChushiAF = true;

      if (hasAdjust) {
        await TwAdjusssss().initSdk("d1x71jap6eio");
      } else {
        String asdkasfdhka = "XM9ua37BHJWBKq8jTYg74a";
        if (asdkasfdhka.isEmpty) {
          return;
        }
        await TwApppsF().initAppsFlyer(afDevKey: asdkasfdhka, appId: "6752763599");
      }
      String qs_af_on123 = TwFirebasssss().by(name: "qs_adjust_on");
      twLooog("==qs_af_on123==$qs_af_on123");
      //
      // String qs_af_on123 = PBFireBbbbbb().by(name: "qs_adjust_on");
      // pbLog("$TGA==guiyin=pre==qs_af_on123:$qs_af_on123==");
      // if (qs_af_on123.isEmpty) {
      //   qs_af_on123 = "1";
      // }
      //
      // if(qs_af_on123 == "0"){
      //   _appsFlyerData = "qs_af_on123";
      //   sendAAA(cloakData: _cloakData, afData: _appsFlyerData);
      // }
      //

    }
  }
}