import 'package:auto_size_text_plus/auto_size_text_plus.dart';
import 'package:c143/gen/assets.gen.dart';
import 'package:c143/tw_143/tw_common/lottieeee/gesture.dart';
import 'package:c143/tw_143/tw_pages/main_quiz/datus/quiz_model.dart';
import 'package:c143/tw_143/tw_pages/main_quiz/main_quiz_controller.dart';
import 'package:c143/tw_base/tw_gj/loggggg.dart';
import 'package:c143/tw_views/animated_scale.dart';
import 'package:c143/tw_views/font_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class QuizAnswer extends StatefulWidget {
  const QuizAnswer({super.key});

  @override
  State<QuizAnswer> createState() => _QuizAnswerState();
}

class _QuizAnswerState extends State<QuizAnswer> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
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
                  gaplessPlayback: true,
                ),
                Column(
                  children: [
                    SizedBox(height: 10.h),
                    Expanded(child: questionWidget()),
                    answerWidget(),
                    SizedBox(height: 30.h),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    });
  }

  answerWidget() {
    TwQuizModel twQuizModel = MainQuizController.to.curTwQuizModel;
    String a = twQuizModel.a ?? "";
    String b = twQuizModel.b ?? "";
    bool showC = MainQuizController.to.guideStatus.value == MainQuizController.guideStatus2;
    return Column(
      children: [
        answerView(answer: "A", answerContent: a),
        SizedBox(height: 8.h),
        answerView(answer: "B", answerContent: b),
        if(showC)SizedBox(height: 8.h),
        if(showC) answerView(answer: "C", answerContent: "No"),
      ],
    );
  }

  questionWidget() {
    TwQuizModel twQuizModel = MainQuizController.to.curTwQuizModel;
    String question = twQuizModel.question ?? "";
    return Container(
      width: double.infinity,
      // height: 210.h,
      color: Colors.green.withValues(alpha: 0.0),
      margin: EdgeInsets.symmetric(horizontal: 30.w, vertical: 16.h),
      child: Center(
        child: AutoSizeText(
          question,
          style: TextStyle(
            fontSize: 16.sp,
            color: Color(0xff4F2007),
            fontWeight: FontWeight.w900,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  answerView({required String answer, required String answerContent}) {
    TwQuizModel twQuizModel = MainQuizController.to.curTwQuizModel;
    String rightAnswer = twQuizModel.answer?.toUpperCase() ??"----";
    String clickAnswer = MainQuizController.to.curClickAnswer.value;
    bool showIcon = answer == clickAnswer;
    bool showC = MainQuizController.to.guideStatus.value == MainQuizController.guideStatus2;
    bool selectRight = rightAnswer == answer;
    String answerIcon = selectRight
        ? Assets.twimg.ok.path
        : Assets.twimg.error.path;

    bool showG = MainQuizController.to.curShowGesture.value;
    String icon = Assets.twimg.btnQuiz.path;
    if (showIcon) {
      icon = selectRight
          ? Assets.twimg.btnQuizSelectOk.path
          : Assets.twimg.btnQuizSelectError.path;
    }
    twLooog("====showG:$showG selectRight:$selectRight answer:$answer rightAnswer:$rightAnswer showIcon:$showIcon");

    double opacity = 1;
    if(showG){
        opacity= selectRight?1:0.2;
    }
    if(showC){
      opacity = 1;
    }
    return GestureDetector(
      onTap: () {
        MainQuizController.to.onClickAnswerrrr(click: answer, right: rightAnswer);
      },
      child: Center(
        child: Container(
          width: 272.w,
          height: 60.h,
          color: Colors.red.withValues(alpha: 0.0),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              AnimatedOpacity(
                duration: Duration(milliseconds: 300),
                opacity: opacity,
                child: Image.asset(
                  icon,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.fill,
                  // opacity: AlwaysStoppedAnimation(opacity),
                  gaplessPlayback: true,
                ),
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
                      text: "$answer.",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      foreground: Color(0xff7E1D00),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 40.w,
                right: 40.w,
                top: 4.h,
                bottom: 4.h,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(10.w),
                    child: TwTxtBorder(
                      text: "$answerContent",
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      foreground: Color(0xff7E1D00),
                    ),
                  ),
                ),
              ),

              if (showIcon)
                Positioned(
                  top: 0,
                  bottom: 0.h,
                  right: 20.w,
                  child: Image.asset(answerIcon, width: 24.w, height: 24.w),
                ),

              if (showG && selectRight)
                Positioned(
                  top: 20.h,
                  // bottom: 0,
                  right: -20.w,
                  // child: TwAScale(
                  //   child: Image.asset(
                  //     Assets.twimg.gesture.path,
                  //     width: 70.w,
                  //     height: 70.w,
                  //   ),
                  // ),
                  child: TwLottieGesture(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
