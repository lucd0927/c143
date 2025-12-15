
import 'package:c143/gen/assets.gen.dart';
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
          Assets.twimg.mainBg2.path,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
      ],
    );
  }
}
