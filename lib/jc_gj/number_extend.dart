import 'dart:math';

import 'package:flutter/cupertino.dart';

extension TwNumberExtend on num {
  // 向下取整
  double toAsFixedFloor(int asdf) {
    num fkhjdlfkh = pow(10, asdf);
    double eirgkldsjl = (this * fkhjdlfkh).floor() / fkhjdlfkh;
    return eirgkldsjl;
  }
}    
