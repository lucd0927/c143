
import 'dart:convert';

import 'package:c143/tw_base/tw_gj/base_utils.dart';

import 'data.dart';

class Animal {
  static const String category = "Animal";
  //
  // static const data = [
  //   {
  //     "question": "What is the largest land animal in the world?",
  //     "a": "Dog",
  //     "b": "Elephant",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What animal has a long trunk?",
  //     "a": "Elephant",
  //     "b": "Giraffe",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "Which animal has the longest lifespan?",
  //     "a": "Tortoise",
  //     "b": "Monkey",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What is the fastest land animal?",
  //     "a": "Horse",
  //     "b": "Cheetah",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "Which animal is known for its black and white stripes?",
  //     "a": "Zebra",
  //     "b": "Lion",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "Which animal has a long neck and eats leaves from tall trees?",
  //     "a": "Elephant",
  //     "b": "Giraffe",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "Which animal is capable of producing venom?",
  //     "a": "Jellyfish",
  //     "b": "Tiger",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What is the largest species of penguin?",
  //     "a": "Emperor penguin",
  //     "b": "Gentoo penguin",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What animal has a hard shell and moves slowly?",
  //     "a": "Turtle",
  //     "b": "Rabbit",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What is the national bird of the United States?",
  //     "a": "Monkey",
  //     "b": "Eagle",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "Which animal is known for its long neck?",
  //     "a": "Eagle",
  //     "b": "Elephant",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What animal lives in the water and has a fin on its back?",
  //     "a": "Dolphin",
  //     "b": "Giraffe",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "Which animal can fly?",
  //     "a": "Tiger",
  //     "b": "Bat",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the largest species of shark?",
  //     "a": "Tiger shark",
  //     "b": " Whale shark",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "Which animal is known for its ability to camouflage?",
  //     "a": "Chameleon",
  //     "b": "Giraffe",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What animal is known for its black and white color and waddling walk?",
  //     "a": "Penguin",
  //     "b": "Lion",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What animal lives in the desert and has humps on its back?",
  //     "a": "Camel",
  //     "b": "Gorilla",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "Which animal is known for its humps on its back?",
  //     "a": "Bear",
  //     "b": "Anteater",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What animal has a long neck and spots on its body?",
  //     "a": "Giraffe",
  //     "b": "Horse",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "Which animal is known for its black and white coloration and bamboo diet?",
  //     "a": "Crab",
  //     "b": "Panda",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "Which animal is known for its ability to swim and balance a ball on its nose?",
  //     "a": "Seal",
  //     "b": "Gorilla",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What animal has a long, sticky tongue and can climb trees?",
  //     "a": "Bear",
  //     "b": "Chameleon",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What animal lives in the jungle and has orange fur with black stripes?",
  //     "a": "Tiger",
  //     "b": "Elephant",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "Which animal is known for its ability to hang upside down from trees?",
  //     "a": "Sloth",
  //     "b": "Rabbit",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What animal is known for its bright colors and ability to mimic other animals?",
  //     "a": "Parrot",
  //     "b": "Gorilla",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What animal lives in the ocean and has a hard shell on its back?",
  //     "a": "Shark",
  //     "b": "Turtle",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What animal is known for its black and white color and eats bamboo?",
  //     "a": "Panda",
  //     "b": "Lion",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What is the national animal of Canada?",
  //     "a": "Beaver",
  //     "b": "Moose",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "Which animal can change its color to match its surroundings? ",
  //     "a": "Chameleon",
  //     "b": "Ostrich",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "Which animal is known for its ability to camouflage and change colors?",
  //     "a": "Chameleon",
  //     "b": "Gorilla",
  //     "answer": "a"
  //   }
  // ];

  static const jsonEn = "1PSt/vrq/Pvm4OGtta3Y5+77r+b8r/vn6q/j7v3o6vz7r+Pu4euv7uHm4u7jr+bhr/vn6q/44P3j67Cto63urbWty+DoraOt7a21rcrj6v/n7uH7raOt7uH8+Or9rbWt7a3yo/St/vrq/Pvm4OGtta3Y5+77r+7h5uLu46/n7vyv7q/j4OHor/v9+uHksK2jre6tta3K4+r/5+7h+62jre2tta3I5v3u6enqraOt7uH8+Or9rbWt7q3yo/St/vrq/Pvm4OGtta3Y5+bs56/u4ebi7uOv5+78r/vn6q/j4OHo6vz7r+Pm6er8/+7hsK2jre6tta3b4P374Ob86q2jre2tta3C4OHk6vato63u4fz46v2tta3urfKj9K3++ur8++bg4a21rdjn7vuv5vyv++fqr+nu/Pvq/Puv4+7h66/u4ebi7uOwraOt7q21rcfg/fzqraOt7a21rczn6ur77ueto63u4fz46v2tta3trfKj9K3++ur8++bg4a21rdjn5uznr+7h5uLu46/m/K/k4eD44a/p4P2v5vv8r+3j7uzkr+7h66/45+b76q/8+/3m/+r8sK2jre6tta3V6u397q2jre2tta3D5uDhraOt7uH8+Or9rbWt7q3yo/St/vrq/Pvm4OGtta3Y5+bs56/u4ebi7uOv5+78r+6v4+Dh6K/h6uzkr+7h66/q7vv8r+Pq7vnq/K/p/eDir/vu4+Ov+/3q6vywraOt7q21rcrj6v/n7uH7raOt7a21rcjm/e7p6eqto63u4fz46v2tta3trfKj9K3++ur8++bg4a21rdjn5uznr+7h5uLu46/m/K/s7v/u7ePqr+Dpr//94Ov67Obh6K/56uHg4rCto63urbWtxerj4/bp5vznraOt7a21rdvm6Or9raOt7uH8+Or9rbWt7q3yo/St/vrq/Pvm4OGtta3Y5+77r+b8r/vn6q/j7v3o6vz7r/z/6uzm6vyv4Omv/+rh6Prm4bCto63urbWtyuL/6v3g/a//6uHo+ubhraOt7a21rcjq4fvg4K//6uHo+ubhraOt7uH8+Or9rbWt7q3yo/St/vrq/Pvm4OGtta3Y5+77r+7h5uLu46/n7vyv7q/n7v3rr/zn6uPjr+7h66/i4Pnq/K/84+D44/awraOt7q21rdv6/fvj6q2jre2tta3d7u3t5vuto63u4fz46v2tta3urfKj9K3++ur8++bg4a21rdjn7vuv5vyv++fqr+Hu++bg4e7jr+3m/euv4Omv++fqr9rh5vvq66/c++776vywraOt7q21rcLg4eTq9q2jre2tta3K7ujj6q2jre7h/Pjq/a21re2t8qP0rf766vz75uDhrbWt2Ofm7Oev7uHm4u7jr+b8r+Th4Pjhr+ng/a/m+/yv4+Dh6K/h6uzksK2jre6tta3K7ujj6q2jre2tta3K4+r/5+7h+62jre7h/Pjq/a21re6t8qP0rf766vz75uDhrbWt2Ofu+6/u4ebi7uOv4+b56vyv5uGv++fqr/ju++r9r+7h66/n7vyv7q/p5uGv4OGv5vv8r+3u7OSwraOt7q21rcvg4//n5uGto63trbWtyOb97unp6q2jre7h/Pjq/a21re6t8qP0rf766vz75uDhrbWt2Ofm7Oev7uHm4u7jr+zu4a/p4/awraOt7q21rdvm6Or9raOt7a21rc3u+62jre7h/Pjq/a21re2t8qP0rf766vz75uDhrbWt2Ofu+6/m/K/75+qv4+796Or8+6/8/+rs5ur8r+Dpr/zn7v3ksK2jre6tta3b5ujq/a/85+795K2jre2tta2v2Ofu4+qv/Ofu/eSto63u4fz46v2tta3trfKj9K3++ur8++bg4a21rdjn5uznr+7h5uLu46/m/K/k4eD44a/p4P2v5vv8r+7t5uPm+/av++Cv7O7i4Prp4+7o6rCto63urbWtzOfu4urj6uDhraOt7a21rcjm/e7p6eqto63u4fz46v2tta3urfKj9K3++ur8++bg4a21rdjn7vuv7uHm4u7jr+b8r+Th4Pjhr+ng/a/m+/yv7ePu7OSv7uHrr/jn5vvqr+zg4+D9r+7h66/47uvr4+bh6K/47uPksK2jre6tta3f6uHo+ubhraOt7a21rcPm4OGto63u4fz46v2tta3urfKj9K3++ur8++bg4a21rdjn7vuv7uHm4u7jr+Pm+er8r+bhr/vn6q/r6vzq/fuv7uHrr+fu/K/n+uL//K/g4a/m+/yv7e7s5LCto63urbWtzO7i6uOto63trbWtyOD95uPj7q2jre7h/Pjq/a21re6t8qP0rf766vz75uDhrbWt2Ofm7Oev7uHm4u7jr+b8r+Th4Pjhr+ng/a/m+/yv5/ri//yv4OGv5vv8r+3u7OSwraOt7q21rc3q7v2to63trbWtzuH76u776v2to63u4fz46v2tta3trfKj9K3++ur8++bg4a21rdjn7vuv7uHm4u7jr+fu/K/ur+Pg4eiv4ers5K/u4euv/P/g+/yv4OGv5vv8r+3g6/awraOt7q21rcjm/e7p6eqto63trbWtx+D9/Oqto63u4fz46v2tta3urfKj9K3++ur8++bg4a21rdjn5uznr+7h5uLu46/m/K/k4eD44a/p4P2v5vv8r+3j7uzkr+7h66/45+b76q/s4OPg/e775uDhr+7h66/t7uLt4OCv6+bq+7Cto63urbWtzP3u7a2jre2tta3f7uHr7q2jre7h/Pjq/a21re2t8qP0rf766vz75uDhrbWt2Ofm7Oev7uHm4u7jr+b8r+Th4Pjhr+ng/a/m+/yv7u3m4+b79q/74K/8+Obir+7h66/t7uPu4ezqr+6v7e7j46/g4a/m+/yv4eD86rCto63urbWt3Oru462jre2tta3I4P3m4+PuraOt7uH8+Or9rbWt7q3yo/St/vrq/Pvm4OGtta3Y5+77r+7h5uLu46/n7vyv7q/j4OHoo6/8++bs5Pav++Dh6Prqr+7h66/s7uGv7OPm4u2v+/3q6vywraOt7q21rc3q7v2to63trbWtzOfu4urj6uDhraOt7uH8+Or9rbWt7a3yo/St/vrq/Pvm4OGtta3Y5+77r+7h5uLu46/j5vnq/K/m4a/75+qv5frh6OPqr+7h66/n7vyv4P3u4ejqr+n6/a/45vvnr+3j7uzkr/z7/eb/6vywraOt7q21rdvm6Or9raOt7a21rcrj6v/n7uH7raOt7uH8+Or9rbWt7q3yo/St/vrq/Pvm4OGtta3Y5+bs56/u4ebi7uOv5vyv5OHg+OGv6eD9r+b7/K/u7ebj5vv2r/vgr+fu4eiv+v/85uvqr+vg+OGv6f3g4q/7/erq/LCto63urbWt3OPg++eto63trbWt3e7t7eb7raOt7uH8+Or9rbWt7q3yo/St/vrq/Pvm4OGtta3Y5+77r+7h5uLu46/m/K/k4eD44a/p4P2v5vv8r+395ujn+6/s4OPg/fyv7uHrr+7t5uPm+/av++Cv4ubi5uyv4Pvn6v2v7uHm4u7j/LCto63urbWt3+79/eD7raOt7a21rcjg/ebj4+6to63u4fz46v2tta3urfKj9K3++ur8++bg4a21rdjn7vuv7uHm4u7jr+Pm+er8r+bhr/vn6q/g7Oru4a/u4euv5+78r+6v5+7966/85+rj46/g4a/m+/yv7e7s5LCto63urbWt3Ofu/eSto63trbWt2/r9++PqraOt7uH8+Or9rbWt7a3yo/St/vrq/Pvm4OGtta3Y5+77r+7h5uLu46/m/K/k4eD44a/p4P2v5vv8r+3j7uzkr+7h66/45+b76q/s4OPg/a/u4euv6u77/K/t7uLt4OCwraOt7q21rd/u4evuraOt7a21rcPm4OGto63u4fz46v2tta3urfKj9K3++ur8++bg4a21rdjn7vuv5vyv++fqr+Hu++bg4e7jr+7h5uLu46/g6a/M7uHu6+6wraOt7q21rc3q7vnq/a2jre2tta3C4OD86q2jre7h/Pjq/a21re6t8qP0rf766vz75uDhrbWt2Ofm7Oev7uHm4u7jr+zu4a/s5+7h6Oqv5vv8r+zg4+D9r/vgr+Lu++znr+b7/K/8+v394Prh6+bh6Pywr62jre6tta3M5+7i6uPq4OGto63trbWtwPz7/ebs562jre7h/Pjq/a21re6t8qP0rf766vz75uDhrbWt2Ofm7Oev7uHm4u7jr+b8r+Th4Pjhr+ng/a/m+/yv7u3m4+b79q/74K/s7uLg+unj7ujqr+7h66/s5+7h6Oqv7ODj4P38sK2jre6tta3M5+7i6uPq4OGto63trbWtyOD95uPj7q2jre7h/Pjq/a21re6t8tI=";
  static String jsonDe = TwBaseUtils.decrypt(jsonEn, QuizDatus.code);

  static dynamic dataA() {

    var tmp = jsonDecode(jsonDe);
    return tmp;
  }
}
