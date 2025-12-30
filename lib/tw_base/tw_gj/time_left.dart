import 'dart:async';

import 'package:c143/tw_base/tw_ad/guiyin/package.dart';
import 'package:c143/tw_base/tw_gj/loggggg.dart';
import 'package:c143/tw_hive/twhive.dart';

class TimeLeft {
  static var box = TwHive.box;

  static String get twkeyTimeLeft =>
      TwPackageAB.isPackageB() ? "sdg4545uyioy3445" : "sdg4545uyioy344578ew";
  Timer? _leftTime;

  int maxSeconds = 60 * 60 * 8;

  // static const int maxSeconds = 60 * 1;

  var textBoxGiftTime = "";
  var boxGiftTime = -1;

  int leftTime() {
    int mill = DateTime.now().millisecondsSinceEpoch;
    var tmpData = box.get(twkeyTimeLeft) ?? {"count": 0, "time": mill};
    int time = tmpData['time'];
    saveLeftTime(time);
    // 过了多少时间
    int diff = mill - time;
    // 剩下多少时间
    int shengyu = ((maxSeconds * 1000 - diff) / 1000).toInt();
    if (shengyu <= 0) {
      shengyu = 0;
    }
    return shengyu;
  }

  resetLeftTime() {
    int mill = DateTime.now().millisecondsSinceEpoch;
    saveLeftTime(mill);
    initLeftTimer(hasFirst: false);
    twLooog("====== cresetTime:$mill");
  }

  initLeftTimer({bool hasFirst = true}) {
    int tmpLeftTime = leftTime();
    if (hasFirst) {
      boxGiftTime = tmpLeftTime;

      textBoxGiftTime = _formatDuration(tmpLeftTime);
    }
    // ssLogggg("====_initTimer=shengyu:$shengyu");
    _leftTime?.cancel();
    _leftTime = Timer.periodic(Duration(seconds: 1), (timer) {
      int tick = timer.tick;
      int shengyu = leftTime();
      int seconds = shengyu;
      if (shengyu <= 0) {
        textBoxGiftTime = _formatDuration(seconds);
        boxGiftTime = shengyu;
        // MainController.to.showBoxTime.value = false;
        _leftTime?.cancel();
        // ssLogggg("=====_initTimer=shengyu:$shengyu ${textBoxGiftTime.value}");
        return;
      }
      // ssLogggg("=====_initTimer=shengyu:$shengyu ${textBoxGiftTime.value}");
      textBoxGiftTime = _formatDuration(seconds);
      boxGiftTime = shengyu;
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
