
import 'package:vibration/vibration.dart';

class VibrationC143 {

  static vibrationClick()async{
    if (await Vibration.hasVibrator()) {
      Vibration.vibrate(duration: 10);
    }
  }

}