
import 'package:c143/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class MainQuiz extends StatefulWidget {
  const MainQuiz({super.key});

  @override
  State<MainQuiz> createState() => _MainQuizState();
}

class _MainQuizState extends State<MainQuiz> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          Assets.twimg.mainBg3.path,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
      ],
    );
  }
}
