import 'package:c143/gen/assets.gen.dart';
import 'package:c143/sfcj/floating_particles/src/models/direction.dart';
import 'package:c143/sfcj/floating_particles/src/models/particle_config.dart';
import 'package:c143/sfcj/floating_particles/src/models/particle_type.dart';
import 'package:c143/sfcj/floating_particles/src/widgets/particle_effects_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Hongbaoyu extends StatelessWidget {
  const Hongbaoyu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withValues(alpha: 0.8),
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
          enableRotation: true,
          enableSizeVariation: false,
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
