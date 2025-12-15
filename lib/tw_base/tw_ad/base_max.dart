import 'dart:async';

import 'package:applovin_max/applovin_max.dart';
import 'package:flutter/cupertino.dart';
import 'package:c143/tw_base/tw_gj/base_utils.dart';
import 'package:c143/tw_base/tw_gj/loggggg.dart';




class TwMaxAd {
  static final TwMaxAd _instance = TwMaxAd._();

  TwMaxAd._();

  factory TwMaxAd() {
    return _instance;
  }

  static final Map<String, Completer> _map = {};
  static Map<dynamic, dynamic> _cacheAdsData = {};

  static Future<bool> initMax({
    required String encodeKey,
    required Map<dynamic, dynamic> cacheAdsData,
    InterstitialListener? interstitialListener,
    RewardedAdListener? rewardedAdListener
  }) async {
    // _cacheAdsData = cacheAdsData;

    String asdfasfdmaxkey = TwBaseUtils.decrypt(encodeKey,117);
    twLooog("====GGMaxAdsNew=initMax====maxkey:$asdfasfdmaxkey");
    // AppLovinMAX.setVerboseLogging(true);
    MaxConfiguration? configuration = await AppLovinMAX.initialize(asdfasfdmaxkey);
    if (configuration == null) {
      twLooog('======GGMaxAdsNew initMax failed to initialize.');
      return false;
    } else {
      twLooog(
        '=======GGMaxAdsNew initMax Initialized in ${configuration.toString()}',
      );

      // Optionally preload widget-based banner and MREC ads. Comment out if preloading isn't needed.
      initInterstitialAds(interstitialListener);
      initializeRewardedAd(rewardedAdListener);
      return true;
    }
  }

  // 插屏
  static initInterstitialAds(InterstitialListener? interstitialListener) {
    twLooog("插屏initializeInterstitialAds======");

    AppLovinMAX.setInterstitialListener(interstitialListener);

    return;

  }

  static loadInterstitial(String adsId) {
    // _cacheAdsData[adsId] =
    twLooog("插屏===GGMaxAdsNew=loadInterstitial===adsId:$adsId");
    AppLovinMAX.loadInterstitial(adsId);
  }

  static Future showInterstitial({required String adsId}) async {
    AppLovinMAX.showInterstitial(adsId);
  }

  static Future<bool> hasInterstitialReady({required String adsId}) async {
    bool isReady = (await AppLovinMAX.isInterstitialReady(adsId))!;
    twLooog(
      "激励======isInterstitialReady:$isReady adsId: $adsId",
    );
    return isReady;
  }


  static  initializeRewardedAd( RewardedAdListener? rewardedAdListener) {
    twLooog("激励initializeRewardedAd======");
    AppLovinMAX.setRewardedAdListener(rewardedAdListener);
    return;
  }

  static loadRewardedAd(String adsId) {
    twLooog("激励===GGMaxAdsNew=loadRewardedAd===adsId:$adsId");
    AppLovinMAX.loadRewardedAd(adsId);
  }
  static  showRewardedAd({required String adsId}) async {
    AppLovinMAX.showRewardedAd(adsId, );
  }
  static Future<bool> hasRewardedAdReady({required String adsId}) async {
    bool isReady = (await AppLovinMAX.isRewardedAdReady(adsId))!;
    twLooog(
      "激励======isRewardedAdReady:$isReady adsId: $adsId",
    );
    return isReady;
  }

}