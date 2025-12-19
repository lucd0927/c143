
import 'dart:convert';

import 'package:c143/tw_base/tw_gj/base_utils.dart';

import 'data.dart';

class Math{
  static const String category = "Math";
  // static const data =[
  //   {
  //     "question": "What is the result of 2 + 2?",
  //     "a": "3",
  //     "b": "4",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the shape of a circle?",
  //     "a": "Square",
  //     "b": "Round",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the number that comes after 5?",
  //     "a": "6",
  //     "b": "4",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "How many sides does a triangle have?",
  //     "a": "2",
  //     "b": "3",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the square root of 64?",
  //     "a": "5",
  //     "b": "8",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the result of 5 × 3?",
  //     "a": "5",
  //     "b": "15",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "How many legs does a dog have?",
  //     "a": "2",
  //     "b": "4",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the result of 3 squared?",
  //     "a": "6",
  //     "b": "9",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the number that comes before 8?",
  //     "a": "7",
  //     "b": "9",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "How many corners does a rectangle have?",
  //     "a": "2",
  //     "b": "4",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is 12 ÷ 3?",
  //     "a": "4",
  //     "b": "6",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What is the shape of a triangle?",
  //     "a": "Circle",
  //     "b": "Triangle",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "How many days are there in a week?",
  //     "a": "5",
  //     "b": "7",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is 4 + 3?",
  //     "a": "6",
  //     "b": "7",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the number that comes after 9?",
  //     "a": "10",
  //     "b": "8",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What is the result of 7 - 3?",
  //     "a": "3",
  //     "b": "4",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is 15 - 8?",
  //     "a": "7",
  //     "b": "23",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What is the shape of a rectangle?",
  //     "a": "Square",
  //     "b": "Rectangle",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "How many legs does a spider have?",
  //     "a": "2",
  //     "b": "8",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is 5 x 3?",
  //     "a": "8",
  //     "b": "15",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the number that comes before 4?",
  //     "a": "3",
  //     "b": "5",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What is 9 ÷ 3?",
  //     "a": "3",
  //     "b": "6",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What is the shape of an oval?",
  //     "a": "Square",
  //     "b": "Oval",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the result of 2 to the power of 4?",
  //     "a": "4",
  //     "b": "16",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is 7 + 7?",
  //     "a": "10",
  //     "b": "14",
  //     "answer":"b"
  //   },
  //   {
  //     "question": "What is 7 + 3?",
  //     "a": "10",
  //     "b": "14",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What is the number that comes after 12?",
  //     "a": "11",
  //     "b": "13",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "How many corners does a hexagon have?",
  //     "a": "4",
  //     "b": "6",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is 8 - 3?",
  //     "a": "3",
  //     "b": "5",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the result of 6 × 2?",
  //     "a": "16",
  //     "b": "12",
  //     "answer": "b"
  //   }
  // ];


  static const jsonEn =  "1PSt/vrq/Pvm4OGtta3Y5+77r+b8r/vn6q/96vz64/uv4Omvva+kr72wraOt7q21rbyto63trbWtu62jre7h/Pjq/a21re2t8qP0rf766vz75uDhrbWt2Ofu+6/m/K/75+qv/Ofu/+qv4Omv7q/s5v3s4+qwraOt7q21rdz++u796q2jre2tta3d4Prh662jre7h/Pjq/a21re2t8qP0rf766vz75uDhrbWt2Ofu+6/m/K/75+qv4fri7er9r/vn7vuv7ODi6vyv7un76v2vurCto63urbWtua2jre2tta27raOt7uH8+Or9rbWt7q3yo/St/vrq/Pvm4OGtta3H4Piv4u7h9q/85uvq/K/r4Or8r+6v+/3m7uHo4+qv5+756rCto63urbWtva2jre2tta28raOt7uH8+Or9rbWt7a3yo/St/vrq/Pvm4OGtta3Y5+77r+b8r/vn6q/8/vru/eqv/eDg+6/g6a+5u7Cto63urbWtuq2jre2tta23raOt7uH8+Or9rbWt7a3yo/St/vrq/Pvm4OGtta3Y5+77r+b8r/vn6q/96vz64/uv4Omvuq9MGK+8sK2jre6tta26raOt7a21rb66raOt7uH8+Or9rbWt7a3yo/St/vrq/Pvm4OGtta3H4Piv4u7h9q/j6uj8r+vg6vyv7q/r4Oiv5+756rCto63urbWtva2jre2tta27raOt7uH8+Or9rbWt7a3yo/St/vrq/Pvm4OGtta3Y5+77r+b8r/vn6q/96vz64/uv4OmvvK/8/vru/errsK2jre6tta25raOt7a21rbato63u4fz46v2tta3trfKj9K3++ur8++bg4a21rdjn7vuv5vyv++fqr+H64u3q/a/75+77r+zg4ur8r+3q6eD96q+3sK2jre6tta24raOt7a21rbato63u4fz46v2tta3urfKj9K3++ur8++bg4a21rcfg+K/i7uH2r+zg/eHq/fyv6+Dq/K/ur/3q7Pvu4ejj6q/n7vnqsK2jre6tta29raOt7a21rbuto63u4fz46v2tta3trfKj9K3++ur8++bg4a21rdjn7vuv5vyvvr2vTDivvLCto63urbWtu62jre2tta25raOt7uH8+Or9rbWt7q3yo/St/vrq/Pvm4OGtta3Y5+77r+b8r/vn6q/85+7/6q/g6a/ur/v95u7h6OPqsK2jre6tta3M5v3s4+qto63trbWt2/3m7uHo4+qto63u4fz46v2tta3trfKj9K3++ur8++bg4a21rcfg+K/i7uH2r+vu9vyv7v3qr/vn6v3qr+bhr+6v+Orq5LCto63urbWtuq2jre2tta24raOt7uH8+Or9rbWt7a3yo/St/vrq/Pvm4OGtta3Y5+77r+b8r7uvpK+8sK2jre6tta25raOt7a21rbito63u4fz46v2tta3trfKj9K3++ur8++bg4a21rdjn7vuv5vyv++fqr+H64u3q/a/75+77r+zg4ur8r+7p++r9r7awraOt7q21rb6/raOt7a21rbeto63u4fz46v2tta3urfKj9K3++ur8++bg4a21rdjn7vuv5vyv++fqr/3q/Prj+6/g6a+4r6KvvLCto63urbWtvK2jre2tta27raOt7uH8+Or9rbWt7a3yo/St/vrq/Pvm4OGtta3Y5+77r+b8r766r6Kvt7Cto63urbWtuK2jre2tta29vK2jre7h/Pjq/a21re6t8qP0rf766vz75uDhrbWt2Ofu+6/m/K/75+qv/Ofu/+qv4Omv7q/96uz77uHo4+qwraOt7q21rdz++u796q2jre2tta3d6uz77uHo4+qto63u4fz46v2tta3trfKj9K3++ur8++bg4a21rcfg+K/i7uH2r+Pq6Pyv6+Dq/K/ur/z/5uvq/a/n7vnqsK2jre6tta29raOt7a21rbeto63u4fz46v2tta3trfKj9K3++ur8++bg4a21rdjn7vuv5vyvuq/3r7ywraOt7q21rbeto63trbWtvrqto63u4fz46v2tta3trfKj9K3++ur8++bg4a21rdjn7vuv5vyv++fqr+H64u3q/a/75+77r+zg4ur8r+3q6eD96q+7sK2jre6tta28raOt7a21rbqto63u4fz46v2tta3urfKj9K3++ur8++bg4a21rdjn7vuv5vyvtq9MOK+8sK2jre6tta28raOt7a21rbmto63u4fz46v2tta3urfKj9K3++ur8++bg4a21rdjn7vuv5vyv++fqr/zn7v/qr+Dpr+7hr+D57uOwraOt7q21rdz++u796q2jre2tta3A+e7jraOt7uH8+Or9rbWt7a3yo/St/vrq/Pvm4OGtta3Y5+77r+b8r/vn6q/96vz64/uv4Omvva/74K/75+qv/+D46v2v4Omvu7Cto63urbWtu62jre2tta2+ua2jre7h/Pjq/a21re2t8qP0rf766vz75uDhrbWt2Ofu+6/m/K+4r6SvuLCto63urbWtvr+to63trbWtvruto63u4fz46v2tta3trfKj9K3++ur8++bg4a21rdjn7vuv5vyvuK+kr7ywraOt7q21rb6/raOt7a21rb67raOt7uH8+Or9rbWt7q3yo/St/vrq/Pvm4OGtta3Y5+77r+b8r/vn6q/h+uLt6v2v++fu+6/s4OLq/K/u6fvq/a++vbCto63urbWtvr6to63trbWtvryto63u4fz46v2tta3trfKj9K3++ur8++bg4a21rcfg+K/i7uH2r+zg/eHq/fyv6+Dq/K/ur+fq9+7o4OGv5+756rCto63urbWtu62jre2tta25raOt7uH8+Or9rbWt7a3yo/St/vrq/Pvm4OGtta3Y5+77r+b8r7evoq+8sK2jre6tta28raOt7a21rbqto63u4fz46v2tta3trfKj9K3++ur8++bg4a21rdjn7vuv5vyv++fqr/3q/Prj+6/g6a+5r0wYr72wraOt7q21rb65raOt7a21rb69raOt7uH8+Or9rbWt7a3y0g==";

  static String jsonDe =  TwBaseUtils.decrypt(jsonEn,  DaTiShuju.code);
  static dynamic dataA(){
    var tmp = jsonDecode(jsonDe);
    return tmp;
  }
}