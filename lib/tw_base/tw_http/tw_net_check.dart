// 🛠️ modified by obfuscator tool at 2025-07-09 11:08:44.317805
import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import 'package:c143/tw_hive/twhive.dart';
import 'package:c143/tw_base/tw_ad/base_config.dart';
import 'package:c143/tw_base/tw_ad/dialooooo/mei_wang.dart';
import 'package:c143/tw_base/tw_gj/loggggg.dart';



TwNetCheckkkk ssNetChecccc = TwNetCheckkkk();

class TwNetCheckkkk {
  StreamSubscription<List<ConnectivityResult>>? _subscription;

  report() {
    _report_no_internet_popup();
    // _report_no_internet_ack();
    // _report_no_internet_close();
  }

  init() {
    _subscription = Connectivity().onConnectivityChanged.listen((
      List<ConnectivityResult> connectivityResult,
    ) async {
      // This condition is for demo purposes only to explain every connection type.
      // Use conditions which work for your requirements.
      if (connectivityResult.contains(ConnectivityResult.mobile)) {
        // Mobile network available.

        bool result = await isOnline();
        if (result) {
          report();
        }
        print("移动网络连接 result:$result");
      } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
        // Wi-fi is available.
        // Note for Android:
        // When both mobile and Wi-Fi are turned on system will return Wi-Fi only as active network type
        bool result = await isOnline();
        if (result) {
          report();
        }
        print("📡 WiFi 网络连接 result:$result");
      } else if (connectivityResult.contains(ConnectivityResult.ethernet)) {
        // Ethernet connection available.
      } else if (connectivityResult.contains(ConnectivityResult.vpn)) {
        // Vpn connection active.
        // Note for iOS and macOS:
        // There is no separate network interface type for [vpn].
        // It returns [other] on any device (also simulator)
      } else if (connectivityResult.contains(ConnectivityResult.bluetooth)) {
        // Bluetooth connection available.
      } else if (connectivityResult.contains(ConnectivityResult.other)) {
        // Connected to a network which is not in the above mentioned networks.
      } else if (connectivityResult.contains(ConnectivityResult.none)) {
        // No available network types
        print("没有网络连接");
        if (Get.context != null) {
          showMeiwangDialog(Get.context!, onBtn: () {}, onClose: () {});
          recordCountPop(EnumGetScene.unknow);
        }
      }

      // if (result == ConnectivityResult.none) {
      //   print("🚫 没有网络连接");
      // } else if (result == ConnectivityResult.mobile) {
      //   print("📶 移动网络连接");
      // } else if (result == ConnectivityResult.wifi) {
      //   print("📡 WiFi 网络连接");
      // }   // Received changes in available connectivity types!
    });
  }

  Future<bool> isOnline() async {
    try {
      final result2 = await InternetAddress.lookup('www.google.com');
      bool net2 = result2.isNotEmpty && result2[0].rawAddress.isNotEmpty;
      final result = await InternetAddress.lookup('www.youtube.com');

      bool net = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
      print("ping youtube tw_base/tw_http:$net ;ping google tw_base/tw_http:$net2");
      return net || net2;
    } catch (_) {
      return false;
    }
  }

  dispose() {
    _subscription?.cancel();
  }
}

const h_no_network_pop = "iohshkahklakl";
const h_no_network_pop_ack = "nfgkdsfehkjdsf";
const h_no_network_pop_close = "iasdf35asf";

void _record(String key, EnumGetScene scene) {
  try {
    var dataScene = TwHive.box.get(key) ?? {};
    String name = scene.name;
    dataScene[name] = name;
    TwHive.box.put(key, dataScene);
  } catch (e) {
    twLooog("==_record==error:$e");
  }
}

void recordCountPop(EnumGetScene scene) {
  _record(h_no_network_pop, scene);
}

void recordCountAck(EnumGetScene scene) {
  _record(h_no_network_pop_ack, scene);
}

void recordCountClose(EnumGetScene scene) {
  _record(h_no_network_pop_close, scene);
}

_report_no_internet_popup() {
  String key = h_no_network_pop;
  var dataScene = TwHive.box.get(key) ?? {};
  if (dataScene is Map) {
    dataScene.forEach((key, value) {
      // PBMaiDian.no_network_pop();
      // GGEventReport.no_internet_popup(veinKeyValue: "$key");
    });
  }
  TwHive.box.put(key, null);
}

_report_no_internet_ack() {
  String key = h_no_network_pop_ack;
  var dataScene = TwHive.box.get(key) ?? {};
  if (dataScene is Map) {
    dataScene.forEach((key, value) {
      // GGEventReport.no_internet_ack(veinKeyValue: "$key");
    });
  }
  TwHive.box.put(key, null);
}

_report_no_internet_close() {
  String key = h_no_network_pop_close;
  var dataScene = TwHive.box.get(key) ?? {};
  if (dataScene is Map) {
    dataScene.forEach((key, value) {
      // GGEventReport.no_internet_close(veinKeyValue: "$key");
    });
  }
  TwHive.box.put(key, null);
}
