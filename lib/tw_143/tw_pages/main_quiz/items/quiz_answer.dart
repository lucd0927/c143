

import 'package:auto_size_text_plus/auto_size_text_plus.dart';
import 'package:c143/gen/assets.gen.dart';
import 'package:c143/tw_views/animated_scale.dart';
import 'package:c143/tw_views/font_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuizAnswer extends StatefulWidget {
  const QuizAnswer({super.key});

  @override
  State<QuizAnswer> createState() => _QuizAnswerState();
}

class _QuizAnswerState extends State<QuizAnswer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 352.w,
          height: 396.h,
          color: Colors.blue.withValues(alpha: 0.0),
          child: Stack(
            children: [
              Image.asset(
                Assets.twimg.quizDatiBg2.path,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
              Column(
                children: [
                  SizedBox(height: 10.h,),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      // height: 210.h,
                      color: Colors.green.withValues(alpha: 0.0),
                      margin: EdgeInsets.symmetric(
                        horizontal: 30.w,
                        vertical: 16.h,
                      ),
                      child: Center(
                        child: AutoSizeText(
                          "555sfdasfdasf",
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: Color(0xff6A0000),
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),

                  answerView(answer: "A",answerContent: "akdjkjdshgihsihfkjhdfskjlhdshfkljdhsk"),
                  SizedBox(height: 8.h,),
                  answerView(answer: "B",answerContent: "a"),
                  SizedBox(height: 20.h,),

                ],
              ),
            ],
          ),
        ),
      ],
    );
  }






  answerView({required String answer, required String answerContent}) {
    // DatiModel tmpDatiModel = DtController.to.datiModel;
    String rightAnswer ="9999";
    String clickAnswer = "888";
    bool showIcon = answer == clickAnswer;

    bool selectRight = rightAnswer == answer;
    String answerIcon = selectRight
        ? Assets.twimg.btnQuiz.path
        : Assets.twimg.btnQuiz.path;

    bool showG = false;
    String icon = Assets.twimg.btnQuiz.path;
    if (showIcon) {
      icon = selectRight
          ? Assets.twimg.btnQuiz.path
          : Assets.twimg.btnQuiz.path;
    }
    return GestureDetector(
      onTap: () {

      },
      child: Center(
        child: Container(
          width: 272.w,
          height: 60.h,
          color: Colors.red.withValues(alpha: 0.0),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Image.asset(
                icon,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
                gaplessPlayback: true,
              ),
              Positioned(
                left: 15.w,
                // right: 0,
                top: 4.h,
                bottom: 4.h,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(10.w),
                    child: TwTxtBorder(
                      text: "$answer",
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w700,
                      foreground: Color(0xff7E1D00),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 40.w,
                right: 20.w,
                top: 4.h,
                bottom: 4.h,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(10.w),
                    child: TwTxtBorder(
                      text: "$answerContent",
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w700,
                      foreground: Color(0xff7E1D00),
                    ),
                  ),
                ),
              ),

              if (showIcon)
                Positioned(
                  top: 0,
                  bottom: 10.h,
                  right: 20.w,
                  child: Image.asset(answerIcon, width: 24.w, height: 24.w),
                ),

              if (showG && selectRight)
                Positioned(
                  top: 10.h,
                  // bottom: 0,
                  right: 0.w,
                  child: TwAScale(
                    child: Image.asset(
                      Assets.twimg.gesture.path,
                      width: 70.w,
                      height: 70.w,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
  
}

