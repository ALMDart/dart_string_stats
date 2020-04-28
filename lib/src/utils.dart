import 'dart:math';

import 'package:string_stats/src/constants.dart';

final ran = Random(DateTime.now().millisecondsSinceEpoch);

bool isNull(Object obj) {
  return obj == null;
}

bool isChar(int char) {
  return !isNull(char) && char >= CHARACTER_RANGE_LOW;
}

bool isWhiteSpaceCodePoint(int char) =>
    !isNull(char) && RegExp(r'\s').hasMatch(String.fromCharCode(char));

bool isWhiteSpace(String str) =>
    !isNull(str) && str.runes.every(isWhiteSpaceCodePoint);

bool isCharNotSpace(int char) {
  return isChar(char) && char != CHARACTER_SPACE;
}

String generateUnicodeString(int length) {
  int ranInt() =>
      ran.nextInt(MAX_UNICODE_POINT - CHARACTER_RANGE_LOW + 1) +
      CHARACTER_RANGE_LOW;
  return String.fromCharCodes(() sync* {
    var i = 0;
    while (i++ < length) {
      yield ranInt();
    }
  }());
}
