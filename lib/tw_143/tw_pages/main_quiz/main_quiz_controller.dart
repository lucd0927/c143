import 'dart:async';

import 'package:c143/tw_143/tw_pages/guide/guide8_quiz1.dart';
import 'package:c143/tw_143/tw_pages/main_quiz/datus/data.dart';
import 'package:c143/tw_143/tw_pages/main_quiz/datus/quiz_model.dart';
import 'package:c143/tw_base/tw_ad/guiyin/package.dart';
import 'package:c143/tw_base/tw_gj/loggggg.dart';
import 'package:c143/tw_hive/twhive.dart';
import 'package:get/get.dart';

class MainQuizController extends GetxController {
  static MainQuizController get to => Get.find();

  String get twkeyAnswerCount {
    return TwPackageAB.isPackageB()
        ? "twkeyAnswerCountBBBBB"
        : "twkeyAnswerCountA";
  }

  String get twkeyAnswerRightCount {
    return TwPackageAB.isPackageB()
        ? "twkeyAnswerRightCountBBBB"
        : "twkeyAnswerRightCountAAAA";
  }

  static int gestureMaxTimer = 3;

  var box = TwHive.box;

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

    initQuizGuideDatusssss();
    twLooog("=====tmpDatiModels:${tmpDatiModels.length}  ");
  }

  var guideStatus = "".obs;
  static const String guideStatus1 = "guideStatus1";
  static const String guideStatus2 = "guideStatus2";
  static const String guideStatus3 = "over_quiz_guide";

  String twkeyGuideStatus() {
    return TwPackageAB.isPackageB()
        ? "twkeyGuideStatus2e"
        : "twkeyGuideStatus54654";
  }

  saveGuideStatus() {
    String keyguideStatus = guideStatus.value;
    if (keyguideStatus == guideStatus1) {
      keyguideStatus = guideStatus2;
    } else if (keyguideStatus == guideStatus2) {
      keyguideStatus = guideStatus3;
    }
    String status = keyguideStatus;

    guideStatus.value = status;

    String tmpKeyGuide = twkeyGuideStatus();
    box.put(tmpKeyGuide, status);
  }

  initQuizGuideDatusssss() {
    String tmpKeyGuide = twkeyGuideStatus();
    String result = box.get(tmpKeyGuide) ?? guideStatus1;
    guideStatus = result.obs;

    if (result == guideStatus1 || result == guideStatus2) {
      var categoryData = guideData;

      List<TwQuizModel> tmpDatiModels = [];
      for (int i = 0; i < categoryData.length; i++) {
        var data = categoryData[i];
        TwQuizModel tmp = TwQuizModel.fromJson(data);
        tmpDatiModels.add(tmp);
      }

      twLooog(
        "=====initQuizGuideDatusssss:${tmpDatiModels.length}  result:$result",
      );

      if (tmpDatiModels.length > 1) {
        _initQuizDatus.insert(0, tmpDatiModels[1]);
        _initQuizDatus.insert(0, tmpDatiModels[0]);
      }
    }
  }

  static List<Map<String, dynamic>> guideData = [
    {
      "question": "Do you want to earn more coins?",
      "a": "Yes",
      "b": "No",
      "answer": "a",
    },
    {
      "question": "Were you happy with the ad you just watched?!",
      "a": "Yes",
      "b": "Just so-so",
      "c": "No",
      "answer": "a",
    },
  ];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    int tmpcurAnswerCount = box.get(twkeyAnswerCount) ?? 0;
    curAnswerCount = tmpcurAnswerCount.obs;
    int tmpcurAnswerRightCount = box.get(twkeyAnswerRightCount) ?? 0;
    curAnswerRightCount = tmpcurAnswerRightCount.obs;
    twLooog("====curAnswerCount:$curAnswerCount=");
    twLooog("====curAnswerRightCount:$curAnswerRightCount=");
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
    bool hasClickRight = click == right;
    if (tmpClick.isNotEmpty) {
      return;
    }
    String tmpGuideStatus = guideStatus.value;
    bool hasGuide = tmpGuideStatus == guideStatus1;
    if (hasGuide && !hasClickRight) {
      twLooog("=====click: don't click");
      return;
    }

    curClickAnswer.value = click;
    curShowGesture.value = false;
    _curGestureLeftTimer?.cancel();
    await Future.delayed(Duration(milliseconds: 2000));
    if (hasClickRight) {
      _onAddAnswerRightCount();
      _nextQuestion();
    } else {
      _nextQuestion();
    }
  }

  _nextQuestion() {
    String keyguideStatus = guideStatus.value;
    if (keyguideStatus == guideStatus1) {
      OverlayGuide8Quiz1().show(
        coins: 100,
        onBtn: (v) {
          __nextQuestion();
        },
      );
    } else {
      __nextQuestion();
    }
  }

  __nextQuestion() {
    curClickAnswer.value = "";
    _timerGesture(hasFirst: false);
    _onAddAnswerCount();
  }

  _onAddAnswerCount() {
    int tmpcurInde = curAnswerCount.value;
    int maxLength = _initQuizDatus.length;
    int nextIndex = tmpcurInde + 1;
    if (nextIndex > maxLength) {
      nextIndex = 0;
    }

    curAnswerCount.value = nextIndex;

    box.put(twkeyAnswerCount, nextIndex);
  }

  _onAddAnswerRightCount() {
    int tmpcurInde = curAnswerRightCount.value;
    int nextIndex = tmpcurInde + 1;
    curAnswerRightCount.value = nextIndex;
    box.put(twkeyAnswerRightCount, nextIndex);
  }
}
