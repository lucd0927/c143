
import 'package:c143/gen/assets.gen.dart';
import 'package:c143/tw_143/tw_pages/main_quiz/items/quiz_gifttt.dart';
import 'package:c143/tw_143/tw_pages/main_tree/vieee/main_top_a.dart';
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
          Assets.twimg.quizBg.path,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),

        Positioned.fill(child: Column(children: [
          MainTopA(),
          TwQuizGiftWidget(),
        ],))
      ],
    );
  }
}
