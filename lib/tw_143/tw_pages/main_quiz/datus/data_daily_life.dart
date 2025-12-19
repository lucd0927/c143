
import 'dart:convert';

import 'package:c143/tw_base/tw_gj/base_utils.dart';

import 'data.dart';

class DailyLife{
  static const String category = "DailyLife";
  // static const data = [
  //   {
  //     "question": "How many hours are there in a day?",
  //     "a": "12",
  //     "b": "24",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the capital of France?",
  //     "a": "London",
  //     "b": "Paris",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the name of the planet closest to the Sun?",
  //     "a": "Earth",
  //     "b": "Mercury",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "How many colors are there in a rainbow?",
  //     "a": "5",
  //     "b": "7",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the largest ocean in the world?",
  //     "a": "Atlantic Ocean",
  //     "b": "Pacific Ocean",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the national bird of the United States?",
  //     "a": "Eagle",
  //     "b": "Hawk",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What is the unit of measurement for temperature in the Celsius scale?",
  //     "a": "Degree Fahrenheit",
  //     "b": "Degree Celsius",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the capital of Australia?",
  //     "a": "Sydney",
  //     "b": "Canberra",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "How many sides does a square have?",
  //     "a": "3",
  //     "b": "4",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the chemical symbol for oxygen?",
  //     "a": "O",
  //     "b": "H",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What is the name of the first month of the year?",
  //     "a": "February",
  //     "b": "January",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "How many days are there in a leap year?",
  //     "a": "364",
  //     "b": "366",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the largest planet in our solar system?",
  //     "a": "Jupiter",
  //     "b": "Saturn",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What is the color of a ripe banana?",
  //     "a": "Green",
  //     "b": "Yellow",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the name of the longest river in the world?",
  //     "a": "Amazon River",
  //     "b": "Nile River",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the name of the capital of India?",
  //     "a": "Mumbai",
  //     "b": "New Delhi",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the symbol for the element gold?",
  //     "a": "Au",
  //     "b": "Ag",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "How many continents are there in the world?",
  //     "a": "5",
  //     "b": "7",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the capital of Germany?",
  //     "a": "Berlin",
  //     "b": "Munich",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What is the unit of measurement for volume in the metric system?",
  //     "a": "Liter",
  //     "b": "Meter",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What is the name of the planet known as the Red Planet?",
  //     "a": "Venus",
  //     "b": "Mars",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "How many sides does a hexagon have?",
  //     "a": "5",
  //     "b": "6",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the capital of Japan?",
  //     "a": "Tokyo",
  //     "b": "Osaka",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What is the name of the largest sea in the world?",
  //     "a": "Caspian Sea",
  //     "b": "Mediterranean Sea",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What is the name of the first day of the week?",
  //     "a": "Sunday",
  //     "b": "Monday",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What is the chemical symbol for hydrogen?",
  //     "a": "H",
  //     "b": "He",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What is the name of the largest country in the world by area?",
  //     "a": "Canada",
  //     "b": "Russia",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the name of the planet we live on?",
  //     "a": "Mars",
  //     "b": "Earth",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "How many corners does a rectangle have?",
  //     "a": "2",
  //     "b": "4",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the capital of Brazil?",
  //     "a": "Rio de Janeiro",
  //     "b": "Brasilia",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the name of the smallest continent?",
  //     "a": "Oceania",
  //     "b": "Australia",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the unit of measurement for weight in the metric system?",
  //     "a": "Gram",
  //     "b": "Meter",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What is the name of the largest lake in the world by area?",
  //     "a": "Lake Baikal",
  //     "b": "Caspian Sea",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What is the capital of China?",
  //     "a": "Shanghai",
  //     "b": "Beijing",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the name of the planet with rings?",
  //     "a": "Jupiter",
  //     "b": "Saturn",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "How many states are there in the United States?",
  //     "a": "48",
  //     "b": "50",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the name of the largest moon in the solar system?",
  //     "a": "Ganymede",
  //     "b": "Titan",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What is the capital of Canada?",
  //     "a": "Montreal",
  //     "b": "Ottawa",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the name of the hottest planet in our solar system?",
  //     "a": "Venus",
  //     "b": "Mercury",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "How many legs does a spider have?",
  //     "a": "6",
  //     "b": "8",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the name of the planet that is closest to the Earth in size?",
  //     "a": "Venus",
  //     "b": "Mars",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What is the name of the smallest planet in our solar system?",
  //     "a": "Mercury",
  //     "b": "Pluto",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What is the capital of Russia?",
  //     "a": "Moscow",
  //     "b": "St. Petersburg",
  //     "answer": "a"
  //   }
  // ];

  static const jsonEn =  "1PSt/vrq/Pvm4OGtta3H4Piv4u7h9q/n4Pr9/K/u/eqv++fq/eqv5uGv7q/r7vawraOt7q21rb69raOt7a21rb27raOt7uH8+Or9rbWt7a3yo/St/vrq/Pvm4OGtta3Y5+77r+b8r/vn6q/s7v/m++7jr+Dpr8n97uHs6rCto63urbWtw+Dh6+DhraOt7a21rd/u/eb8raOt7uH8+Or9rbWt7a3yo/St/vrq/Pvm4OGtta3Y5+77r+b8r/vn6q/h7uLqr+Dpr/vn6q//4+7h6vuv7OPg/Or8+6/74K/75+qv3PrhsK2jre6tta3K7v37562jre2tta3C6v3s+v32raOt7uH8+Or9rbWt7a3yo/St/vrq/Pvm4OGtta3H4Piv4u7h9q/s4OPg/fyv7v3qr/vn6v3qr+bhr+6v/e7m4e3g+LCto63urbWtuq2jre2tta24raOt7uH8+Or9rbWt7a3yo/St/vrq/Pvm4OGtta3Y5+77r+b8r/vn6q/j7v3o6vz7r+Ds6u7hr+bhr/vn6q/44P3j67Cto63urbWtzvvj7uH75uyvwOzq7uGto63trbWt3+7s5unm7K/A7Oru4a2jre7h/Pjq/a21re2t8qP0rf766vz75uDhrbWt2Ofu+6/m/K/75+qv4e775uDh7uOv7eb966/g6a/75+qv2uHm++rrr9z77vvq/LCto63urbWtyu7o4+qto63trbWtx+745K2jre7h/Pjq/a21re6t8qP0rf766vz75uDhrbWt2Ofu+6/m/K/75+qv+uHm+6/g6a/i6u78+v3q4urh+6/p4P2v++ri/+r97vv6/eqv5uGv++fqr8zq4/zm+vyv/Ozu4+qwraOt7q21rcvq6P3q6q/J7uf96uHn6ub7raOt7a21rcvq6P3q6q/M6uP85vr8raOt7uH8+Or9rbWt7a3yo/St/vrq/Pvm4OGtta3Y5+77r+b8r/vn6q/s7v/m++7jr+Dpr876/Pv97uPm7rCto63urbWt3Pbr4er2raOt7a21rczu4e3q/f3uraOt7uH8+Or9rbWt7a3yo/St/vrq/Pvm4OGtta3H4Piv4u7h9q/85uvq/K/r4Or8r+6v/P767v3qr+fu+eqwraOt7q21rbyto63trbWtu62jre7h/Pjq/a21re2t8qP0rf766vz75uDhrbWt2Ofu+6/m/K/75+qv7Ofq4ubs7uOv/Pbi7eDjr+ng/a/g9/bo6uGwraOt7q21rcCto63trbWtx62jre7h/Pjq/a21re6t8qP0rf766vz75uDhrbWt2Ofu+6/m/K/75+qv4e7i6q/g6a/75+qv6eb9/Puv4uDh++ev4Omv++fqr/bq7v2wraOt7q21rcnq7f367v32raOt7a21rcXu4fru/fato63u4fz46v2tta3trfKj9K3++ur8++bg4a21rcfg+K/i7uH2r+vu9vyv7v3qr/vn6v3qr+bhr+6v4+ru/6/26u79sK2jre6tta28ubuto63trbWtvLm5raOt7uH8+Or9rbWt7a3yo/St/vrq/Pvm4OGtta3Y5+77r+b8r/vn6q/j7v3o6vz7r//j7uHq+6/m4a/g+v2v/ODj7v2v/Pb8++risK2jre6tta3F+v/m++r9raOt7a21rdzu+/r94a2jre7h/Pjq/a21re6t8qP0rf766vz75uDhrbWt2Ofu+6/m/K/75+qv7ODj4P2v4Omv7q/95v/qr+3u4e7h7rCto63urbWtyP3q6uGto63trbWt1urj4+D4raOt7uH8+Or9rbWt7a3yo/St/vrq/Pvm4OGtta3Y5+77r+b8r/vn6q/h7uLqr+Dpr/vn6q/j4OHo6vz7r/3m+er9r+bhr/vn6q/44P3j67Cto63urbWtzuLu9eDhr93m+er9raOt7a21rcHm4+qv3eb56v2to63u4fz46v2tta3trfKj9K3++ur8++bg4a21rdjn7vuv5vyv++fqr+Hu4uqv4Omv++fqr+zu/+b77uOv4OmvxuHr5u6wraOt7q21rcL64u3u5q2jre2tta3B6vivy+rj5+ato63u4fz46v2tta3trfKj9K3++ur8++bg4a21rdjn7vuv5vyv++fqr/z24u3g46/p4P2v++fqr+rj6uLq4fuv6ODj67Cto63urbWtzvqto63trbWtzuito63u4fz46v2tta3urfKj9K3++ur8++bg4a21rcfg+K/i7uH2r+zg4fvm4erh+/yv7v3qr/vn6v3qr+bhr/vn6q/44P3j67Cto63urbWtuq2jre2tta24raOt7uH8+Or9rbWt7a3yo/St/vrq/Pvm4OGtta3Y5+77r+b8r/vn6q/s7v/m++7jr+Dpr8jq/eLu4fawraOt7q21rc3q/ePm4a2jre2tta3C+uHm7Oeto63u4fz46v2tta3urfKj9K3++ur8++bg4a21rdjn7vuv5vyv++fqr/rh5vuv4Omv4uru/Pr96uLq4fuv6eD9r/ng4/ri6q/m4a/75+qv4ur7/ebsr/z2/Pvq4rCto63urbWtw+b76v2to63trbWtwur76v2to63u4fz46v2tta3urfKj9K3++ur8++bg4a21rdjn7vuv5vyv++fqr+Hu4uqv4Omv++fqr//j7uHq+6/k4eD44a/u/K/75+qv3errr9/j7uHq+7Cto63urbWt2erh+vyto63trbWtwu79/K2jre7h/Pjq/a21re2t8qP0rf766vz75uDhrbWtx+D4r+Lu4fav/Obr6vyv6+Dq/K/ur+fq9+7o4OGv5+756rCto63urbWtuq2jre2tta25raOt7uH8+Or9rbWt7a3yo/St/vrq/Pvm4OGtta3Y5+77r+b8r/vn6q/s7v/m++7jr+Dpr8Xu/+7hsK2jre6tta3b4OT24K2jre2tta3A/O7k7q2jre7h/Pjq/a21re6t8qP0rf766vz75uDhrbWt2Ofu+6/m/K/75+qv4e7i6q/g6a/75+qv4+796Or8+6/86u6v5uGv++fqr/jg/ePrsK2jre6tta3M7vz/5u7hr9zq7q2jre2tta3C6uvm++r9/e7h6u7hr9zq7q2jre7h/Pjq/a21re6t8qP0rf766vz75uDhrbWt2Ofu+6/m/K/75+qv4e7i6q/g6a/75+qv6eb9/Puv6+72r+Dpr/vn6q/46urksK2jre6tta3c+uHr7vato63trbWtwuDh6+72raOt7uH8+Or9rbWt7q3yo/St/vrq/Pvm4OGtta3Y5+77r+b8r/vn6q/s5+ri5uzu46/89uLt4OOv6eD9r+f26/3g6OrhsK2jre6tta3HraOt7a21rcfqraOt7uH8+Or9rbWt7q3yo/St/vrq/Pvm4OGtta3Y5+77r+b8r/vn6q/h7uLqr+Dpr/vn6q/j7v3o6vz7r+zg+uH7/fav5uGv++fqr/jg/ePrr+32r+796u6wraOt7q21rczu4e7r7q2jre2tta3d+vz85u6to63u4fz46v2tta3trfKj9K3++ur8++bg4a21rdjn7vuv5vyv++fqr+Hu4uqv4Omv++fqr//j7uHq+6/46q/j5vnqr+DhsK2jre6tta3C7v38raOt7a21rcru/fvnraOt7uH8+Or9rbWt7a3yo/St/vrq/Pvm4OGtta3H4Piv4u7h9q/s4P3h6v38r+vg6vyv7q/96uz77uHo4+qv5+756rCto63urbWtva2jre2tta27raOt7uH8+Or9rbWt7a3yo/St/vrq/Pvm4OGtta3Y5+77r+b8r/vn6q/s7v/m++7jr+Dpr8397vXm47Cto63urbWt3ebgr+vqr8Xu4erm/eCto63trbWtzf3u/Obj5u6to63u4fz46v2tta3trfKj9K3++ur8++bg4a21rdjn7vuv5vyv++fqr+Hu4uqv4Omv++fqr/zi7uPj6vz7r+zg4fvm4erh+7Cto63urbWtwOzq7uHm7q2jre2tta3O+vz7/e7j5u6to63u4fz46v2tta3trfKj9K3++ur8++bg4a21rdjn7vuv5vyv++fqr/rh5vuv4Omv4uru/Pr96uLq4fuv6eD9r/jq5ujn+6/m4a/75+qv4ur7/ebsr/z2/Pvq4rCto63urbWtyP3u4q2jre2tta3C6vvq/a2jre7h/Pjq/a21re6t8qP0rf766vz75uDhrbWt2Ofu+6/m/K/75+qv4e7i6q/g6a/75+qv4+796Or8+6/j7uTqr+bhr/vn6q/44P3j66/t9q/u/erusK2jre6tta3D7uTqr83u5uTu462jre2tta3M7vz/5u7hr9zq7q2jre7h/Pjq/a21re6t8qP0rf766vz75uDhrbWt2Ofu+6/m/K/75+qv7O7/5vvu46/g6a/M5+bh7rCto63urbWt3Ofu4ejn7uato63trbWtzerm5ebh6K2jre7h/Pjq/a21re2t8qP0rf766vz75uDhrbWt2Ofu+6/m/K/75+qv4e7i6q/g6a/75+qv/+Pu4er7r/jm++ev/ebh6PywraOt7q21rcX6/+b76v2to63trbWt3O77+v3hraOt7uH8+Or9rbWt7a3yo/St/vrq/Pvm4OGtta3H4Piv4u7h9q/8++776vyv7v3qr/vn6v3qr+bhr/vn6q/a4eb76uuv3Pvu++r8sK2jre6tta27t62jre2tta26v62jre7h/Pjq/a21re2t8qP0rf766vz75uDhrbWt2Ofu+6/m/K/75+qv4e7i6q/g6a/75+qv4+796Or8+6/i4ODhr+bhr/vn6q/84OPu/a/89vz76uKwraOt7q21rcju4fbi6uvqraOt7a21rdvm++7hraOt7uH8+Or9rbWt7q3yo/St/vrq/Pvm4OGtta3Y5+77r+b8r/vn6q/s7v/m++7jr+Dpr8zu4e7r7rCto63urbWtwuDh+/3q7uOto63trbWtwPv77vjuraOt7uH8+Or9rbWt7a3yo/St/vrq/Pvm4OGtta3Y5+77r+b8r/vn6q/h7uLqr+Dpr/vn6q/n4Pv76vz7r//j7uHq+6/m4a/g+v2v/ODj7v2v/Pb8++risK2jre6tta3Z6uH6/K2jre2tta3C6v3s+v32raOt7uH8+Or9rbWt7q3yo/St/vrq/Pvm4OGtta3H4Piv4u7h9q/j6uj8r+vg6vyv7q/8/+br6v2v5+756rCto63urbWtua2jre2tta23raOt7uH8+Or9rbWt7a3yo/St/vrq/Pvm4OGtta3Y5+77r+b8r/vn6q/h7uLqr+Dpr/vn6q//4+7h6vuv++fu+6/m/K/s4+D86vz7r/vgr/vn6q/K7v3756/m4a/85vXqsK2jre6tta3Z6uH6/K2jre2tta3C7v38raOt7uH8+Or9rbWt7q3yo/St/vrq/Pvm4OGtta3Y5+77r+b8r/vn6q/h7uLqr+Dpr/vn6q/84u7j4+r8+6//4+7h6vuv5uGv4Pr9r/zg4+79r/z2/Pvq4rCto63urbWtwur97Pr99q2jre2tta3f4/r74K2jre7h/Pjq/a21re6t8qP0rf766vz75uDhrbWt2Ofu+6/m/K/75+qv7O7/5vvu46/g6a/d+vz85u6wraOt7q21rcLg/Ozg+K2jre2tta3c+6Gv3+r76v387fr96K2jre7h/Pjq/a21re6t8tI=";

  static String jsonDe =  TwBaseUtils.decrypt(jsonEn,  QuizDatus.code);
  static dynamic dataA(){
    var tmp = jsonDecode(jsonDe);
    return tmp;
  }
}