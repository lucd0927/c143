import 'dart:io';

import 'package:c143/tw_143/tw_pages/guide/guide1_water.dart';
import 'package:c143/tw_143/tw_pages/main_tree/main_tree_controller.dart';
import 'package:c143/tw_hive/twhiveC143.dart';
import 'package:c143/tw_views/give_5_star.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class GuideController0302 extends GetxController {
  static GuideController0302 get to => Get.find();

  static const String twkeyGuide = "asdfasfd8q43w5t43";
  PageController controller = PageController(initialPage: 0);

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    int count = TwHive.box.get(twkeyGuide)??0;
    // count = 0;
    controller = PageController(initialPage: count);
  }

  onGuide1() {
    TwHive.box.put( twkeyGuide,1);
    controller.animateToPage(
      1,
      duration: Duration(microseconds: 200),
      curve: Curves.linear,
    );
  }

  onGuide2() {
    TwHive.box.put( twkeyGuide,2);
    controller.animateToPage(
      2,
      duration: Duration(microseconds: 200),
      curve: Curves.linear,
    );
  }

  onGuide3()async {
    TwHive.box.put( twkeyGuide,3);

  }
}
