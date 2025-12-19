import 'dart:convert';

import 'package:c143/tw_base/tw_gj/base_utils.dart';

import 'data.dart';

class Science {
  static const String category = "Science";

  // static const data = [
  //   {
  //     "question": "What is the fundamental unit of life?",
  //     "a": "Cell",
  //     "b": "Organ",
  //     "answer": "a",
  //   },
  //   {
  //     "question":
  //         "What is the smallest unit of an element that retains its chemical properties?",
  //     "a": "Atom",
  //     "b": "Electron",
  //     "answer": "a",
  //   },
  //   {
  //     "question": "What is the largest planet in our solar system?",
  //     "a": "Neptune",
  //     "b": "Jupiter",
  //     "answer": "b",
  //   },
  //   {
  //     "question":
  //         "Which of the following is a natural satellite of the Earth? ",
  //     "a": "Moon",
  //     "b": "Venus",
  //     "answer": "a",
  //   },
  //
  //   {
  //     "question": "What is the scientific study of heredity called?",
  //     "a": "Evolution",
  //     "b": "Genetics",
  //     "answer": "b",
  //   },
  //   {
  //     "question": "What is the SI unit of force?",
  //     "a": "Newton",
  //     "b": "Joule",
  //     "answer": "a",
  //   },
  //   {
  //     "question": "What is the pH of pure water?",
  //     "a": "7",
  //     "b": "14",
  //     "answer": "a",
  //   },
  //   {
  //     "question":
  //         "What is the force that opposes the motion of objects through a fluid called?",
  //     "a": "Gravity",
  //     "b": "Drag",
  //     "answer": "b",
  //   },
  //   {
  //     "question": "What element is the most abundant in the Earth's crust?",
  //     "a": "Oxygen",
  //     "b": "Silicon",
  //     "answer": "a",
  //   },
  //   {
  //     "question": "Which of the following is NOT a primary color?",
  //     "a": "Green",
  //     "b": "Yellow",
  //     "answer": "a",
  //   },
  //   {
  //     "question": "What is the largest organ in the human body?",
  //     "a": "Skin",
  //     "b": "Brain",
  //     "answer": "a",
  //   },
  //   {
  //     "question":
  //         "What is the study of the interactions between organisms and their environment called?",
  //     "a": "Evolution",
  //     "b": "Ecology",
  //     "answer": "b",
  //   },
  //   {
  //     "question": "What is the hottest planet in our solar system?",
  //     "a": "Venus",
  //     "b": "Jupiter",
  //     "answer": "a",
  //   },
  //   {
  //     "question":
  //         "What is the process by which a substance changes from a gas to a liquid called?",
  //     "a": "Condensation",
  //     "b": "Melting",
  //     "answer": "a",
  //   },
  //   {
  //     "question":
  //         "What is the process by which an organism produces offspring called?",
  //     "a": "Reproduction",
  //     "b": "Development",
  //     "answer": "a",
  //   },
  //   {
  //     "question": "What is the unit of measurement for electric current?",
  //     "a": "Ampere",
  //     "b": "Ohm",
  //     "answer": "a",
  //   },
  // ];

  static const jsonEn =
      "1PSt/vrq/Pvm4OGtta3Y5+77r+b8r/vn6q/p+uHr7uLq4fvu46/64eb7r+Dpr+Pm6eqwraOt7q21rczq4+Oto63trbWtwP3o7uGto63u4fz46v2tta3urfKj9K3++ur8++bg4a21rdjn7vuv5vyv++fqr/zi7uPj6vz7r/rh5vuv4Omv7uGv6uPq4urh+6/75+77r/3q++7m4fyv5vv8r+zn6uLm7O7jr//94P/q/fvm6vywraOt7q21rc774OKto63trbWtyuPq7Pv94OGto63u4fz46v2tta3urfKj9K3++ur8++bg4a21rdjn7vuv5vyv++fqr+Pu/ejq/Puv/+Pu4er7r+bhr+D6/a/84OPu/a/89vz76uKwraOt7q21rcHq//v64eqto63trbWtxfr/5vvq/a2jre7h/Pjq/a21re2t8qP0rf766vz75uDhrbWt2Ofm7Oev4Omv++fqr+ng4+Pg+Obh6K/m/K/ur+Hu+/r97uOv/O776uPj5vvqr+Dpr/vn6q/K7v3757CvraOt7q21rcLg4OGto63trbWt2erh+vyto63u4fz46v2tta3urfKj9K3++ur8++bg4a21rdjn7vuv5vyv++fqr/zs5urh++bp5uyv/Pv66/av4Omv5+r96uvm+/av7O7j4+rrsK2jre6tta3K+eDj+vvm4OGto63trbWtyOrh6vvm7Pyto63u4fz46v2tta3trfKj9K3++ur8++bg4a21rdjn7vuv5vyv++fqr9zGr/rh5vuv4Omv6eD97OqwraOt7q21rcHq+Pvg4a2jre2tta3F4Prj6q2jre7h/Pjq/a21re6t8qP0rf766vz75uDhrbWt2Ofu+6/m/K/75+qv/8ev4Omv//r96q/47vvq/bCto63urbWtuK2jre2tta2+u62jre7h/Pjq/a21re6t8qP0rf766vz75uDhrbWt2Ofu+6/m/K/75+qv6eD97Oqv++fu+6/g///g/Or8r/vn6q/i4Pvm4OGv4Omv4O3l6uz7/K/75/3g+ujnr+6v6eP65uuv7O7j4+rrsK2jre6tta3I/e755vv2raOt7a21rcv97uito63u4fz46v2tta3trfKj9K3++ur8++bg4a21rdjn7vuv6uPq4urh+6/m/K/75+qv4uD8+6/u7frh6+7h+6/m4a/75+qvyu79++eo/K/s/fr8+7Cto63urbWtwPf26OrhraOt7a21rdzm4+bs4OGto63u4fz46v2tta3urfKj9K3++ur8++bg4a21rdjn5uznr+Dpr/vn6q/p4OPj4Pjm4eiv5vyvwcDbr+6v//3m4u799q/s4OPg/bCto63urbWtyP3q6uGto63trbWt1urj4+D4raOt7uH8+Or9rbWt7q3yo/St/vrq/Pvm4OGtta3Y5+77r+b8r/vn6q/j7v3o6vz7r+D96O7hr+bhr/vn6q/n+uLu4a/t4Ov2sK2jre6tta3c5ObhraOt7a21rc397ubhraOt7uH8+Or9rbWt7q3yo/St/vrq/Pvm4OGtta3Y5+77r+b8r/vn6q/8+/rr9q/g6a/75+qv5uH76v3u7Pvm4OH8r+3q+/jq6uGv4P3o7uHm/OL8r+7h66/75+rm/a/q4fnm/eDh4urh+6/s7uPj6uuwraOt7q21rcr54OP6++bg4a2jre2tta3K7ODj4Oj2raOt7uH8+Or9rbWt7a3yo/St/vrq/Pvm4OGtta3Y5+77r+b8r/vn6q/n4Pv76vz7r//j7uHq+6/m4a/g+v2v/ODj7v2v/Pb8++risK2jre6tta3Z6uH6/K2jre2tta3F+v/m++r9raOt7uH8+Or9rbWt7q3yo/St/vrq/Pvm4OGtta3Y5+77r+b8r/vn6q///eDs6vz8r+32r/jn5uznr+6v/Prt/Pvu4ezqr+zn7uHo6vyv6f3g4q/ur+ju/K/74K/ur+Pm/vrm66/s7uPj6uuwraOt7q21rczg4evq4fzu++bg4a2jre2tta3C6uP75uHoraOt7uH8+Or9rbWt7q3yo/St/vrq/Pvm4OGtta3Y5+77r+b8r/vn6q///eDs6vz8r+32r/jn5uznr+7hr+D96O7h5vzir//94Ov67Or8r+Dp6fz//ebh6K/s7uPj6uuwraOt7q21rd3q//3g6/rs++bg4a2jre2tta3L6vnq4+D/4urh+62jre7h/Pjq/a21re6t8qP0rf766vz75uDhrbWt2Ofu+6/m/K/75+qv+uHm+6/g6a/i6u78+v3q4urh+6/p4P2v6uPq7Pv95uyv7Pr9/erh+7Cto63urbWtzuL/6v3qraOt7a21rcDn4q2jre7h/Pjq/a21re6t8tI=";

  static String jsonDe = TwBaseUtils.decrypt(jsonEn, QuizDatus.code);

  static dynamic dataA() {
    var tmp = jsonDecode(jsonDe);
    return tmp;
  }
}
