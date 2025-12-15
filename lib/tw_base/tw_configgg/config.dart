// 🛠️ modified by obfuscator tool at 2025-07-09 11:08:44.325232

import 'config_dev.dart';
import 'config_prod.dart';
import 'enum_app_evn.dart';

abstract class TwConfigggg {

  static SSConfiggEnv? _env;

  static SSConfiggEnv get env => _env ?? SSConfiggEnv.prod;
  static bool hasDeeevv(){
    return env == SSConfiggEnv.dev;
  }
  static bool hasProdddd(){
    return env == SSConfiggEnv.prod;
  }
  static initEvn(SSConfiggEnv env){
    _env = env;
  }
  static TwConfigggg? _instance;
  static TwConfigggg get instance => _initInstance();

  static TwConfigggg  _initInstance(){
    switch(_env){
      case SSConfiggEnv.dev:
        _instance = TwConfiggDevvv();
        break;
      case SSConfiggEnv.prod:
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
