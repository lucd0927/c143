
import 'dart:convert';

import 'package:c143/tw_base/tw_gj/base_utils.dart';

import 'data.dart';

class Nature{
  static const String category = "Nature";
  // static const data = [
  //   {
  //     "question": "What is the chemical symbol for gold?",
  //     "a": "Ag",
  //     "b": "Au",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the highest mountain on Earth?",
  //     "a": "Mount Fuji",
  //     "b": "Mount Everest",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "Which one is a fish?",
  //     "a": "carrot",
  //     "b": "goldfish",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the largest mammal on land？",
  //     "a": "Cell",
  //     "b": "Elephant",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the process by which water is turned into ice",
  //     "a": "Melting",
  //     "b": "Freezing",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the main gas that makes up the Earth's atmosphere?",
  //     "a": "Nitrogen",
  //     "b": "Oxygen",
  //     "answer": "a"
  //
  //   },
  //   {
  //     "question": "What is the process by which water changes from a liquid to a gas called?",
  //     "a": "Sublimation",
  //     "b": "Evaporation",
  //     "answer": "b"
  //   },
  //   // {
  //   //   "question": "What is the process by which water changes from a liquid to a gas called?",
  //   //   "a": "Condensation",
  //   //   "b": "Evaporation",
  //   //   "answer": "b"
  //   // },
  //   {
  //     "question": "What is the name for a group of whales?",
  //     "a": "Pod",
  //     "b": "Flock",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What is the largest organ in the human body?",
  //     "a": "Brain",
  //     "b": "Skin",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "Which one is an amphibian?",
  //     "a": "frog",
  //     "b": "butterfly",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What is the primary gas responsible for climate change?",
  //     "a": "Carbon dioxide",
  //     "b": "Methane",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "Which one is a marine mammal?",
  //     "a": "elephant",
  //     "b": "dolphin",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the process of a liquid turning into a gas called?",
  //     "a": "Evaporation",
  //     "b": "Precipitation",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "Which is the planet that is closest to the Sun?",
  //     "a": "Mercury",
  //     "b": "Venus",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "Which one is a source of honey?",
  //     "a": "spider",
  //     "b": "bee",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "Which one is a migratory bird?",
  //     "a": "pigeon",
  //     "b": "swan",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "Which planet is known as the \"Red Planet\"?",
  //     "a": "Venus",
  //     "b": "Mars",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What does the sun provide us with?",
  //     "a": "Food",
  //     "b": "Light and heat",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "Which animal lives in water and on land?",
  //     "a": "Fish",
  //     "b": "Frog",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the name for a group of bees?",
  //     "a": "Herd",
  //     "b": "Swarm",
  //     "answer": "b"
  //   },
  //
  //   {
  //     "question": "What animal lives in trees and builds nests?",
  //     "a": "Mouse",
  //     "b": "Squirrel",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What gas do we breathe in?",
  //     "a": "Oxygen",
  //     "b": "Carbon dioxide",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What is the unit of measurement for electrical resistance?",
  //     "a": "Volt",
  //     "b": "Ohm",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "How do plants make food?",
  //     "a": "Rainwater",
  //     "b": "Photosynthesis",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "Which animal has a long neck?",
  //     "a": "Elephant",
  //     "b": "Giraffe",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "Which animal grows new antlers every year?",
  //     "a": "Lion",
  //     "b": "Deer",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "Which animal uses feathers to fly?",
  //     "a": "Mosquito",
  //     "b": "Bird",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the largest planet in our solar system?",
  //     "a": "Venus",
  //     "b": "Jupiter",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "Which plant can be used to make paper?",
  //     "a": "Rose",
  //     "b": "Trees",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the outermost layer of the Earth's atmosphere called?",
  //     "a": "Thermosphere",
  //     "b": "Stratosphere",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "Which animal swims in water using its tail?",
  //     "a": "Fish",
  //     "b": "Cat",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What is the largest moon in our solar system?",
  //     "a": "Titan",
  //     "b": "Ganymede",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "What is the name for a group of fish?",
  //     "a": "Flock",
  //     "b": "School",
  //     "answer": "b"
  //   },
  //   {
  //     "question": "Which animal is covered in scales?",
  //     "a": "Snake",
  //     "b": "Dog",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "Which animal sprays water through a blowhole?",
  //     "a": "Whale",
  //     "b": "Dolphin",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "Which animal lives in trees and builds beehives?",
  //     "a": "Bee",
  //     "b": "Ant",
  //     "answer": "a"
  //   },
  //   {
  //     "question": "What is the unit of measurement for sound intensity?",
  //     "a": "Watt",
  //     "b": "Decibel",
  //     "answer": "b"
  //   }
  // ];

  static const jsonEn =
"1PSt/vrq/Pvm4OGtta3Y5+77r+b8r/vn6q/s5+ri5uzu46/89uLt4OOv6eD9r+jg4+uwraOt7q21rc7oraOt7a21rc76raOt7uH8+Or9rbWt7a3yo/St/vrq/Pvm4OGtta3Y5+77r+b8r/vn6q/n5ujn6vz7r+Lg+uH77ubhr+Dhr8ru/fvnsK2jre6tta3C4Prh+6/J+uXmraOt7a21rcLg+uH7r8r56v3q/Puto63u4fz46v2tta3trfKj9K3++ur8++bg4a21rdjn5uznr+Dh6q/m/K/ur+nm/OewraOt7q21rezu/f3g+62jre2tta3o4OPr6eb8562jre7h/Pjq/a21re2t8qP0rf766vz75uDhrbWt2Ofu+6/m/K/75+qv4+796Or8+6/i7uLi7uOv4OGv4+7h62AzEK2jre6tta3M6uPjraOt7a21rcrj6v/n7uH7raOt7uH8+Or9rbWt7a3yo/St/vrq/Pvm4OGtta3Y5+77r+b8r/vn6q///eDs6vz8r+32r/jn5uznr/ju++r9r+b8r/v6/eHq66/m4fvgr+bs6q2jre6tta3C6uP75uHoraOt7a21rcn96ur15uHoraOt7uH8+Or9rbWt7a3yo/St/vrq/Pvm4OGtta3Y5+77r+b8r/vn6q/i7ubhr+ju/K/75+77r+Lu5Or8r/r/r/vn6q/K7v3756j8r+774uD8/+fq/eqwraOt7q21rcHm+/3g6OrhraOt7a21rcD39ujq4a2jre7h/Pjq/a21re6t8qP0rf766vz75uDhrbWt2Ofu+6/m/K/75+qv//3g7Or8/K/t9q/45+bs56/47vvq/a/s5+7h6Or8r+n94OKv7q/j5v765uuv++Cv7q/o7vyv7O7j4+rrsK2jre6tta3c+u3j5uLu++bg4a2jre2tta3K+e7/4P3u++bg4a2jre7h/Pjq/a21re2t8qP0rf766vz75uDhrbWt2Ofu+6/m/K/75+qv4e7i6q/p4P2v7q/o/eD6/6/g6a/45+7j6vywraOt7q21rd/g662jre2tta3J4+Ds5K2jre7h/Pjq/a21re6t8qP0rf766vz75uDhrbWt2Ofu+6/m/K/75+qv4+796Or8+6/g/eju4a/m4a/75+qv5/ri7uGv7eDr9rCto63urbWtzf3u5uGto63trbWt3OTm4a2jre7h/Pjq/a21re2t8qP0rf766vz75uDhrbWt2Ofm7Oev4OHqr+b8r+7hr+7i/+fm7ebu4bCto63urbWt6f3g6K2jre2tta3t+vv76v3p4/ato63u4fz46v2tta3urfKj9K3++ur8++bg4a21rdjn7vuv5vyv++fqr//95uLu/fav6O78r/3q/P/g4fzm7ePqr+ng/a/s4+bi7vvqr+zn7uHo6rCto63urbWtzO797eDhr+vm4Pfm6+qto63trbWtwur75+7h6q2jre7h/Pjq/a21re6t8qP0rf766vz75uDhrbWt2Ofm7Oev4OHqr+b8r+6v4u795uHqr+Lu4uLu47Cto63urbWt6uPq/+fu4futo63trbWt6+Dj/+fm4a2jre7h/Pjq/a21re2t8qP0rf766vz75uDhrbWt2Ofu+6/m/K/75+qv//3g7Or8/K/g6a/ur+Pm/vrm66/7+v3h5uHor+bh++Cv7q/o7vyv7O7j4+rrsK2jre6tta3K+e7/4P3u++bg4a2jre2tta3f/ers5v/m++775uDhraOt7uH8+Or9rbWt7q3yo/St/vrq/Pvm4OGtta3Y5+bs56/m/K/75+qv/+Pu4er7r/vn7vuv5vyv7OPg/Or8+6/74K/75+qv3PrhsK2jre6tta3C6v3s+v32raOt7a21rdnq4fr8raOt7uH8+Or9rbWt7q3yo/St/vrq/Pvm4OGtta3Y5+bs56/g4eqv5vyv7q/84Pr97Oqv4Omv5+Dh6vawraOt7q21rfz/5uvq/a2jre2tta3t6uqto63u4fz46v2tta3trfKj9K3++ur8++bg4a21rdjn5uznr+Dh6q/m/K/ur+Lm6P3u++D99q/t5v3rsK2jre6tta3/5ujq4OGto63trbWt/Pju4a2jre7h/Pjq/a21re2t8qP0rf766vz75uDhrbWt2Ofm7Oev/+Pu4er7r+b8r+Th4Pjhr+78r/vn6q/Trd3q66/f4+7h6vvTrbCto63urbWt2erh+vyto63trbWtwu79/K2jre7h/Pjq/a21re2t8qP0rf766vz75uDhrbWt2Ofu+6/r4Or8r/vn6q/8+uGv//3g+ebr6q/6/K/45vvnsK2jre6tta3J4ODrraOt7a21rcPm6Of7r+7h66/n6u77raOt7uH8+Or9rbWt7a3yo/St/vrq/Pvm4OGtta3Y5+bs56/u4ebi7uOv4+b56vyv5uGv+O776v2v7uHrr+Dhr+Pu4euwraOt7q21rcnm/Oeto63trbWtyf3g6K2jre7h/Pjq/a21re2t8qP0rf766vz75uDhrbWt2Ofu+6/m/K/75+qv4e7i6q/p4P2v7q/o/eD6/6/g6a/t6ur8sK2jre6tta3H6v3rraOt7a21rdz47v3iraOt7uH8+Or9rbWt7a3yo/St/vrq/Pvm4OGtta3Y5+77r+7h5uLu46/j5vnq/K/m4a/7/erq/K/u4euv7frm4+v8r+Hq/Pv8sK2jre6tta3C4Pr86q2jre2tta3c/vrm/f3q462jre7h/Pjq/a21re2t8qP0rf766vz75uDhrbWt2Ofu+6/o7vyv6+Cv+Oqv7f3q7vvn6q/m4bCto63urbWtwPf26OrhraOt7a21rczu/e3g4a/r5uD35uvqraOt7uH8+Or9rbWt7q3yo/St/vrq/Pvm4OGtta3Y5+77r+b8r/vn6q/64eb7r+Dpr+Lq7vz6/eri6uH7r+ng/a/q4+rs+/3m7O7jr/3q/Ob8++7h7OqwraOt7q21rdng4/uto63trbWtwOfiraOt7uH8+Or9rbWt7a3yo/St/vrq/Pvm4OGtta3H4Piv6+Cv/+Pu4fv8r+Lu5Oqv6eDg67Cto63urbWt3e7m4fju++r9raOt7a21rd/n4Pvg/Pbh++fq/Ob8raOt7uH8+Or9rbWt7a3yo/St/vrq/Pvm4OGtta3Y5+bs56/u4ebi7uOv5+78r+6v4+Dh6K/h6uzksK2jre6tta3K4+r/5+7h+62jre2tta3I5v3u6enqraOt7uH8+Or9rbWt7a3yo/St/vrq/Pvm4OGtta3Y5+bs56/u4ebi7uOv6P3g+Pyv4er4r+7h++Pq/fyv6vnq/fav9uru/bCto63urbWtw+bg4a2jre2tta3L6ur9raOt7uH8+Or9rbWt7a3yo/St/vrq/Pvm4OGtta3Y5+bs56/u4ebi7uOv+vzq/K/p6u775+r9/K/74K/p4/awraOt7q21rcLg/P765vvgraOt7a21rc3m/euto63u4fz46v2tta3trfKj9K3++ur8++bg4a21rdjn7vuv5vyv++fqr+Pu/ejq/Puv/+Pu4er7r+bhr+D6/a/84OPu/a/89vz76uKwraOt7q21rdnq4fr8raOt7a21rcX6/+b76v2to63u4fz46v2tta3trfKj9K3++ur8++bg4a21rdjn5uznr//j7uH7r+zu4a/t6q/6/Orrr/vgr+Lu5Oqv/+7/6v2wraOt7q21rd3g/Oqto63trbWt2/3q6vyto63u4fz46v2tta3trfKj9K3++ur8++bg4a21rdjn7vuv5vyv++fqr+D6++r94uD8+6/j7vbq/a/g6a/75+qvyu79++eo/K/u++Lg/P/n6v3qr+zu4+Pq67Cto63urbWt2+fq/eLg/P/n6v3qraOt7a21rdz7/e774Pz/5+r96q2jre7h/Pjq/a21re6t8qP0rf766vz75uDhrbWt2Ofm7Oev7uHm4u7jr/z45uL8r+bhr/ju++r9r/r85uHor+b7/K/77ubjsK2jre6tta3J5vznraOt7a21rczu+62jre7h/Pjq/a21re6t8qP0rf766vz75uDhrbWt2Ofu+6/m/K/75+qv4+796Or8+6/i4ODhr+bhr+D6/a/84OPu/a/89vz76uKwraOt7q21rdvm++7hraOt7a21rcju4fbi6uvqraOt7uH8+Or9rbWt7a3yo/St/vrq/Pvm4OGtta3Y5+77r+b8r/vn6q/h7uLqr+ng/a/ur+j94Pr/r+Dpr+nm/OewraOt7q21rcnj4OzkraOt7a21rdzs5+Dg462jre7h/Pjq/a21re2t8qP0rf766vz75uDhrbWt2Ofm7Oev7uHm4u7jr+b8r+zg+er96uuv5uGv/Ozu4+r8sK2jre6tta3c4e7k6q2jre2tta3L4Oito63u4fz46v2tta3urfKj9K3++ur8++bg4a21rdjn5uznr+7h5uLu46/8//3u9vyv+O776v2v++f94Pro56/ur+3j4Pjn4OPqsK2jre6tta3Y5+7j6q2jre2tta3L4OP/5+bhraOt7uH8+Or9rbWt7q3yo/St/vrq/Pvm4OGtta3Y5+bs56/u4ebi7uOv4+b56vyv5uGv+/3q6vyv7uHrr+365uPr/K/t6urn5vnq/LCto63urbWtzerqraOt7a21rc7h+62jre7h/Pjq/a21re6t8qP0rf766vz75uDhrbWt2Ofu+6/m/K/75+qv+uHm+6/g6a/i6u78+v3q4urh+6/p4P2v/OD64euv5uH76uH85vv2sK2jre6tta3Y7vv7raOt7a21rcvq7Obt6uOto63u4fz46v2tta3trfLS";
  static String jsonDe =  TwBaseUtils.decrypt(jsonEn,  DaTiShuju.code);
  static dynamic dataA(){
    var tmp = jsonDecode(jsonDe);
    return tmp;
  }
}