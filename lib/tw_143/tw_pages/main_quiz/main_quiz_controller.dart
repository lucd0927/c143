import 'dart:async';

import 'package:c143/tw_143/tw_pages/main_quiz/datus/data.dart';
import 'package:c143/tw_143/tw_pages/main_quiz/datus/quiz_model.dart';
import 'package:c143/tw_base/tw_ad/guiyin/package.dart';
import 'package:c143/tw_base/tw_gj/loggggg.dart';
import 'package:c143/tw_hive/twhive.dart';
import 'package:get/get.dart';

class MainQuizController extends GetxController {
  static MainQuizController get to => Get.find();
  static int gestureMaxTimer = 3;

  var box = TwHive.box;

  var curRightNum = 0.obs;

  var curQuizCategory = EnumQuizDataType.dailyLife.name.obs;

  var curAnswerRightCount = 0.obs;
  var curAnswerCount = 0.obs;
  var curClickAnswer = "".obs;
  var curShowGesture = false.obs;
  var curDaTiTime = gestureMaxTimer.obs;

  List<TwQuizModel> get quizDatus => _initQuizDatus;
  List<TwQuizModel> _initQuizDatus = [];

  TwQuizModel get curTwQuizModel {
    int curIndex = curAnswerCount.value;
    int maxLength = _initQuizDatus.length;
    if (curIndex < maxLength) {
      return _initQuizDatus[curIndex];
    }
    return _initQuizDatus[maxLength - 1];
  }

  _initQuizDatusssss() {
    List tmpAllData = [];

    var categoryData = QuizDatus.data.values.toList();
    for (int i = 0; i < categoryData.length; i++) {
      var tmpItemDatus = categoryData[i];
      if (tmpItemDatus is List) {
        tmpAllData.addAll(tmpItemDatus);
      }
    }
    twLooog(
      "=====tmpDatiModels categoryData:${categoryData.length}  tmpAllData:${tmpAllData.length}",
    );
    List<TwQuizModel> tmpDatiModels = [];
    for (int i = 0; i < tmpAllData.length; i++) {
      var data = tmpAllData[i];
      if (data is Map) {
        TwQuizModel tmp = TwQuizModel.fromJson(data);
        tmpDatiModels.add(tmp);
      }
    }
    _initQuizDatus = tmpDatiModels;
    twLooog("=====tmpDatiModels:${tmpDatiModels.length}  ");
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _initQuizDatusssss();
    _timerGesture(hasFirst: true);
  }

  Timer? _curGestureLeftTimer;

  _timerGesture({required bool hasFirst}) {
    _curGestureLeftTimer?.cancel();
    if (!hasFirst) {
      curShowGesture.value = false;
    }

    curDaTiTime.value = gestureMaxTimer;
    _curGestureLeftTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      int cishu = timer.tick;

      if (cishu >= gestureMaxTimer) {
        curDaTiTime.value = 0;
        curShowGesture.value = true;
        timer.cancel();
      } else {
        int left = gestureMaxTimer - cishu;
        if (left < 0) {
          left = 0;
        }
        curDaTiTime.value = left;
      }
    });
  }

  onClickAnswerrrr({required String click, required String right}) async {
    twLooog("=====click:$click  right:$right");
    String tmpClick = curClickAnswer.value;
    if (tmpClick.isNotEmpty) {
      return;
    }

    curClickAnswer.value = click;
    curShowGesture.value = false;
    _curGestureLeftTimer?.cancel();
    await Future.delayed(Duration(milliseconds: 2000));
    if (click == right) {
      _nextQuestion();


    } else {}
  }


  _nextQuestion(){
    curClickAnswer.value = "";
    _timerGesture(hasFirst: false);
    int tmpcurInde = curAnswerCount.value;

    curAnswerCount.value = tmpcurInde + 1;


  }
}
