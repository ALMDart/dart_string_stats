import 'dart:math';
import 'package:string_stats/src/constants.dart';

final ran = Random(DateTime.now().millisecondsSinceEpoch);

// Check if the parameter object is null.
bool isNull(Object obj) {
  return obj == null;
}

// Check if the parameter object is a number
bool isNumeric(int char) {
  return !isNull(char) && char >= NUMBER_RANGE_LOW && char <= NUMBER_RANGE_HIGH;
}

// Check if the parameter character is a char.
// Defined as not null and above the special character range.
bool isChar(int char) {
  return !isNull(char) && char >= CHARACTER_RANGE_LOW;
}

// Check if parameter character code point is white space.
// Defined using regular expression /\s/.
bool isWhiteSpaceCodePoint(int char) =>
    !isNull(char) && RegExp(r'\s').hasMatch(String.fromCharCode(char));

// Check if parameter string is composed of only white space code points.
// Utilizes isWhiteSpaceCodePoint.
bool isWhiteSpace(String str) =>
    !isNull(str) && str.runes.every(isWhiteSpaceCodePoint);

// Check if parameter character is a character code point and not white space.
bool isCharNotSpace(int char) {
  return isChar(char) && !isWhiteSpaceCodePoint(char);
}

// Generate a random unicode string of given length.
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
