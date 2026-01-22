import 'package:c143/tw_base/tw_ad/guiyin/package.dart';
import 'package:c143/tw_base/tw_configgg/config.dart';
import 'package:c143/tw_base/tw_gj/logC143.dart';
import 'package:c143/tw_base/tw_http/http_dioC143.dart';
import 'package:dio/dio.dart';
import 'package:flutter_tba_info/flutter_tba_info.dart';

class AndroidH5C143 {
  static dynamic _map = {};

  //{
  //     "card": "https://xxxxxxxx.com", // 落地页地址
  //     "effort": { // 素材图片对象
  //             "invite": "https://www.xxx.com/card/5.webp" // 图片地址
  //     },
  //     "presiden": { // 事件追踪对象
  //           // 当用户点击这个广告时且此链接不为空时，访问此链接
  //           "card": "https://t.aa.b/api/secretar?champion=1940721348536315905&result=distinct_id123123123&east=b07bdcec-b686-45b2-af1a-e9f5083efb6d&attentio=1&practice=1751611442243&event_name=click&kind=70656e084fe18242c23827eaf9ba223a23a764803e75a3aaeb736d6a881c68dd",
  //           // 当展示这个广告时且此链接不为空时，访问此链接
  //           "chapter": "https://t.aa.b/api/secretar?champion=1940721348536315905&result=distinct_id123123123&east=b07bdcec-b686-45b2-af1a-e9f5083efb6d&attentio=1&practice=1751611442243&event_name=imp&kind=70656e084fe18242c23827eaf9ba223a23a764803e75a3aaeb736d6a881c68dd"
  //       }
  // }
  static init() async {
    String url = TwConfigggg.hasDeeevv()
        ? "https://4bqo.treeworldgardener.com"
        : "https://c4a3d.treeworldgardener.com";
    String path = "/api/poem";
    twLooog("=AndroidH5C143===init=");
    Options tmpOptions = await _headerOptions();
    var data = await TwHttpDio().get(
      path,
      options: tmpOptions,
      queryParameters: {"apartmen": "150cdcc0b2074c249f6a042dd8f6afad"},
      // retries: 1,
      dio: Dio(
        BaseOptions(
          baseUrl: url,
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
          sendTimeout: const Duration(seconds: 30),
        ),
      ),
    );
    bool hasMap = data is Map;
    twLooog("===AndroidH5C143===init hasMap:$hasMap data:$data");
    if (hasMap) {
      _map = data;

      String img = h5Img();
      String chapter = h5ImgShow();
      twLooog("===AndroidH5C143===init img:$img chapter:$chapter");
      if (img.isNotEmpty && chapter.isNotEmpty) {
         TwHttpDio().get(
          chapter,
          options: tmpOptions,
          dio: Dio(
            BaseOptions(
              baseUrl: url,
              connectTimeout: const Duration(seconds: 30),
              receiveTimeout: const Duration(seconds: 30),
              sendTimeout: const Duration(seconds: 30),
            ),
          ),
        );
        twLooog("===AndroidH5C143===init chapter data:");
      }
    }
  }

  static Future<Options> _headerOptions() async {
    var gaid = await FlutterTbaInfo.instance.getGaid();
    var os_country = await FlutterTbaInfo.instance.getOsCountry();
    var network_type = await FlutterTbaInfo.instance.getNetworkType();
    var distinct_id = await FlutterTbaInfo.instance.getDistinctId();
    Options tmpOptions = Options()
      ..headers = {
        "tool": "com.treeworld.gardener",
        "war": distinct_id,
        "boot": gaid,
        "theme": os_country,
        "scale": network_type.toLowerCase() == "wifi" ? "1" : "0",
        "poet": "7",
      };
    return tmpOptions;
  }

  static String h5Link() {
    return _map?["card"]?.toString() ?? "";
  }

  static String h5Img() {
    return _map?["effort"]?['invite']?.toString() ?? "";
  }

  static String h5ImgShow() {
    return _map?["presiden"]?['chapter']?.toString() ?? "";
  }

  static h5LinkClickCard() async {
    String url = _map?["presiden"]?['card']?.toString() ?? "";
    Options tmpOptions = await _headerOptions();
    var tmpData = await TwHttpDio().get(
      url,
      options: tmpOptions,
      dio: Dio(
        BaseOptions(
          baseUrl: url,
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
          sendTimeout: const Duration(seconds: 30),
        ),
      ),
    );
    twLooog("===AndroidH5C143===h5LinkClickCard card:$url tmpData:$tmpData");
  }
}
