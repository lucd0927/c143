//
// import 'dart:convert';
//
// import 'package:c143/tw_143/tw_pages/main_quiz/datus/data_animial.dart';
// import 'package:c143/tw_143/tw_pages/main_quiz/datus/data_daily_life.dart';
// import 'package:c143/tw_143/tw_pages/main_quiz/datus/data_math.dart';
// import 'package:c143/tw_143/tw_pages/main_quiz/datus/data_nature.dart';
// import 'package:c143/tw_base/tw_gj/base_utils.dart';
//
// import 'data.dart';
// import 'data_science.dart';
//
//
//
// void main(){
//
//   int code = DaTiShuju.code;
//   // String jsona = jsonEncode(Science.data);
//   // String jsona = jsonEncode(Animal.data);
//   // String jsona = jsonEncode(DailyLife.data);
//   // String jsona = jsonEncode(Math.data);
//   String jsona = jsonEncode(Nature.data);
//
//   String jsonEn = TwBaseUtils.encrypt(jsona, code);
//   print("==encrypt=:$jsonEn");
//
//   String jsonDe = TwBaseUtils.decrypt(jsonEn, code);
//   print("==decrypt=:$jsonDe");
// }