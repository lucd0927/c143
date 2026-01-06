import 'dart:async';
import 'dart:io';

import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:c143/tw_base/tw_ad/base_ads.dart';
import 'package:c143/tw_base/tw_ad/fengkkkongC143.dart';
import 'package:c143/tw_base/tw_ad/guiyin/adjust.dart';
import 'package:c143/tw_base/tw_ad/guiyin/af.dart';
import 'package:c143/tw_base/tw_ad/guiyin/firebbbbbb.dart';
import 'package:c143/tw_base/tw_configgg/config.dart';
import 'package:c143/tw_base/tw_gj/logC143.dart';
import 'package:c143/tw_base/tw_http/http_dioC143.dart';
import 'package:c143/tw_hive/twhiveC143.dart';
import 'package:rxdart/rxdart.dart';

class TwPackageABC143 {
  static final TwPackageABC143 _instanceC143 = TwPackageABC143._();

  factory TwPackageABC143() {
    return _instanceC143;
  }

  TwPackageABC143._();

  static String get cloakBData => Platform.isIOS ? "dsaf" : "sdfg";

  static String get cloakAData => Platform.isIOS ? "fdjhgdhj" : "wqrew";
  static const String afDataOrganic = "Organic";

  static const String kHivePackage = "kjdsdsfjkghj";
  static const String packageA = "ppppppA";
  static const String packageB = "ppppppB";

  static String get clockData => _cloakDataC143;

  // static String _clockData = "";

  static bool showH5() {
    twLooog("$TGA====showH5=_cloakData:$_cloakDataC143==cloakBData:$cloakBData");
    return _cloakDataC143 == cloakBData;
  }

  static String _name = packageA;

  // 哪个包  A包还是B包 默认A包
  static String get name => _name;
  final subject = BehaviorSubject<String>();

  static bool isPackageB() {
    return packageB == name;
  }

  var box = TwHive.box;

  _sendAC143({required String cloakData, required String afData}) async {
    bool entryBBB =
        cloakData == cloakBData &&
            (afData.isNotEmpty && afData != afDataOrganic);
    twLooog(
      "$TGA=SSABChange().listen ABPackage send: cloakData:$cloakData  ====afData:$afData entryBBB:$entryBBB",
    );

    var data = box.get(kHivePackage);
    // entryBBB = true;
    // await Future.delayed(Duration(milliseconds: 15000));
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
  static String _cloakDataC143 = cloakAData;

  // Organic network里是否包含【Organic】字段，如果包含则为自然量用户，并且展示为A包
  String _appsFlyerDataC143 = afDataOrganic;

  static const String kkGuiyinC143 = "sdfjkdshfgkjC143";

  guiyin(String source) {
    if (isPackageB()) {
      return;
    }
    box.put(kkGuiyinC143, source);
    String qs_af_on123 = TwFirebasC143().by(name: "qs_adjust_on");
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
        _appsFlyerDataC143 = source;
        // JCShijianBaogao.organic_to_buy();
      } else {
        _appsFlyerDataC143 = afDataOrganic;
        twLooog("$TGA===========guiyin= zirang");
      }
      // JCShijianBaogao.adjust_suc(_appsFlyerData == afDataOrganic ? "0" : "1");
      // int mill = 12000;
      // Future.delayed(Duration(milliseconds: mill), () {
      //   // todo: 测试代码
      //   _appsFlyerData = "ddd";
      //   sendAAA(cloakData: _cloakData, afData: _appsFlyerData);
      // });

      _sendAC143(cloakData: _cloakDataC143, afData: _appsFlyerDataC143);
    } else if (qs_af_on123 == "0") {
      twLooog("$TGA===now==qm_af_on: 返回0 不需要判断af的数据");
      _appsFlyerDataC143 = "qs_af_on123";
      _sendAC143(cloakData: _cloakDataC143, afData: _appsFlyerDataC143);
    }
  }


  Future<void> requestATT() async {
    if(Platform.isIOS){
      final status = await AppTrackingTransparency.trackingAuthorizationStatus;
      twLooog("$TGA===requestATT==status: $status");
      if (status == TrackingStatus.notDetermined) {
        TrackingStatus trackingStatus = await AppTrackingTransparency.requestTrackingAuthorization();
        twLooog("$TGA===requestATT==trackingStatus: $trackingStatus");
      }
    }


  }

  cloakAAC143({int count = 0}) async {
    // JCShijianBaogao.cloak_req();
    var data = await TwHttpDio().cloak();
    twLooog("$TGA=package cloak data:$data count:$count");

    _cloakDataC143 = data;
    // JCShijianBaogao.cloak_suc(_cloakData == cloakBData ? "1" : "0");
    // 正常模式 B包
    if (data == cloakBData) {
      twLooog("$TGA=====正常模式 B包==data:$data=");
      _cloakDataC143 = data;
      // send(cloakData: _cloakData, afData: _appsFlyerData);
      // await _initAppsFlyer();
      return data;
    }
    // 命中黑名单 A包
    else if (data == cloakAData) {
      twLooog("$TGA=====命中黑名单 A包==data:$data=");
      _cloakDataC143 = data;
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
      return await cloakAAC143(count: nextCount);
    }
  }

  Future _initAC143() async {


    // 广告初始化
    twLooog("$TGA====_initA==cloak();==");
    // var cloakData = await cloakAAAA();
    // twLooog("$TGA====_initA==cloakData:$cloakData==");
    DateTime dateTime = DateTime.now();
    twLooog("$TGA===PBFireBbbbbb==${dateTime.millisecondsSinceEpoch}");
    // 初始化firebase
    // await TwFirebasssss().init();
    DateTime dateTime2 = DateTime.now();
    twLooog(
      "$TGA===PBFireBbbbbb==${dateTime2.millisecondsSinceEpoch - dateTime.millisecondsSinceEpoch}",
    );
    initAd();
    // await _chushiGuiyin();

    twLooog("$TGA===_chushiGuiyin==end");
  }

  Future _initBC143() async {
    // await TBDeviceManager.isLimitAdTrackingEnabled();
    // 广告初始化
    twLooog("$TGA===_initB===TwCommonAds().init start==");
    int time = DateTime.now().millisecondsSinceEpoch;
    // await TwCommonAds().init();
    int time2 = DateTime.now().millisecondsSinceEpoch;
    twLooog("$TGA===_initB===TwCommonAds().init end===耗时:${time2 - time}");
    box.put(kHivePackage, packageB);
    twLooog("$TGA===_initB===_initAppsFlyer() start==");
    initAd();
    await _chushiGuiyinC143();
    int time3 = DateTime.now().millisecondsSinceEpoch;
    twLooog("$TGA===_initB===_initAppsFlyer() end===耗时:${time3 - time2}");
    if (Platform.isAndroid) {
      await TwFengk.initNumberUnit();
      int time4 = DateTime.now().millisecondsSinceEpoch;
      twLooog("$TGA===_initB===SWFengKong() end===耗时:${time4 - time3}");
    }

    // JCShijianBaogao.cloak_req();
    TwHttpDio().cloak().then((v) {
      _cloakDataC143 = v ?? "";
      if (v.isEmpty) {
        _cloakDataC143 = cloakAData;
      }
      // JCShijianBaogao.cloak_suc(_cloakData == cloakBData ? "1" : "0");
    });

    initCompleter?.complete(true);
  }

  // auto patch 285

  Completer<bool>? initCompleter;
  static const String TGA = "13222222:";

  Future<bool> init() async {
    initCompleter = Completer<bool>();
    var packageName = box.get(kHivePackage) ?? packageA;
    // packageName = packageB;
    if (Platform.isAndroid) {
      packageName = packageB;
    }

    _name = packageName;
    DateTime dateTime = DateTime.now();
    await requestATT();
    twLooog("$TGA=package==init:$packageName==");
    if (packageName == packageB) {
      twLooog("$TGA===PBFireBbbbbb==${dateTime.millisecondsSinceEpoch}");
      // 初始化firebase
      await TwFirebasC143().init();
      DateTime dateTime2 = DateTime.now();
      twLooog(
        "$TGA===PBFireBbbbbb==${dateTime2.millisecondsSinceEpoch - dateTime.millisecondsSinceEpoch}",
      );

      _initBC143();
    } else {
      _initAC143();
    }

    bool result = (await initCompleter?.future) ?? false;
    DateTime dateTimeEnd = DateTime.now();
    twLooog(
      "$TGA==SSABChange().listen==guiyin time==${dateTimeEnd.millisecondsSinceEpoch - dateTime.millisecondsSinceEpoch}",
    );

    twLooog("$TGA=package==result:$result==isPackageB:${isPackageB()}");
    // if (isPackageB() || true) {
    //   await initAd();
    // }
    // await Future.delayed(Duration(milliseconds: 20000));
    return result;
  }

  initAd() async {
    DateTime dd = DateTime.now();
    // 初始化firebase
    await TwCommonAds().init();
    DateTime dddd = DateTime.now();
    twLooog(
      "$TGA===SSCommonAds==${dddd.millisecondsSinceEpoch - dd.millisecondsSinceEpoch}",
    );
  }

  bool sfChushiAF = false;
  bool hasAdjust = true;

  _chushiGuiyinC143() async {
    if (!sfChushiAF) {
      sfChushiAF = true;

      if (hasAdjust) {
        await TwAdjusssC143().initSdk(
          TwConfigggg.hasDeeevv()
              ? (Platform.isIOS
              ? "sadf"
              : "dhgdfh")
              : (Platform.isIOS ? "ghjj" : "rtuytu"),
        );
      } else {
        String asdkasfdhka = "XM9ua37BHJWBKq8jTYg74a";
        if (asdkasfdhka.isEmpty) {
          return;
        }
        await TwApppsF().initAppsFlyer(afDevKey: asdkasfdhka, appId: "34557");
      }
      String qs_af_on123 = TwFirebasC143().by(name: "qs_adjust_on");
      twLooog("==qs_af_on123==$qs_af_on123");
    }
  }
}