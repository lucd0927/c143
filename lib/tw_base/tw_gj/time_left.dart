import 'dart:async';

import 'package:c143/tw_base/tw_ad/guiyin/package.dart';
import 'package:c143/tw_base/tw_gj/loggggg.dart';
import 'package:c143/tw_hive/twhive.dart';

class TimeLeft {
  final String twkeyTimeLeft;

  TimeLeft({required this.twkeyTimeLeft});


  var box = TwHive.box;


  Timer? _leftTimeTimer;

  int maxSeconds = 60 * 1;

  // static const int maxSeconds = 60 * 1;

  var _textLeftTime = "";
  var _leftTime = -1;


  int leftTime(){
    return _leftTime;
  }

  String leftTimeToHHmmss(){
    return _textLeftTime;
  }

  int _getLeftTime() {
    int mill = DateTime.now().millisecondsSinceEpoch;
    var tmpData = box.get(twkeyTimeLeft) ?? {"count": 0, "time": mill};
    int time = tmpData['time'];
    saveLeftTime(time);
    // 过了多少时间
    int diff = mill - time;
    // 剩下多少时间
    int left = ((maxSeconds * 1000 - diff) / 1000).toInt();
    if (left <= 0) {
      left = 0;
    }
    return left;
  }

  resetLeftTime() {
    int mill = DateTime.now().millisecondsSinceEpoch;
    saveLeftTime(mill);
    initLeftTimer(hasFirst: false);
    twLooog("====== cresetTime:$mill");
  }

  initLeftTimer({bool hasFirst = true}) {
    int tmpLeftTime = _getLeftTime();
    if (hasFirst) {
      _leftTime = tmpLeftTime;

      _textLeftTime = _formatDuration(tmpLeftTime);
    }
    // ssLogggg("====_initTimer=shengyu:$shengyu");
    _leftTimeTimer?.cancel();
    _leftTimeTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      int tick = timer.tick;
      int shengyu = _getLeftTime();
      int seconds = shengyu;
      if (shengyu <= 0) {
        _textLeftTime = _formatDuration(seconds);
        _leftTime = shengyu;
        // MainController.to.showBoxTime.value = false;
        _leftTimeTimer?.cancel();
        twLooog("=====_initTimer=_leftTime end:$_leftTime _textLeftTime:$_textLeftTime");
        return;
      }
      twLooog("=====_initTimer=_leftTime:$_leftTime _textLeftTime:$_textLeftTime");
      _textLeftTime = _formatDuration(seconds);
      _leftTime = shengyu;
    });
  }

  saveLeftTime(int time) {
    box.put(twkeyTimeLeft, {"time": time});
  }

  String _formatDuration(int seconds) {
    if (seconds <= 0) {
      return "";
    }

    Duration duration = Duration(seconds: seconds);
    String twoDigits(int n) => n.toString().padLeft(2, '0');

    String hours = twoDigits(duration.inHours);
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String secs = twoDigits(duration.inSeconds.remainder(60));

    return '$hours:$minutes:$secs';
  }
}
