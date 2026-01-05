import 'dart:math';

class TwBaseNumber {
  static bool showInter() {
    return false;
  }

  static double coins() {
    double tmpCoin = (10 + Random().nextInt(90)) * 1.0;

    return tmpCoin;
  }
}
