import 'package:c143/gen/assets.gen.dart';
import 'package:c143/sfcj/floating_particles/src/models/direction.dart';
import 'package:c143/sfcj/floating_particles/src/models/particle_config.dart';
import 'package:c143/sfcj/floating_particles/src/models/particle_type.dart';
import 'package:c143/sfcj/floating_particles/src/widgets/particle_effects_widget.dart';
import 'package:c143/tw_143/tw_pages/guide/guide1_water.dart';
import 'package:c143/tw_base/tw_gj/loggggg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class OverlayHongbaoyu {


  OverlayEntry? _overlayEntry;

  ///是否真正显示
  bool get isShowing => _isShowing;
  bool _isShowing = false;

  void show() {
    _overlayEntry = null;

    _overlayEntry = OverlayEntry(
      builder: (context) {
        return Material(
          color: Colors.transparent,
          child: _hongbaoyuuu(
            onClose: () async {
              close();

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

class _hongbaoyuuu extends StatefulWidget {
  const _hongbaoyuuu({
    required this.onClose,
  });


  final VoidCallback onClose;

  @override
  State<_hongbaoyuuu> createState() => _hongbaoyuuuState();
}

class _hongbaoyuuuState extends State<_hongbaoyuuu> {
  int index = 0;

  bool showAnimated = false;
  Duration animD = Duration(milliseconds: 200);
  double startScale = 0.8;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

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
    return AnimatedContainer(
      duration: animD,
      color: Colors.black.withValues(alpha: showAnimated ? overlayOpacity : 0),
      child: AnimatedScale(
        duration: animD,
        scale: showAnimated ? 1.0 : startScale,
        child: SizedBox(
          width: ScreenUtil().screenWidth,
          height: ScreenUtil().screenHeight,
          child: IndexedStack(
            index: index,
            children: [
              GestureDetector(
                onTap: () {
                  twLooog("=====Hongbaoyu=onClose");
                  widget.onClose();
                },
                child: Hongbaoyu(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class Hongbaoyu extends StatelessWidget {
  const Hongbaoyu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withValues(alpha: 0.0),
      child: ParticleEffects(
        isEnabled: true,
        config: ParticleConfig(
          particleType: ParticleType.image,
          direction: ParticleDirection.topToBottom,
          // Already falling
          particleCount: 10,
          imagePath: Assets.twimg.quizCoinYu.path,
          minSize: 50.w,
          maxSize: 50.w,
          enableRotation: false,
          // enableSizeVariation: true,
          velocityMultiplier: 2,
          animationDuration: Duration(seconds: 10),
          minOpacity: 1.0,
          maxOpacity: 1.0,
        ),
        child: Container(
          width: ScreenUtil().screenWidth,
          height: ScreenUtil().screenHeight,
          // width: 375.w,
          // height: 400.h,
          color: Colors.yellow.withValues(alpha: 0.0),
        ),
      ),
    );
  }
}
