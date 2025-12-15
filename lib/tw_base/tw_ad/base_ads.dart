import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter_custom_facebook/flutter_custom_facebook.dart';
import 'package:c143/tw_base/tw_ad/guiyin/af.dart';
import 'package:c143/tw_base/tw_ad/guiyin/package.dart';
import 'package:c143/tw_base/tw_ad/uuuump.dart';
import 'package:c143/tw_base/tw_ad/guiyin/firebbbbbb.dart';
import 'package:c143/tw_base/tw_gj/loggggg.dart';
import 'package:c143/tw_base/tw_gj/package.dart';
import 'package:c143/tw_hive/twhive.dart';
import 'package:c143/tw_base/tw_http/http_dio.dart';
import 'package:c143/tw_views/pb_tushi.dart';

import 'package:thinkup_sdk/at_index.dart';
import 'package:applovin_max/applovin_max.dart';
import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'package:tuple/tuple.dart';

import 'ads_tipppps.dart';

import 'fengkkkong.dart';
import 'fengkkong_adssss.dart';
import 'base_config.dart';
import 'base_max.dart';
import 'model/ads_json_model.dart';
import 'base_topon.dart';



class TwCommonAds {
  static final TwCommonAds _instance = TwCommonAds._();

  factory TwCommonAds() {
    return _instance;
  }

  TwCommonAds._();

  var box = TwHive.box;

  late Map<String, dynamic> firebaseJson;

  // final GGMaxAdsNew ggMaxAdsNew = GGMaxAdsNew();
  bool _scheme = GGCommonJson.scheme_A;

  // 缓存已经loaded完成的ads
  // key ：adsID   value:{
  //       k_ecpm: ecpm,
  //       "curTime": curTime,
  //       k_ad_type: adsType,
  //       k_platfrom: platform,
  //     }
  static Map<String, dynamic> cacheAdsData = {};

  // 缓存当前播放的ads
  //  key ：adsID
  static Map<String, Completer<bool>> cacheCompleter = {};

  // key:rvone       item1: adid
  //                 item2: platform
  //                 item3: tw_base/tw_ad type
  //                 item4: time out
  // var interstitialData = {};
  // var rewardData = {};

  TwComAdsListener? _ggCommonAdsListener;
  static const String kSWlvac = "kSWlvac";

  static void addAdEndCount() {
    var box = TwHive.box;

    int count = box.get(kSWlvac) ?? 0;
    count = count + 1;
    box.put(kSWlvac, count);
    int zero = count % 5;
    bool result = zero == 0;
    twLooog("=addAdEndCount=now:$count===zero:$zero  report:$result");
    if (result) {
      // todo:
      // SWEventReport.cash_ad_detail("$count");
      // PBMaiDian.cash_ad_detail(veinKeyValue: "$count");
    }
  }

  // 当前的场景。 值查看GGAdPosId
  static String _curAdPosId = "";
  static EnumGetScene? _curScene;

  static bool _hasDisplayAd = false;

  static bool hasDisplayAd() {
    twLooog("===== 广告是否正在显示:$_hasDisplayAd");
    return _hasDisplayAd;
  }

  static void resetDisplayAd() {
    twLooog("=resetDisplayAd==_hasDisplayAd:false=");
    _hasDisplayAd = false;
  }

  // 激励广告收益下发
  // 这个为true，才代表广告成功
  bool _hasRvRevenueReceived = false;

  void resetRvRevenueReceived(){
    _hasRvRevenueReceived = false;
  }

  void rvRevenueReceivedTrue(){
    _hasRvRevenueReceived = true;
  }

  // 激励里面的广告id，可以有插屏id或者激励id
  List<String> _rewardAdsId() {
    List<String> tmp = [];
    jiliAdsModel.keys.toList().forEach((adsID) {
      tmp.add(adsID.toString());
    });
    return tmp;
  }

  List<String> _interstitialAdsId() {
    List<String> tmp = [];
    chapingAdsModel.keys.toList().forEach((adsID) {
      tmp.add(adsID.toString());
    });
    return tmp;
  }

  // 是否是第一次加载完成插屏
  static bool _hasFirstIntLoaded = true;

  static bool get hasFirstIntLoaded => _hasFirstIntLoaded;

  static void logRevenue({
    required final String network,
    required final String currency,
    required final double value,
    required final EnumAdsPlatform source,
  }) async {
    String mediationNetwork = "";
    switch (source) {
      case EnumAdsPlatform.max:
        mediationNetwork = AFMediationNetwork.applovinMax.value;
        break;
      case EnumAdsPlatform.topon:
        mediationNetwork = AFMediationNetwork.topon.value;
        break;
    }
    twLooog(
      "==logRevenue ===network:$network currency:$currency value:$value source:$source。¥ mediationNetwork:$mediationNetwork ${mediationNetwork.isEmpty}",
    );
    if (mediationNetwork.isEmpty) return;

    AppsflyerSdk? appsflyerSdk = TwApppsF.appsflyerSdk();
    twLooog(
      "==logRevenue ===network:$network currency:$currency value:$value source:$source   appsflyerSdk:$appsflyerSdk",
    );
    appsflyerSdk?.logAdRevenue(
      AdRevenueData(
        monetizationNetwork: network,
        mediationNetwork: mediationNetwork,
        currencyIso4217Code: currency,
        revenue: value,
      ),
    );

    FlutterCustomFacebook.instance.logPurchase(
      amount: value,
      currency: currency,
    );
  }

  void onAdLoadedCallback(
    EnumAdsPlatform platform,
    EnumAdsType adsType,
    dynamic data,
  ) {
    DateTime curDateTime = DateTime.now();
    int curTime = curDateTime.millisecondsSinceEpoch;
    String adsId = "";
    double ecpm = 0;
    twLooog(
      "==onAdLoadedCallback===platform:$platform adsType:$adsType  curTime:${curDateTime}",
    );
    if (platform == EnumAdsPlatform.max) {
      if (data is MaxAd) {
        adsId = data.adUnitId;
        ecpm = data.revenue;
        // todo: 记得删除
        // ecpm = Random().nextDouble();
      }
      twLooog(
        "==onAdLoadedCallback===platform adsId max:$adsId data:${data.toString()}",
      );
    } else if (platform == EnumAdsPlatform.topon) {
      if (data is ATInterstitialResponse || data is ATRewardResponse) {
        adsId = data.placementID;
        var extraMap = data.extraMap;
        ecpm = extraMap['publisher_revenue'] ?? 0;
        twLooog(
          "==onAdLoadedCallback===platform adsId topon:$adsId data:${data.extraMap}",
        );
      }
    }
    cacheAdsData[adsId] = {
      GGCommonJson.k_ecpm: ecpm,
      "curTime": curTime,
      GGCommonJson.k_ad_type: adsType,
      GGCommonJson.k_platfrom: platform,
    };
    twLooog(
      "==onAdLoadedCallback===platform adsId:$adsId cacheAdsData:${cacheAdsData}  ===ecpm:$ecpm",
    );
    if (_hasFirstIntLoaded) {
      _hasFirstIntLoaded = false;
    }

    // PBMaiDian.cdyun_ad_return(
    //   ad_code_id: adsId,
    //   ad_format: adsType.name,
    //   ad_platform: platform.name,
    // );
  }

  // 加载失败
  void onAdLoadFailedCallback(
    EnumAdsPlatform platform,
    EnumAdsType adsType,
    dynamic data,
  ) {
    twLooog(
      "==onAdLoadFailedCallback===platform:$platform adsType:$adsType $cacheAdsData",
    );

    DateTime curDateTime = DateTime.now();
    int curTime = curDateTime.millisecondsSinceEpoch;
    String adsId = "------";
    twLooog(
      "==onAdLoadFailedCallback===platform:$platform adsType:$adsType  curTime:${curDateTime}",
    );
    twLooog("==onAdLoadFailedCallback===platform data:${data.toString()}");
    if (platform == EnumAdsPlatform.max) {
      if (data is String) {
        adsId = data;
      }
    } else if (platform == EnumAdsPlatform.topon) {
      if (data is ATInterstitialResponse || data is ATRewardResponse) {
        adsId = data.placementID;
        // var extraMap = data.extraMap;
        twLooog(
          "==onAdLoadFailedCallback===platform adsId:$adsId data:${data.extraMap}",
        );
      }
    }

    // cacheCompleter.forEach((key, value) {
    //   value.complete(false);
    // });
    // cacheCompleter.clear();
    twLooog("==onAdLoadFailedCallback===cacheCompleter:$cacheCompleter ");
    // 延迟2s加载
    Future.delayed(Duration(milliseconds: 2000), () {
      loadAdWithAdsId(adsType, adsId);
    });
  }

  void loadAdWithAdsId(EnumAdsType adsType, String adsId) {
    twLooog("=====loadAdWithAdsId EnumAdsType:$adsType  adsID:$adsId");

    TwAdsJsonModel? adsJsonModel;
    if (adsType == EnumAdsType.reward) {
      adsJsonModel ??= jiliAdsModel[adsId];
    } else {
      adsJsonModel = chapingAdsModel[adsId];
    }

    _loadAd(adsJsonModel);
  }

  // 播放失败
  void onAdDisplayFailedCallback(
    EnumAdsPlatform platform,
    EnumAdsType adsType,
    dynamic data,
  ) {
    twLooog(
      "==onAdDisplayFailedCallback===播放失败platform:$platform adsType:$adsType",
    );

    String adsId = "";

    if (platform == EnumAdsPlatform.max) {
      if (data is String) {
        adsId = data;
      }
    } else if (platform == EnumAdsPlatform.topon) {
      if (data is ATInterstitialResponse || data is ATRewardResponse) {
        adsId = data.placementID;
        // var extraMap = data.extraMap;
      }
    }
    twLooog("==onAdDisplayFailedCallback===platform adsId:$adsId");

    cacheCompleter.forEach((key, value) {
      value.complete(false);
    });
    cacheCompleter.clear();
    loadAdWithAdsId(adsType, adsId);
    if (_loadFailReason == null) {
      _loadFailReason = AdLoadFailReason.impfail;
    }
  }

  // 播放完成
  void onAdDisplayedCallback(
    EnumAdsPlatform platform,
    EnumAdsType adsType,
    dynamic data,
  ) {
    twLooog("==onAdDisplayedCallback===platform:$platform adsType:$adsType");
    // todo:
  }

  // 播放完成后关闭广告
  void onAdHiddenCallback(
    EnumAdsPlatform platform,
    EnumAdsType adsType,
    dynamic data,
  ) {
    twLooog("==onAdHiddenCallback===platform:$platform adsType:$adsType");
    if (adsType == EnumAdsType.reward) {
      TwFengkAds().ad_short_close();
      TwFengkAds().ad_short_show();
    }
    DateTime curDateTime = DateTime.now();
    int curTime = curDateTime.millisecondsSinceEpoch;
    String adsId = "------";
    twLooog(
      "==onAdHiddenCallback===platform:$platform adsType:$adsType  curTime:${curDateTime}",
    );
    bool result = true;
    if (platform == EnumAdsPlatform.max) {
      if (data is MaxAd) {
        adsId = data.adUnitId;
      }
    } else if (platform == EnumAdsPlatform.topon) {
      if (data is ATInterstitialResponse || data is ATRewardResponse) {
        adsId = data.placementID;
        var extraMap = data.extraMap;
      }
      if(adsType == EnumAdsType.reward){
        result = _hasRvRevenueReceived;
      }
    }

    var tmpCompleter = cacheCompleter[adsId];
    twLooog("==onAdHiddenCallback==result:$result=_hasRvRevenueReceived:$_hasRvRevenueReceived");
    tmpCompleter?.complete(result);
    cacheCompleter.remove(adsId);
    addAdEndCount();
    loadAdWithAdsId(adsType, adsId);
  }

  // 下发收益
  void onAdRevenuePaidCallback(
    EnumAdsPlatform platform,
    EnumAdsType adsType,
    dynamic data,
  ) {
    twLooog("==onAdRevenuePaidCallback===platform:$platform adsType:$adsType");

    DateTime curDateTime = DateTime.now();
    int curTime = curDateTime.millisecondsSinceEpoch;
    String adsId = "------";
    String networkName = "";
    double revenue = 0.0;
    String format = adsType.name;
    String adPosId = _curAdPosId;
    String currency = "USD";
    String source_client = platform.name;
    String precision_type = "";
    if (platform == EnumAdsPlatform.max) {
      if (data is MaxAd) {
        adsId = data.adUnitId;
        networkName = data.networkName;
        revenue = data.revenue;
        precision_type = data.revenuePrecision ?? "";
      }
    } else if (platform == EnumAdsPlatform.topon) {
      if (data is ATInterstitialResponse || data is ATRewardResponse) {
        adsId = data.placementID;
        var extraMap = data.extraMap;
        currency = extraMap['currency'] ?? "";
        twLooog("==onAdRevenuePaidCallback===¥extraMap：$extraMap");
        var tmprevenue = extraMap['publisher_revenue'] ?? 0.0;
        if (tmprevenue is num) {
          revenue = tmprevenue * 1.0;
        }
        networkName = extraMap['network_name']?.toString() ?? "";
        precision_type = extraMap['precision']?.toString() ?? "";
      }
    }
    rvRevenueReceivedTrue();
    twLooog(
      "==onAdRevenuePaidCallback===platform:$platform adsType:$adsType currency:$currency  revenue:${revenue}",
    );

    TwHttpDio().adEvent(
      networkName: networkName,
      adsId: adsId,
      format: format,
      adPosId: adPosId,
      currency: currency,
      revenue: revenue * 1000000,
      source_client: source_client,
      precision_type: precision_type,
    );
    logRevenue(
      network: networkName,
      value: revenue,
      source: platform,
      currency: currency,
    );

    // PBAfEvent.ad_impression_total(revenue);
  }

  _initListener() {
    _ggCommonAdsListener = TwComAdsListener(
      interstitialListener: InterstitialListener(
        onAdLoadedCallback: (ad) {
          twLooog(
            "插屏initializeInterstitialAds======onAdLoadedCallback tw_base/tw_ad:${ad.adUnitId}",
          );
          onAdLoadedCallback(EnumAdsPlatform.max, EnumAdsType.interstitial, ad);
        },
        onAdLoadFailedCallback: (adUnitId, error) {
          twLooog(
            "插屏initializeInterstitialAds======onAdLoadFailedCallback 加载失败  adUnitId:$adUnitId error:$error",
          );
          onAdLoadFailedCallback(
            EnumAdsPlatform.max,
            EnumAdsType.interstitial,
            adUnitId,
          );
        },
        onAdDisplayedCallback: (ad) {
          twLooog("插屏initializeInterstitialAds======onAdDisplayedCallback");
        },
        onAdDisplayFailedCallback: (ad, error) {
          twLooog(
            "插屏initializeInterstitialAds======onAdDisplayFailedCallback error:$error",
          );
          onAdDisplayFailedCallback(
            EnumAdsPlatform.max,
            EnumAdsType.interstitial,
            ad,
          );
        },
        onAdClickedCallback: (ad) {
          twLooog("插屏initializeInterstitialAds======onAdClickedCallback");
        },
        onAdHiddenCallback: (ad) {
          twLooog("插屏initializeInterstitialAds======onAdHiddenCallback");
          onAdHiddenCallback(EnumAdsPlatform.max, EnumAdsType.interstitial, ad);
        },
        onAdRevenuePaidCallback: (ad) {
          //todo: 广告事件
          onAdRevenuePaidCallback(
            EnumAdsPlatform.max,
            EnumAdsType.interstitial,
            ad,
          );
        },
      ),
      rewardedAdListener: RewardedAdListener(
        onAdLoadedCallback: (ad) {
          twLooog(
            "激励initializeRewardedAd======onAdLoadedCallback tw_base/tw_ad:${ad.adUnitId}",
          );
          onAdLoadedCallback(EnumAdsPlatform.max, EnumAdsType.reward, ad);
        },
        onAdLoadFailedCallback: (adUnitId, error) {
          //  网络加载失败
          twLooog(
            "激励initializeRewardedAd======onAdLoadFailedCallback 加载失败 adUnitId:$adUnitId error:$error",
          );
          onAdLoadFailedCallback(
            EnumAdsPlatform.max,
            EnumAdsType.reward,
            adUnitId,
          );
        },
        onAdDisplayedCallback: (ad) {
          twLooog("激励initializeRewardedAd======onAdDisplayedCallback");
          twLooog("onAdDisplayedCallback:${ad.placement}  ${ad.toString()}");
        },
        onAdDisplayFailedCallback: (ad, error) {
          twLooog("激励initializeRewardedAd======onAdDisplayFailedCallback");
          onAdDisplayFailedCallback(
            EnumAdsPlatform.max,
            EnumAdsType.reward,
            ad,
          );
        },
        onAdClickedCallback: (ad) {
          twLooog("激励initializeRewardedAd======onAdClickedCallback");
        },
        onAdHiddenCallback: (ad) {
          twLooog("激励initializeRewardedAd======onAdHiddenCallback");
          onAdHiddenCallback(EnumAdsPlatform.max, EnumAdsType.reward, ad);
        },
        onAdReceivedRewardCallback: (ad, reward) {
          twLooog("激励initializeRewardedAd======onAdReceivedRewardCallback");
        },
        onAdRevenuePaidCallback: (ad) {
          //todo: 广告事件
          twLooog("激励initializeRewardedAd======onAdRevenuePaidCallback");
          onAdRevenuePaidCallback(EnumAdsPlatform.max, EnumAdsType.reward, ad);
        },
      ),
      atRewardResponse: (ATRewardResponse value) {
        switch (value.rewardStatus) {
          //广告加载失败
          case RewardedStatus.rewardedVideoDidFailToLoad:
            twLooog(
              "=======topon激励====rewardedVideoDidFailToLoad ---- placementID: ${value.placementID} ---- errStr:${value.requestMessage}",
            );
            Future.delayed(Duration(seconds: 1), () {
              onAdLoadFailedCallback(
                EnumAdsPlatform.topon,
                EnumAdsType.reward,
                value,
              );
            });

            break;
          //广告加载成功
          case RewardedStatus.rewardedVideoDidFinishLoading:
            twLooog(
              "=======topon激励====rewardedVideoDidFinishLoading ---- placementID: ${value.placementID}",
            );
            onAdLoadedCallback(
              EnumAdsPlatform.topon,
              EnumAdsType.reward,
              value,
            );
            break;
          //广告开始播放
          case RewardedStatus.rewardedVideoDidStartPlaying:
            twLooog(
              "=======topon激励====rewardedVideoDidStartPlaying ---- placementID: ${value.placementID} ---- extra:${value.extraMap}",
            );
            onAdDisplayedCallback(
              EnumAdsPlatform.topon,
              EnumAdsType.reward,
              value,
            );
            break;
          //广告结束播放
          case RewardedStatus.rewardedVideoDidEndPlaying:
            twLooog(
              "=======topon激励====rewardedVideoDidEndPlaying ---- placementID: ${value.placementID} ---- extra:${value.extraMap}",
            );
            break;
          //广告播放失败
          case RewardedStatus.rewardedVideoDidFailToPlay:
            twLooog(
              "=======topon激励====rewardedVideoDidFailToPlay ---- placementID: ${value.placementID} ---- errStr:${value.extraMap}",
            );
            onAdDisplayFailedCallback(
              EnumAdsPlatform.topon,
              EnumAdsType.reward,
              value,
            );
            break;
          //激励成功，建议在此回调中下发奖励
          case RewardedStatus.rewardedVideoDidRewardSuccess:
            twLooog(
              "=======topon激励====rewardedVideoDidRewardSuccess ---- placementID: ${value.placementID} ---- extra:${value.extraMap}",
            );
            onAdRevenuePaidCallback(
              EnumAdsPlatform.topon,
              EnumAdsType.reward,
              value,
            );
            break;
          //广告被点击
          case RewardedStatus.rewardedVideoDidClick:
            twLooog(
              "=======topon激励====rewardedVideoDidClick ---- placementID: ${value.placementID} ---- extra:${value.extraMap}",
            );
            break;
          //Deeplink
          case RewardedStatus.rewardedVideoDidDeepLink:
            twLooog(
              "=======topon激励====rewardedVideoDidDeepLink ---- placementID: ${value.placementID} ---- extra:${value.extraMap} ---- isDeeplinkSuccess:${value.isDeeplinkSuccess}",
            );
            break;
          //广告被关闭
          case RewardedStatus.rewardedVideoDidClose:
            twLooog(
              "=======topon激励====rewardedVideoDidClose ---- placementID: ${value.placementID} ---- extra:${value.extraMap}",
            );
            onAdHiddenCallback(
              EnumAdsPlatform.topon,
              EnumAdsType.reward,
              value,
            );
            break;
          case RewardedStatus.rewardedVideoUnknown:
            twLooog("=======topon激励====rewardedVideoUnknown");
            break;

          default:
            break;
        }
      },
      atInterstitialResponse: (ATInterstitialResponse value) {
        switch (value.interstatus) {
          //广告加载失败
          case InterstitialStatus.interstitialAdFailToLoadAD:
            twLooog(
              "=======topon插屏====interstitialAdFailToLoadAD ---- placementID: ${value.placementID} ---- errStr:${value.requestMessage}",
            );
            Future.delayed(Duration(seconds: 1), () {
              onAdLoadFailedCallback(
                EnumAdsPlatform.topon,
                EnumAdsType.interstitial,
                value,
              );
            });
            break;
          //广告加载成功
          case InterstitialStatus.interstitialAdDidFinishLoading:
            twLooog(
              "=======topon插屏====interstitialAdDidFinishLoading ---- placementID: ${value.placementID}",
            );
            onAdLoadedCallback(
              EnumAdsPlatform.topon,
              EnumAdsType.interstitial,
              value,
            );
            break;
          //广告视频开始播放，部分平台有此回调
          case InterstitialStatus.interstitialAdDidStartPlaying:
            twLooog(
              "=======topon插屏====interstitialAdDidStartPlaying ---- placementID: ${value.placementID} ---- extra:${value.extraMap}",
            );
            break;
          //广告视频播放结束，部分广告平台有此回调
          case InterstitialStatus.interstitialAdDidEndPlaying:
            twLooog(
              "=======topon插屏====interstitialAdDidEndPlaying ---- placementID: ${value.placementID} ---- extra:${value.extraMap}",
            );
            break;
          //广告视频播放失败，部分广告平台有此回调
          case InterstitialStatus.interstitialDidFailToPlayVideo:
            twLooog(
              "=======topon插屏====interstitialDidFailToPlayVideo ---- placementID: ${value.placementID} ---- errStr:${value.requestMessage}",
            );
            onAdDisplayFailedCallback(
              EnumAdsPlatform.topon,
              EnumAdsType.interstitial,
              value,
            );
            break;
          //广告展示成功
          case InterstitialStatus.interstitialDidShowSucceed:
            twLooog(
              "=======topon插屏====interstitialDidShowSucceed ---- placementID: ${value.placementID} ---- extra:${value.extraMap}",
            );
            onAdRevenuePaidCallback(
              EnumAdsPlatform.topon,
              EnumAdsType.interstitial,
              value,
            );
            // onAdDisplayedCallback();
            break;
          //广告展示失败
          case InterstitialStatus.interstitialFailedToShow:
            twLooog(
              "=======topon插屏====interstitialFailedToShow ---- placementID: ${value.placementID} ---- errStr:${value.requestMessage}",
            );
            break;
          //广告被点击
          case InterstitialStatus.interstitialAdDidClick:
            twLooog(
              "=======topon插屏====interstitialAdDidClick ---- placementID: ${value.placementID} ---- extra:${value.extraMap}",
            );
            break;
          //Deeplink
          case InterstitialStatus.interstitialAdDidDeepLink:
            twLooog(
              "=======topon插屏====interstitialAdDidDeepLink ---- placementID: ${value.placementID} ---- extra:${value.extraMap}",
            );
            break;
          //广告被关闭
          case InterstitialStatus.interstitialAdDidClose:
            twLooog(
              "=======topon插屏====interstitialAdDidClose ---- placementID: ${value.placementID} ---- extra:${value.extraMap}",
            );
            onAdHiddenCallback(
              EnumAdsPlatform.topon,
              EnumAdsType.interstitial,
              value,
            );
            break;

          case InterstitialStatus.interstitialUnknown:
            twLooog("=======topon插屏====interstitialUnknown");
            break;
        }
      },
    );
  }

  init() async {
    twLooog("====init==_initListener");
    _initListener();
    twLooog("====init==firebaseJson");
    firebaseJson = _onlineJson();

    _interstitialAdsModel();
    twLooog("====init=hashCode:${hashCode}=_interstitialData:$chapingAdsModel");

    _rewardAdsModel();
    twLooog("====init=hashCode:${hashCode}=_rewardData:$jiliAdsModel");


    twLooog("====init==PbUuuump start");
    await TwUmpppp().init();
    twLooog("====init==PbUuuump end");
    twLooog("====init==initMax");
    bool result = await TwMaxAd.initMax(
      encodeKey: GGCommonJson.maxkeyEncode,
      cacheAdsData: cacheAdsData,
      interstitialListener: _ggCommonAdsListener!.interstitialListener,
      rewardedAdListener: _ggCommonAdsListener!.rewardedAdListener,
    );
    if (!result) {
      _loadFailReason = AdLoadFailReason.uninitialized;
    }
    twLooog("====init==initTopon");
    await InitManger.initTopon(
      atInterstitialResponse: _ggCommonAdsListener!.atInterstitialResponse,
      atRewardResponse: _ggCommonAdsListener!.atRewardResponse,
    );
    // InitManger.setLogEnabled();
    twLooog("====init==end");
    _scheme =
        firebaseJson[GGCommonJson.k_which_scheme] ?? GGCommonJson.scheme_A;

    chapingAdsModel.forEach((key, value) {
      _loadAd(value);
    });
    jiliAdsModel.forEach((key, value) {
      _loadAd(value);
    });
    // 执行A方案
    if (_scheme == GGCommonJson.scheme_A) {
    }
    // 执行B方案
    else {
      jiliAdsModel.addAll(chapingAdsModel);
    }
    twLooog("====init==end:$jiliAdsModel");
  }

  _loadAd(TwAdsJsonModel? tuple4) {
    twLooog("==_loadAd===tuple4:$tuple4=");
    if (tuple4 == null) {
      return;
    }
    String adsId = tuple4.adsId ?? "";
    String platform = tuple4.adsPlatform ?? "";
    String adsType = tuple4.adsType ?? "";
    if (platform == GGCommonJson.ad_platfrom_max) {
      if (adsType == GGCommonJson.ad_type_int) {
        twLooog("=$platform=_loadAd===插屏loadInterstitial:$tuple4=");
        TwMaxAd.loadInterstitial(adsId);
      } else if (adsType == GGCommonJson.ad_type_rv) {
        twLooog("=$platform=_loadAd===激励loadRewardedAd:$tuple4=");
        TwMaxAd.loadRewardedAd(adsId);
      }
    } else if (platform == GGCommonJson.ad_platfrom_topon) {
      if (adsType == GGCommonJson.ad_type_int) {
        twLooog("=$platform=_loadAd===插屏loadInterstitialAd:$tuple4=");
        InitManger.loadInterstitialAd(placementId: adsId);
      } else if (adsType == GGCommonJson.ad_type_rv) {
        twLooog("=$platform=_loadAd===激励loadRewardedVideo:$tuple4=");
        InitManger.loadRewardedVideo(placementId: adsId);
      }
    }

    // PBMaiDian.ad_request(
    //   ad_code_id: adsId,
    //   ad_format: adsType,
    //   ad_platform: platform,
    // );
  }

  // adPosId 场景
  showInterstitialAd({
    required String adPosId,
    bool ignored_hasDisplayAd = false, // 是否忽略_hasDisplayAd的 判断 false不忽略 true 忽略
    bool canTryAgain = true, // 是否可以再次尝试加载广告
  }) async {
    // return true;

    bool result = await _showAdLogic(
      adPosId: adPosId,
      adIdWithJsonModel: chapingAdsModel,
      curAdTypeIds: _interstitialAdsId(),
      adsType: EnumAdsType.interstitial,
      ignored_hasDisplayAd: ignored_hasDisplayAd,
      canTryAgain: canTryAgain,
    );

    return result;
  }

  Future<Tuple2> _hasReady(TwAdsJsonModel? rvOne) async {
    twLooog("======_hasReady==Tuple4:$rvOne=");
    if (rvOne == null) {
      return Tuple2(false, "");
    }
    bool isReady = false;
    String adsId = rvOne.adsId;

    String platform = rvOne.adsPlatform;
    String adsType = rvOne.adsType;
    if (platform == GGCommonJson.ad_platfrom_max) {
      if (adsType == GGCommonJson.ad_type_int) {
        isReady = await TwMaxAd.hasInterstitialReady(adsId: adsId);
      } else if (adsType == GGCommonJson.ad_type_rv) {
        isReady = await TwMaxAd.hasRewardedAdReady(adsId: adsId);
      }
    } else if (platform == GGCommonJson.ad_platfrom_topon) {
      if (adsType == GGCommonJson.ad_type_int) {
        isReady = await InitManger.hasInterAdReady(placementId: adsId);
      } else if (adsType == GGCommonJson.ad_type_rv) {
        isReady = await InitManger.hasRewardAdReady(placementId: adsId);
      }
    }
    twLooog("======_hasReady==isReady:$isReady=");
    return Tuple2(isReady, adsId);
  }

  _showAd(TwAdsJsonModel? tuple4) {
    twLooog("=====_showAd===tuple4:$tuple4");
    if (tuple4 == null) {
      return;
    }
    String adsId = tuple4.adsId;
    String platform = tuple4.adsPlatform;
    String adType = tuple4.adsType;
    if (platform == GGCommonJson.ad_platfrom_max) {
      if (adType == GGCommonJson.ad_type_int) {
        TwMaxAd.showInterstitial(adsId: adsId);
      } else {
        TwMaxAd.showRewardedAd(adsId: adsId);
      }
    } else if (platform == GGCommonJson.ad_platfrom_topon) {
      if (adType == GGCommonJson.ad_type_int) {
        InitManger.showInterAd(placementId: adsId);
      } else {
        InitManger.showRewardAd(placementId: adsId);
      }
    }
  }

  AdLoadFailReason? _loadFailReason;

  Future<bool> _showAdLogic({
    required String adPosId,
    required Map<String, TwAdsJsonModel> adIdWithJsonModel,
    required List<String> curAdTypeIds,
    required EnumAdsType adsType,
    Completer<bool>? outCompleter,
    int count = 0,
    bool ignored_hasDisplayAd = false,
    bool canTryAgain = true,
  }) async {
    bool hasInter = adsType == EnumAdsType.interstitial;
    String text = hasInter ? "插屏" : "激励";
    twLooog(
      "$text=========_hasDisplayAd:$_hasDisplayAd  count:$count hashCode:$hashCode",
    );
    bool showFkDanger = hasInter
        ? TwFengkAds().showDangerWidthInter()
        : TwFengkAds().showDangerWidthRv();
    twLooog("$text========fengkong=showFkDanger:$showFkDanger");
    resetRvRevenueReceived();
    if (showFkDanger) {
      resetDisplayAd();
      // todo:
      twToast(text: "Something went wrong,Please try later");
      if (outCompleter != null) {
        outCompleter.complete(false);
      }
      return false;
    }
    twLooog(
      "$text=====ignored_hasDisplayAd:$ignored_hasDisplayAd====_hasDisplayAd:$_hasDisplayAd",
    );
    if (!ignored_hasDisplayAd) {
      if (_hasDisplayAd) {
        return false;
      }
    }
    if (_loadFailReason == AdLoadFailReason.uninitialized) {
      _loadFailReason = AdLoadFailReason.uninitialized;
    } else {
      _loadFailReason = null;
    }
    _hasDisplayAd = true;
    _curAdPosId = adPosId;

    // PBMaiDian.cdyun_ad_chance(veinKeyValue: adPosId);
    Completer<bool> completer = Completer();

    if (outCompleter != null) {
      completer = outCompleter;
    }

    bool isReady = false;
    TwAdsJsonModel? tupe4;
    String? firstRequestAdsId;
    twLooog(
      "$text=======adPosId:$adPosId _scheme:$_scheme adsModel:$adIdWithJsonModel",
    );
    if (_scheme == GGCommonJson.scheme_A) {
      for (var action in adIdWithJsonModel.keys) {
        String adsId = action;
        // 记录第一个广告id情况
        if (firstRequestAdsId == null) {
          // 是否有缓存
          bool hasCaches = cacheAdsData.keys.contains(adsId);
          if (!hasCaches) {
            _loadFailReason ??= AdLoadFailReason.ad_nocache;
          }
        }

        TwAdsJsonModel? adsJsonModel = adIdWithJsonModel[adsId];
        Tuple2 rvOne1 = await _hasReady(adsJsonModel);
        isReady = rvOne1.item1;
        twLooog(
          "$text=======isReady:$isReady adsId:$adsId adsJsonModel:$adsJsonModel",
        );
        if (isReady) {
          tupe4 = adsJsonModel;
          break;
        } else {
          //   广告未准备好
          if (firstRequestAdsId == null) {
            _loadFailReason ??= AdLoadFailReason.notPrepared;
          }
          _loadAd(adsJsonModel);
        }

        firstRequestAdsId ??= adsId;
      }

      twLooog("$text=======isReady:$isReady curTuple4:${tupe4?.toString()}");
    } else {
      // 执行B方案

      twLooog(
        "$text======= 执行B方案 length:${cacheAdsData.length} cacheAdsData:$cacheAdsData",
      );
      var tmpAdsId = null;
      var data = null;
      List<String> rewardAdsId = curAdTypeIds;
      twLooog("$text======里面是否含有==：$rewardAdsId");
      cacheAdsData.forEach((key, value) {
        bool result = rewardAdsId.contains(key);
        twLooog("$text=====cacheAdsData=里面是否含有=result:$result=adsId：$key");
        if (result) {
          if (data == null) {
            tmpAdsId = key;
            data = value;
          } else {
            double curEcpm = value[GGCommonJson.k_ecpm] ?? 0;
            double maxEcpm = data[GGCommonJson.k_ecpm] ?? 0;
            if (curEcpm > maxEcpm) {
              tmpAdsId = key;
              data = value;
            }
          }
        }
      });
      twLooog("$text======= tmpAdsId:$tmpAdsId data:$data");
      if (tmpAdsId != null && data != null) {
        isReady = true;
        String adsId = tmpAdsId;
        tupe4 = adIdWithJsonModel[adsId];
        Tuple2 rvOne2 = await _hasReady(tupe4);
        isReady = rvOne2.item1;
        if (!isReady) {
          firstRequestAdsId ??= adsId;
          _loadFailReason ??= AdLoadFailReason.notPrepared;
          _loadAd(tupe4);
        }
      } else {
        if (curAdTypeIds.isNotEmpty) {
          firstRequestAdsId ??= curAdTypeIds[0];
          _loadFailReason ??= AdLoadFailReason.ad_nocache;
        }
      }
    }
    if (isReady && tupe4 != null) {
      twLooog("$text=======调用显示广告 成功");
      String adsId = tupe4.adsId ?? "";
      cacheCompleter[adsId] = completer;
      _showAd(tupe4);
    } else {
      twLooog("$text=======调用显示广告 失败count:$count canTryAgain:$canTryAgain");
      resetDisplayAd();
      if (count < 1 && canTryAgain) {
        TwAdsTips.noAds(
          onTryAgain: () async {
            resetDisplayAd();
            adIdWithJsonModel.forEach((key, value) {
              _loadAd(value);
            });

            Get.context?.loaderOverlay.show();
            await Future.delayed(Duration(seconds: 3));
            int tmpCount = count + 1;
            Get.context?.loaderOverlay.hide();
            _showAdLogic(
              adPosId: adPosId,
              adIdWithJsonModel: adIdWithJsonModel,
              curAdTypeIds: curAdTypeIds,
              adsType: adsType,
              outCompleter: completer,
              count: tmpCount,
            );
          },

          onClose: () {
            completer.complete(false);
            cacheCompleter.clear();
          },
        );
      } else {
        TwAdsTips.toast();
        resetDisplayAd();
        completer.complete(false);
      }
    }

    bool result = await completer.future;

    if (!result) {
      // GGEventReport.glgns_ad_impression_fail(veinKeyValue: adPosId);
      // GGAdsTips.noAds();

      if (firstRequestAdsId != null) {
        TwAdsJsonModel? adsJsonModel = adIdWithJsonModel[firstRequestAdsId];
        String? ad_platform = adsJsonModel?.adsPlatform;
        twLooog(
          "$text=====回调成功 显示广告 失败：adid:$firstRequestAdsId reason:$_loadFailReason ad_platform:$ad_platform",
        );
        _loadFailReason ??= AdLoadFailReason.notPrepared;
        if (ad_platform != null) {
          // PBMaiDian.cdyun_ad_impression_fail(
          //   ad_pos_id: firstRequestAdsId,
          //   reason: _loadFailReason!.name,
          //   ad_platform: ad_platform,
          // );
        }
      }
    }

    TwAdsJsonModel? adsJsonModel = adIdWithJsonModel[firstRequestAdsId];
    String? ad_platform222 = adsJsonModel?.adsPlatform;
    if (ad_platform222 == null ||
        ad_platform222 == EnumAdsPlatform.topon.name) {

    }
    await Future.delayed(Duration(milliseconds: 100));
    resetDisplayAd();
    twLooog(
      "$text=====回调成功 result：$result ad_platform222:$ad_platform222 firstRequestAdsId:$firstRequestAdsId",
    );
    return result;
  }

  // adPosId 场景
  // count >= 1 时候不再请求展示
  showRewardAd({
    required String adPosId,
    EnumGetScene? scene,
    bool ignored_hasDisplayAd = false,
  }) async {
    // return true;

    bool result = await _showAdLogic(
      adPosId: adPosId,
      adIdWithJsonModel: jiliAdsModel,
      curAdTypeIds: _rewardAdsId(),
      adsType: EnumAdsType.reward,
      ignored_hasDisplayAd: ignored_hasDisplayAd,
    );

    return result;
  }

  _onlineJson() {
    Map<String, dynamic> localJson = GGCommonJson.local;
    try {
      String name = "cdyun_ad_config";
      String key = TwFirebasssss().by(name: name);
      twLooog(
        "====common_ads=== _onlineJson FirebaseUtils: $name string:$key test===",
      );

      Map<String, dynamic> json = jsonDecode(key);
      localJson = json;
      twLooog("FirebaseUtils: $name json $json");
    } on Exception catch (e) {
      twLooog("onlineJson:$e");
    }

    localJson = GGCommonJson.changeLocal(localJson);
    twLooog("FirebaseUtils: final json ${jsonEncode(localJson)}");
    return localJson;
  }

  // key: adsId value:AdsJsonModel
  Map<String, TwAdsJsonModel> chapingAdsModel = {};

  // key: adsId value:AdsJsonModel
  Map<String, TwAdsJsonModel> jiliAdsModel = {};

  _interstitialAdsModel() {
    var data = firebaseJson[GGCommonJson.k_out_int];
    if (data is List && data.isNotEmpty) {
      for (var element in data) {
        TwAdsJsonModel adsJsonModel = _initAdsJsonModel(element);
        String adsId = adsJsonModel.adsId ?? "";

        chapingAdsModel[adsId] = adsJsonModel;
      }

      return;
    }
  }

  _rewardAdsModel() {
    var data = firebaseJson[GGCommonJson.k_out_rv];
    if (data is List && data.isNotEmpty) {
      for (var element in data) {
        TwAdsJsonModel adsJsonModel = _initAdsJsonModel(element);
        String adsId = adsJsonModel.adsId ?? "";

        jiliAdsModel[adsId] = adsJsonModel;
      }

      return;
    }
  }

  TwAdsJsonModel _initAdsJsonModel(Map<String, dynamic> json) {
    // var ad_id = json[GGCommonJson.k_ads_id];
    // var ad_platform = json[GGCommonJson.k_platfrom];
    // var time_out = json[GGCommonJson.k_time_out];
    // var ad_type = json[GGCommonJson.k_ad_type];

    return TwAdsJsonModel.fromJson(json);
  }
}

enum AdLoadFailReason {
  ad_nocache, //表示无广告缓存
  nonetwork, //无网络
  impfail, //展示失败（可能突然死机、卡顿、崩溃或其他问题导致展示失败）
  uninitialized, //未初始化广告SDK
  notPrepared, //广告未准备好
  unknown,
}
