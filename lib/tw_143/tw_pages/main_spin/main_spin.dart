import 'package:c143/gen/assets.gen.dart';
import 'package:c143/tw_143/tw_pages/main_spin/views/wheel_details.dart';
import 'package:flutter/material.dart';

class MainSpin extends StatefulWidget {
  const MainSpin({super.key});

  @override
  State<MainSpin> createState() => _MainSpinState();
}

class _MainSpinState extends State<MainSpin> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          Assets.twimg.spinBg.path,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
          gaplessPlayback: true,
        ),
        Positioned.fill(child: Column(children: [SpinWheelDetails()])),
      ],
    );
  }
}
