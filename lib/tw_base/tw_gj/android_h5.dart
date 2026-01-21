import 'package:c143/tw_base/tw_ad/guiyin/package.dart';
import 'package:c143/tw_base/tw_configgg/config.dart';
import 'package:c143/tw_base/tw_gj/logC143.dart';
import 'package:c143/tw_base/tw_http/http_dioC143.dart';
import 'package:dio/dio.dart';
import 'package:flutter_tba_info/flutter_tba_info.dart';

class AndroidH5C143 {
  static init() async {
    String url = TwConfigggg.hasDeeevv()
        ? "https://ivfv.treeworldgardener.com"
        : "https://c4a3d.treeworldgardener.com";
    String path = "$url/api/poem";
    twLooog("=AndroidH5C143===init=");
    var gaid = await FlutterTbaInfo.instance.getGaid();
    var os_country = await FlutterTbaInfo.instance.getOsCountry();
    var network_type = await FlutterTbaInfo.instance.getNetworkType();
    var distinct_id = await FlutterTbaInfo.instance.getDistinctId();
    var data = await TwHttpDio().get(
      path,
      options: Options()..headers={
        "tool":"com.treeworld.gardener",
        "war":distinct_id,
        "boot":gaid,
        "theme":os_country,
        "scale":network_type,
        "poet":"7",
      },
      queryParameters: {"apartmen": "150cdcc0b2074c249f6a042dd8f6afad",

      },
    );

    twLooog("===AndroidH5C143===init data:$data");
  }
}
