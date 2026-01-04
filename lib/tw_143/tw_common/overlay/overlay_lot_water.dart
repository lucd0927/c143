import 'dart:async';

import 'package:c143/tw_143/tw_common/lottieeee/common.dart';
import 'package:c143/tw_143/tw_pages/main_tree/main_tree_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

const double overlayOpacity = 0.8;

class OverlayLotWater {
  OverlayEntry? _overlayEntry;

  ///是否真正显示
  bool get isShowing => _isShowing;
  bool _isShowing = false;

  void show({
    required VoidCallback onEnd,
}) {
    _overlayEntry = null;

    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Material(
          color: Colors.transparent,
          child: LotWaterWidget(
            onClose: () async {
              close();
              onEnd();
            },
          ),
        );
      },
    );
    Overlay.of(Get.context!).insert(_overlayEntry!);
    _isShowing = true;
  }

  void close() {
    _isShowing = false;
    _overlayEntry?.remove();
  }
}

class LotWaterWidget extends StatefulWidget {
  const LotWaterWidget({super.key, required this.onClose});

  final VoidCallback onClose;

  @override
  State<LotWaterWidget> createState() => _LotWaterWidgetState();
}

class _LotWaterWidgetState extends State<LotWaterWidget> {
  int index = 0;

  bool showAnimated = false;
  Duration animD = Duration(milliseconds: 200);
  double startScale = 0.8;

  Timer? _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        setState(() {
          showAnimated = true;
        });
        initTimer();
      }
    });
  }
  final Duration _timerD = Duration(milliseconds: 2000);
  initTimer() {
    _timer?.cancel();
    _timer = Timer(_timerD, () {
      _timer?.cancel();
      widget.onClose();
    });
  }


  @override
  Widget build(BuildContext context) {
    double right = 80.w;
    double top = 250.h;
    EnumTwLottttieJson type = MainTreeController.to.lottieType();
    if (type == EnumTwLottttieJson.coin1 || type == EnumTwLottttieJson.monn1) {
      right = 60.w;
      top = 250.h;
    } else if (type == EnumTwLottttieJson.coin2 ||
        type == EnumTwLottttieJson.monn2) {
      right = 40.w;
      top = 230.h;
    } else if (type == EnumTwLottttieJson.coin3 ||
        type == EnumTwLottttieJson.monn3) {
      right = 40.w;
      top = 200.h;
    } else if (type == EnumTwLottttieJson.coin4 ||
        type == EnumTwLottttieJson.monn4) {
      right = 40.w;
      top = 200.h;
    } else if (type == EnumTwLottttieJson.coin5 ||
        type == EnumTwLottttieJson.monn5) {
      right = 40.w;
      top = 200.h;
    }
    return AnimatedContainer(
      duration: animD,
      color: Colors.black.withValues(alpha: showAnimated ? 0 : 0),
      child: AnimatedScale(
        duration: animD,
        scale: showAnimated ? 1.0 : startScale,
        child: SizedBox(
          width: ScreenUtil().screenWidth,
          height: ScreenUtil().screenHeight,
          child: Stack(
            children: [
              Positioned(
                right: right,
                top: top,
                child: Container(
                  width: 150.w,
                  height: 150.h,
                  child: TwLottieCommon(type: EnumTwLottttieJson.water),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  @override
  void dispose() {
    // TODO: implement dispose
    _timer?.cancel();
    super.dispose();
  }
}
