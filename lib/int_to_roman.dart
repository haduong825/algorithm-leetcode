import 'dart:math';

class IntToRomanSolution {
  String intToRoman(int num) {
    final oneMap = {1: "I", 10: "X", 100: "C", 1000: "M"};
    final fiveMap = {5: "V", 50: "L", 500: "D"};
    final inputStr =
        num.toString().split('').reversed.map((e) => int.parse(e)).toList();
    var outputArray = List<String>.empty(growable: true);
    for (int i = 0; i < inputStr.length; i++) {
      if (inputStr[i] * pow(10, i) < (5 * pow(10, i) - pow(10, i))) {
        for (int j = 0; j < inputStr[i]; j++) {
          outputArray.add(oneMap[pow(10, i)] ?? "");
        }
      } else if (inputStr[i] * pow(10, i) < 9 * pow(10, i) &&
          inputStr[i] * pow(10, i) != (4 * pow(10, i))) {
        var tmpStr = "";
        tmpStr += fiveMap[5 * pow(10, i)] ?? "";
        for (int j = 0; j < inputStr[i] - 5; j++) {
          tmpStr += oneMap[pow(10, i)] ?? "";
        }

        outputArray.add(tmpStr);
      } else if (inputStr[i] * pow(10, i) == (4 * pow(10, i))) {
        outputArray.add("${oneMap[pow(10, i)]}${fiveMap[5 * pow(10, i)]}");
      } else if (inputStr[i] * pow(10, i) == (9 * pow(10, i))) {
        outputArray.add("${oneMap[pow(10, i)]}${oneMap[pow(10, i + 1)]}");
      } else if (inputStr[i] * pow(10, (i + 1)) == (5 * pow(10, (i + 1)))) {
        outputArray.add(fiveMap[5 * pow(10, i)] ?? "");
      }
    }

    return outputArray.reversed.reduce((value, element) => value + element);
  }

  String intToRoman2(int num) {
    final ones = ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"];
    final tens = ["", "X", "XX", "XXX", "XL", "L", "LX", "LXX", "LXXX", "XC"];
    final hrns = ["", "C", "CC", "CCC", "CD", "D", "DC", "DCC", "DCCC", "CM"];
    final ths = ["", "M", "MM", "MMM"];

    return ths[num ~/ 1000] +
        hrns[(num % 1000) ~/ 100] +
        tens[(num % 100) ~/ 10] +
        ones[num % 10];
  }
}
