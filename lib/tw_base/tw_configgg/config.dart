// 🛠️ modified by obfuscator tool at 2025-07-09 11:08:44.325232

import 'config_dev.dart';
import 'config_prod.dart';
import 'enum_app_evn.dart';

abstract class TwConfigggg {

  static TwConfiggEnv? _env;

  static TwConfiggEnv get env => _env ?? TwConfiggEnv.prod;
  static bool hasDeeevv(){
    return env == TwConfiggEnv.dev;
  }
  static bool hasProdddd(){
    return env == TwConfiggEnv.prod;
  }
  static initEvn(TwConfiggEnv env){
    _env = env;
  }
  static TwConfigggg? _instance;
  static TwConfigggg get instance => _initInstance();

  static TwConfigggg  _initInstance(){
    switch(_env){
      case TwConfiggEnv.dev:
        _instance = TwConfiggDevvv();
        break;
      case TwConfiggEnv.prod:
        _instance = SSConfiggPordddd();
        break;
      default:
        _instance = SSConfiggPordddd();
    }
    return _instance!;
  }



  String base_urllll();
  String tbaaa_urlll();



}    
