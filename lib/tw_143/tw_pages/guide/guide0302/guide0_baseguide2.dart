import 'dart:async';

import 'package:c143/gen/assets.gen.dart';
import 'package:c143/tw_143/tw_pages/guide/guide0302/guide0_1.dart';
import 'package:c143/tw_143/tw_pages/guide/guide0302/guide0_2.dart';
import 'package:c143/tw_143/tw_pages/guide/guide0302/guide0_3.dart';
import 'package:c143/tw_143/tw_pages/guide/guide0302/guide_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../tw_common/overlay/overlay_lot_water.dart';

class TwNewGuide0302 extends StatefulWidget {
  const TwNewGuide0302({super.key, required this.onEnd});
  final VoidCallback onEnd;
  @override
  State<TwNewGuide0302> createState() => _TwNewGuide0302State();
}

class _TwNewGuide0302State extends State<TwNewGuide0302> {
  bool showAnimated = false;
  Duration animD = Duration(milliseconds: 200);
  double startScale = 0.8;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.put(GuideController0302());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          showAnimated = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget child = GestureDetector(
      onTap: () {},
      child: AnimatedContainer(
        duration: animD,
        color: Colors.black.withValues(
          alpha: showAnimated ? overlayOpacity : 0,
        ),
        child: AnimatedSlide(
          duration: animD,
          // scale: showAnimated ? 1.0 : 1.0,
          offset: showAnimated?Offset.zero:Offset(-375.w, 0),
          child: Container(
            width: ScreenUtil().screenWidth,
            height: ScreenUtil().screenHeight,
            color: Colors.black.withValues(alpha: 0.0),
            child: Stack(
              children: [
                Image.asset(
                  Assets.twimg0302.guide0302Bg.path,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.fill,
                ),

                PageView(
                  controller: GuideController0302.to.controller,
                  physics: NeverScrollableScrollPhysics(),
                  onPageChanged: (index) {
                    print("当前是第 $index 页");
                  },
                  children: [Guide01(), Guide02(), Guide03(onEnd: (){
                    widget.onEnd();
                  },)],
                ),
              ],
            ),
          ),
        ),
      ),
    );
    return Scaffold(body: child);
  }
}
