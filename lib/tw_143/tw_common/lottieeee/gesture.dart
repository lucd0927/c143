

import 'package:c143/tw_143/tw_common/lottieeee/common.dart';
import 'package:c143/tw_143/tw_pages/main_tree/main_tree_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TwLottieGesture extends StatelessWidget {
  const TwLottieGesture({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70.h,
      height: 70.h,
      child: TwLottieCommon(
        type: EnumTwLottttieJson.gesture,
      ),
    );
  }
}
