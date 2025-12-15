
import 'package:c143/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class MainCash extends StatefulWidget {
  const MainCash({super.key});

  @override
  State<MainCash> createState() => _MainCashState();
}

class _MainCashState extends State<MainCash> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          Assets.twimg.mainBg4.path,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
      ],
    );
  }
}
