import 'dart:convert';
import 'dart:math';

import 'package:c143/tw_143/tw_pages/main_tree/main_tree_controller.dart';
import 'package:c143/tw_base/tw_ad/guiyin/firebbbbbb.dart';
import 'package:c143/tw_base/tw_gj/logC143.dart';
import 'package:c143/tw_base/tw_gj/number_extend.dart';
import 'package:tuple/tuple.dart';

class TwNumberJson {
  static dynamic _onlineJson = null;

  static final Map<String, dynamic> _localJson = {
    "user_balance_reward": [
      {
        "earning_range": [0, 90],
        "type": "cash",
        "level_range": 1,
        "reward": [2, 2],
      },
      {
        "earning_range": [0, 90],
        "type": "cash",
        "level_range": 2,
        "reward": [2, 4],
      },
      {
        "earning_range": [0, 90],
        "type": "cash",
        "level_range": 3,
        "reward": [4, 8],
      },
      {
        "earning_range": [0, 90],
        "type": "cash",
        "level_range": 3,
        "reward": [8, 10],
      },
      {
        "earning_range": [90, 100],
        "type": "sun",
        "level_range": 1,
        "reward": [10, 100],
      },
      {
        "earning_range": [90, 100],
        "type": "sun",
        "level_range": 2,
        "reward": [10, 100],
      },
      {
        "earning_range": [90, 100],
        "type": "sun",
        "level_range": 3,
        "reward": [10, 100],
      },
      {
        "earning_range": [90, 100],
        "type": "sun",
        "level_range": 4,
        "reward": [10, 100],
      },
      {
        "earning_range": [100, 700],
        "type": "cash",
        "level_range": 5,
        "reward": [10, 100],
      },
      {
        "earning_range": [700, 900],
        "type": "cash",
        "level_range": 5,
        "reward": [10, 50],
      },
      {
        "earning_range": [900, 950],
        "type": "sun",
        "level_range": 5,
        "reward": [100, 500],
      },
      {
        "earning_range": [950, 999],
        "type": "flower",
        "level_range": 5,
        "reward": [100, 500],
      },
    ],
    "wheel_rewards": [
      {
        "reward_type": "Cash",
        "number_range": [5, 10],
        "probability": 0.5,
      },
      {
        "reward_type": "Cash",
        "number_range": [10, 15],
        "probability": 0,
      },
      {
        "reward_type": "Cash",
        "number_range": [15, 20],
        "probability": 0,
      },
      {
        "reward_type": "Cash",
        "number_range": [25, 50],
        "probability": 0,
      },
      {
        "reward_type": "Cash",
        "number_range": [3, 5],
        "probability": 0.1,
      },
      {
        "reward_type": "Cash",
        "number_range": [2, 3],
        "probability": 0.2,
      },
      {
        "reward_type": "Cash",
        "number_range": [0, 1],
        "probability": 0,
      },
      {
        "reward_type": "Cash",
        "number_range": [1, 2],
        "probability": 0,
      },
      {
        "reward_type": "phone",
        "number_range": [1, 1],
        "probability": 0,
      },
      {
        "reward_type": "cash_out",
        "number_range": [1, 1],
        "probability": 0,
      },
      {
        "reward_type": "2x",
        "number_range": [1, 1],
        "probability": 0.1,
      },
      {
        "reward_type": "cash_rain",
        "number_range": [1, 1],
        "probability": 0.1,
      },
    ],
    "answer_rewards": [
      {
        "earning_range": [0, 90],
        "type": "cash",
        "reward": [1, 2],
      },
      {
        "earning_range": [90, 100],
        "type": "sun",
        "reward": [50, 100],
      },
      {
        "earning_range": [100, 700],
        "type": "cash",
        "level_range": 5,
        "reward": [10, 100],
      },
      {
        "earning_range": [700, 900],
        "type": "cash",
        "level_range": 5,
        "reward": [10, 50],
      },
      {
        "earning_range": [900, 950],
        "type": "sun",
        "reward": [100, 500],
      },
      {
        "earning_range": [950, 999],
        "type": "flower",
        "reward": [100, 500],
      },
    ],
    "ad_probability_by_earning": [
      {
        "earning_range": [0, 5],
        "ad_prob": 0,
      },
      {
        "earning_range": [5, 80],
        "ad_prob": 0.6,
      },
      {
        "earning_range": [80, 100],
        "ad_prob": 0.8,
      },
      {
        "earning_range": [100, 1000],
        "ad_prob": 0.8,
      },
    ],
  };

  static _onlineJsonNet() {
    Map<String, dynamic> localJson = _localJson;
    try {
      String name = "c143number";
      String key = TwFirebasC143().by(name: name);
      twLooog(
        "====common_ads=== _onlineJson FirebaseUtils: $name string:$key test===",
      );

      Map<String, dynamic> json = jsonDecode(key);
      localJson = json;
      twLooog("FirebaseUtils: $name json $json");
    } on Exception catch (e) {
      twLooog("onlineJson:$e");
    }

    twLooog("FirebaseUtils: final json ${jsonEncode(localJson)}");
    return localJson;
  }

  static bool showInter() {
    bool showAd = true;
    _onlineJson ??= _onlineJsonNet();
    var data = _onlineJson['ad_probability_by_earning'];
    if (data is List) {
      double curCoins = MainTreeController.to.curMoneyyyy.value;
      for (int i = 0; i < data.length; i++) {
        var tmpData = data[i];
        var tmpearning_range = tmpData['earning_range'];
        if (tmpearning_range is List && tmpearning_range.isNotEmpty) {
          int length = tmpearning_range.length;
          double num1 = tmpearning_range[0] * 1.0;
          double num2 = tmpearning_range[0] * 1.0;
          if (length > 1) {
            num2 = tmpearning_range[1] * 1.0;
          }
          if (num1 <= curCoins &&
              curCoins <= num2 &&
              tmpData['ad_prob'] is num) {
            double random = Random().nextDouble();
            double ad_prob = tmpData['ad_prob'] * 1.0;
            showAd = ad_prob >= random;
            twLooog("======showInter:$showAd=random:$random ad_prob:$ad_prob");

            break;
          }
        }
      }
    }

    twLooog("======showInter:$showAd=");
    return showAd;
  }

  //item1 type:cash 2x cashout phone cash_rain
  //item2 coin reward
  //item3 gailv
  static List<Tuple3<String, double, double>> moneyWheel() {
    List<Tuple3<String, double, double>> tmpDataTuple3s = [];
    _onlineJson ??= _onlineJsonNet();
    var data = _onlineJson['wheel_rewards'];
    if (data is List) {
      for (int i = 0; i < data.length; i++) {
        var tmpData = data[i];

        var tmpearning_range = tmpData['number_range'];
        double money = Random().nextDouble() * 5;
        if (tmpearning_range is List && tmpearning_range.isNotEmpty) {
          int length = tmpearning_range.length;
          double tmpreward1 = tmpearning_range[0] * 1.0;
          double tmpreward2 = tmpearning_range[0] * 1.0;
          if (length > 1) {
            tmpreward2 = tmpearning_range[1] * 1.0;
          }
          if (tmpreward1 == tmpreward2) {
            money = tmpreward2;
          } else {
            money =
                tmpreward1 + (tmpreward2 - tmpreward1) * Random().nextDouble();
          }
        }
        var reward_type = tmpData['reward_type']?.toString() ?? "";
        double gaulv = (tmpData['probability'] ?? 0) * 1.0;

        Tuple3<String, double, double> tmpTup3 = Tuple3(
          reward_type.toString().toUpperCase(),
          money,
          gaulv * 1.0,
        );
        tmpDataTuple3s.add(tmpTup3);
      }
    }

    int length = 12 - tmpDataTuple3s.length;
    if (length < 0) {
      for (int i = 0; i < length; i++) {
        Tuple3<String, double, double> tmpTup3 = Tuple3(
          "Cash".toUpperCase(),
          Random().nextDouble() * 10 + 5,
          0.0,
        );
        tmpDataTuple3s.add(tmpTup3);
      }
    }
    tmpDataTuple3s.shuffle();
    return tmpDataTuple3s;
  }

  static double moneyTree() {
    double money = Random().nextDouble() * 10;
    _onlineJson ??= _onlineJsonNet();
    var data = _onlineJson['user_balance_reward'];
    if (data is List) {
      double curCoins = MainTreeController.to.curMoneyyyy.value;
      int level = MainTreeController.to.curLevel.value;
      for (int i = 0; i < data.length; i++) {
        var tmpData = data[i];

        var tnolevel_range = tmpData['level_range'];

        if (tnolevel_range == level) {
          var tmpearning_range = tmpData['earning_range'];
          if (tmpearning_range is List && tmpearning_range.isNotEmpty) {
            int length = tmpearning_range.length;
            double num1 = tmpearning_range[0] * 1.0;
            double num2 = tmpearning_range[0] * 1.0;
            if (length > 1) {
              num2 = tmpearning_range[1] * 1.0;
            }
            if (num1 <= curCoins && curCoins <= num2) {
              var tmpreward = tmpData['reward'];
              if (tmpreward is List && tmpreward.isNotEmpty) {
                int length = tmpreward.length;
                double tmpreward1 = tmpreward[0] * 1.0;
                double tmpreward2 = tmpreward[0] * 1.0;
                if (length > 1) {
                  tmpreward2 = tmpreward[1] * 1.0;
                }
                if (tmpreward1 == tmpreward2) {
                  money = tmpreward2;
                } else {
                  money =
                      tmpreward1 +
                      (tmpreward2 - tmpreward1) * Random().nextDouble();
                }
              }

              break;
            }
          }
        }
      }
    }

    bool showSun = MainTreeController.to.showMoneyStatusSunIcon();
    bool showFlower = MainTreeController.to.showMoneyStatusFlowerIcon();
    int foolr = 2;
    if (showSun || showFlower) {
      foolr = 0;
    }
    money = money.toAsFixedFloor(foolr);
    // twLooog("======money:$money");
    return money;
  }

  static moneyAnswer() {
    double money = Random().nextDouble() * 10;
    _onlineJson ??= _onlineJsonNet();
    var data = _onlineJson['answer_rewards'];
    if (data is List) {
      double curCoins = MainTreeController.to.curMoneyyyy.value;
      for (int i = 0; i < data.length; i++) {
        var tmpData = data[i];
        var tmpearning_range = tmpData['earning_range'];
        if (tmpearning_range is List && tmpearning_range.isNotEmpty) {
          int length = tmpearning_range.length;
          double num1 = tmpearning_range[0] * 1.0;
          double num2 = tmpearning_range[0] * 1.0;
          if (length > 1) {
            num2 = tmpearning_range[1] * 1.0;
          }
          if (num1 <= curCoins && curCoins <= num2) {
            var tmpreward = tmpData['reward'];
            if (tmpreward is List && tmpreward.isNotEmpty) {
              int length = tmpreward.length;
              double tmpreward1 = tmpreward[0] * 1.0;
              double tmpreward2 = tmpreward[0] * 1.0;
              if (length > 1) {
                tmpreward2 = tmpreward[1] * 1.0;
              }
              if (tmpreward1 == tmpreward2) {
                money = tmpreward2;
              } else {
                money =
                    tmpreward1 +
                    (tmpreward2 - tmpreward1) * Random().nextDouble();
              }
            }

            break;
          }
        }
      }
    }
    twLooog("=======moneyAnswer:$money");
    return money;
  }
}
