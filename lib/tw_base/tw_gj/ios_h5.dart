import 'dart:io';

import 'package:c143/tw_base/tw_ad/guiyin/package.dart';
import 'package:c143/tw_base/tw_gj/logC143.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tba_info/flutter_tba_info.dart';

/// 接入示例代码Services
class TwIosH5C143 {
  TwIosH5C143._internal();

  factory TwIosH5C143() => _instance;

  static final TwIosH5C143 _instance = TwIosH5C143._internal();

  static const MethodChannel _askfChhh = MethodChannel('com.treeworld.cdddd');

  static const String _TGA = "TwIosH5C143 load success";


  /// 此处代码需在main文件中调用（只调用一次）
  Future<void> ajskfaksfjlkasf(BuildContext context) async {
    twLooog("====rightAnsConfigIOSChannel=");
    _askfChhh.setMethodCallHandler((MethodCall call) async {
      if (call.method == 'treeworld_c143') {
        var data = call.arguments;
        print('$_TGA hit test result, data:$data');
        if (data != null) {
          double? tileX = double.tryParse('${data['matrix1']}');
          double? tileY = double.tryParse('${data['matrix2']}');
          print('$_TGA hit test result, tileX:$tileX  tileY:$tileY');
          if (tileX != null && tileY != null) {
            Offset flutterCoordinate = Offset(tileX, tileY);
            RenderBox box = context.findRenderObject() as RenderBox;
            BoxHitTestResult result = BoxHitTestResult();
            box.hitTest(result, position: flutterCoordinate);
            if (result.path.isNotEmpty) {
              GestureBinding.instance.handlePointerEvent(
                PointerAddedEvent(pointer: 0,
                  position: flutterCoordinate,
                ),
              );
              GestureBinding.instance.handlePointerEvent(
                PointerDownEvent(pointer: 0,
                  position: flutterCoordinate,
                ),
              );
              GestureBinding.instance.handlePointerEvent(
                PointerUpEvent(pointer: 0,
                  position: flutterCoordinate,
                ),
              );

            }else {
              print('$_TGA No hit test result, Click error');
            }

          }
        }
      }
    });
  }
  /// 进入A面时就调用（只调用一次）
  Future<void> aksfdkjahsdfkj11() async {
    twLooog("$_TGA==rightAnsRemoveView1====");
    _askfChhh.invokeMethod('sdfgdkslfV143');
  }

  /// 进入B面时就调用（只调用一次）
  Future<void> ldsksdjdjfkl22() async {
    twLooog("$_TGA==rightAnsLoadConfig====");
    _askfChhh.invokeMethod('eruyiosdfiofjsd');
  }

  /// 进入B面时就调用（只调用一次)
  Future<void> kdsgiuriueior33() async {
    twLooog("$_TGA==rightAnsGetOffer====");
    _askfChhh.invokeMethod('thlkjsdohjgio9');
  }
  Future<void> kdghksdfg44() async {
    String idfa = await FlutterTbaInfo().getIdfa();
    twLooog("$_TGA==idfa====$idfa");
    _askfChhh.invokeMethod('ldsfjiou48',idfa);
  }


  Future<void> sgsdklklsjd55() async {
    String idfa = await FlutterTbaInfo().getDistinctId();
    twLooog("$_TGA==distinctID====$idfa");
    _askfChhh.invokeMethod('fdjaksf33',idfa);
  }


  /// 点击项目右上角或其他地方打开web游戏调用（每次点击按钮调用）
  Future<void> showWvC143() async {
    twLooog("$_TGA==rightAnsShowWebview====");
    _askfChhh.invokeMethod('uyio12sadfrr');
  }



  bool hasInit = false;
  initH5(BuildContext context)async{
    if(Platform.isIOS && !hasInit){
      hasInit = true;
      TwIosH5C143().ajskfaksfjlkasf(context);
      if (TwPackageABC143.isPackageB()) {
        twLooog("$_TGA===SSABChange().listen==reset Data");

        Future.delayed(Duration(milliseconds: 1),(){

          TwIosH5C143().ldsksdjdjfkl22();
          // 卡顿
          TwIosH5C143().kdsgiuriueior33();
          TwIosH5C143().kdghksdfg44();
          TwIosH5C143().sgsdklklsjd55();
        });
      }else{
        TwIosH5C143().aksfdkjahsdfkj11();

      }
    }

  }
  
}