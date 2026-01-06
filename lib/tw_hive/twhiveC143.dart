


import 'package:hive_ce_flutter/hive_flutter.dart';

class TwHive {
  static const String twkeyBox = "tw143hive";

  static Box get box => Hive.box(TwHive.twkeyBox);
}    
