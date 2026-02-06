import 'package:adjust_sdk/adjust.dart';
import 'package:adjust_sdk/adjust_ad_revenue.dart';
import 'package:adjust_sdk/adjust_attribution.dart';
import 'package:adjust_sdk/adjust_config.dart';
import 'package:c143/tw_base/tw_http/event_report.dart';
import 'package:flutter_tba_info/flutter_tba_info.dart';
import 'package:c143/tw_base/tw_ad/base_config.dart';
import 'package:c143/tw_base/tw_ad/guiyin/package.dart';
import 'package:c143/tw_base/tw_gj/logC143.dart';


class TwAdjusssC143 {
  static const String TGA = "TwAdjustC143";
  static final TwAdjusssC143 _instance = TwAdjusssC143._();

  factory TwAdjusssC143() {
    return _instance;
  }

  TwAdjusssC143._();

  AdjustConfig? adjustConfig() => _config;

  AdjustConfig? _config;

  initSdk(String appToken) async {
    // 在进行测试时，应当确保将环境设置为 AdjustEnvironment.sandbox 。请在向应用商店提交应用前将此设为 AdjustEnvironment.production。
    AdjustConfig config = AdjustConfig(appToken, AdjustEnvironment.production);
    config.logLevel = AdjustLogLevel.verbose;
    var distinct_id = await FlutterTbaInfo.instance.getDistinctId();
    // config.externalDeviceId =distinct_id;
    twLooog("$TGA===initSdk=$appToken");
    _config = config;
    Adjust.addGlobalCallbackParameter("customer_user_id", distinct_id);
    config.attributionCallback = (AdjustAttribution attributionChangedData) {
      twLooog('$TGA: Attribution changed!');

      if (attributionChangedData.trackerToken != null) {
        twLooog(
          '$TGA: Tracker token: ${attributionChangedData!.trackerToken ?? ""}',
        );
      }
      if (attributionChangedData.trackerName != null) {
        twLooog('$TGA: Tracker name: ${attributionChangedData.trackerName}');
      }
      if (attributionChangedData.campaign != null) {
        twLooog('$TGA: Campaign: ${attributionChangedData.campaign}');
      }
      String? network = attributionChangedData.network;
      if (network != null) {
        twLooog('$TGA: Network: ${network}');
        TwMaiDiannnn.natural_user(network);

      }
      if (attributionChangedData.creative != null) {
        twLooog('$TGA: Creative: ${attributionChangedData.creative}');
      }
      if (attributionChangedData.adgroup != null) {
        twLooog('$TGA: Adgroup: ${attributionChangedData.adgroup}');
      }
      if (attributionChangedData.clickLabel != null) {
        twLooog('$TGA: Click label: ${attributionChangedData.clickLabel}');
      }
      if (attributionChangedData.fbInstallReferrer != null) {
        twLooog(
          '$TGA: facebook install referrer: ${attributionChangedData.fbInstallReferrer}',
        );
      }
      if (attributionChangedData.jsonResponse != null) {
        twLooog('$TGA: JSON Response: ${attributionChangedData.jsonResponse}');
      }
    };

    Adjust.initSdk(config,);

    TwMaiDiannnn.af_req();
    Adjust.getAttribution().then((attributionChangedData){
      String? network = attributionChangedData.network;
      twLooog("$TGA====network:$network");
      TwPackageABC143().guiyin(network??"");

    });
    // JCShijianBaogao.adjust_req();



  }

  adjustRevenue({
    required final String network,
    required final String currency,
    required final double value,
    required final EnumAdsPlatform source,
  }) {
    String adSource = "applovin_max_sdk";

    if (source == EnumAdsPlatform.max) {
      adSource = "applovin_max_sdk";
    } else if (source == EnumAdsPlatform.topon) {
      adSource = "topon_sdk";
    }

    AdjustAdRevenue adjustAdRevenue = AdjustAdRevenue(adSource);
    adjustAdRevenue.setRevenue(value, currency);
    adjustAdRevenue.adRevenueNetwork = network;
    Adjust.trackAdRevenue(adjustAdRevenue);
  }
}