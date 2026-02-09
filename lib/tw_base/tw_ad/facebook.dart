
import 'dart:convert';

import 'package:c143/tw_base/tw_ad/guiyin/firebbbbbb.dart';
import 'package:c143/tw_base/tw_gj/logC143.dart';
import 'package:flutter_custom_facebook/flutter_custom_facebook.dart';

class TwFacebook {
  static _onlineJson() {
    Map<String, dynamic> localJson = {
      "app_id": "1197136939237005",
      "client_token": "912d0eb6636ed8be16d2a1c279fdc8b2",
      "app_name": "C143_GP",
    };
    try {
      String name = "revealrush_fb";
      String key = TwFirebasC143().by(name: name);
      twLooog("==facebook ls: $name string:$key test===");

      Map<String, dynamic> json = jsonDecode(key);
      localJson = json;
      twLooog("FirebaseUtils: facebook $name json $json");
    } on Exception catch (e) {
      twLooog("onlineJson:$e");
    }
    twLooog("FirebaseUtils: facebook final json ${jsonEncode(localJson)}");
    return localJson;
  }

  static initFacebook() async {
    var json = _onlineJson();

    var app_id = json['app_id']?.toString();
    var client_token = json['client_token']?.toString();
    var app_name = json['app_name']?.toString();



    FlutterCustomFacebook.instance.initFaceBook(
      facebookId: app_id ?? "",
      facebookToken: client_token ?? "",
      facebookAppName: app_name??"C117_GP",
    );
  }
  
}