import 'package:c143/gen/assets.gen.dart';
import 'package:c143/tw_143/tw_pages/main_tree/main_tree_controller.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TwLottieCommon extends StatelessWidget {
  const TwLottieCommon({
    super.key,
    required this.type,
    this.repeat = true,
    this.animate = true,
  });

  final EnumTwLottttieJson type;
  final bool repeat;
  final bool animate;

  @override
  Widget build(BuildContext context) {
    var data = MainTreeController.composition(type);
    if (data != null) {
      return Lottie(composition: data, repeat: repeat,animate: animate,);
    }
    String jsonpath = "";
    if (type == EnumTwLottttieJson.water) {
      jsonpath = Assets.lottiejson.water;
    } else if (type == EnumTwLottttieJson.coin1) {
      jsonpath = Assets.lottiejson.coin1;
    } else if (type == EnumTwLottttieJson.coin2) {
      jsonpath = Assets.lottiejson.coin2;
    } else if (type == EnumTwLottttieJson.coin3) {
      jsonpath = Assets.lottiejson.coin3;
    } else if (type == EnumTwLottttieJson.coin4) {
      jsonpath = Assets.lottiejson.coin4;
    } else if (type == EnumTwLottttieJson.coin5) {
      jsonpath = Assets.lottiejson.coin5;
    } else if (type == EnumTwLottttieJson.monn1) {
      jsonpath = Assets.lottiejson.monn1;
    } else if (type == EnumTwLottttieJson.monn2) {
      jsonpath = Assets.lottiejson.monn2;
    } else if (type == EnumTwLottttieJson.monn3) {
      jsonpath = Assets.lottiejson.monn3;
    } else if (type == EnumTwLottttieJson.monn4) {
      jsonpath = Assets.lottiejson.monn4;
    } else if (type == EnumTwLottttieJson.monn5) {
      jsonpath = Assets.lottiejson.monn5;
    } else if (type == EnumTwLottttieJson.bghightligth) {
      jsonpath = Assets.lottiejson.bghightligth;
    } else if (type == EnumTwLottttieJson.gesture) {
      jsonpath = Assets.lottiejson.gesture;
    }

    if (jsonpath.isEmpty) {
      return const SizedBox();
    }

    return Lottie.asset(
      jsonpath,
      repeat: repeat,
      frameBuilder: (_, child, __) => child,
      animate: animate,
    );
  }
}
