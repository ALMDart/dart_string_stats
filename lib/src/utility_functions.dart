import 'dart:math';
import 'package:string_stats/src/constants.dart';

final ran = Random(DateTime.now().millisecondsSinceEpoch);

// Check if the parameter character is a number
bool isNumeric(int char) {
  return char >= NUMBER_RANGE_LOW && char <= NUMBER_RANGE_HIGH;
}

// Check if the parameter character is punctuation
bool isPunctuation(int char) {
  return (char >= PUNCTUATION_RANGE_ONE_LOW &&
          char <= PUNCTUATION_RANGE_ONE_HIGH) ||
      (char >= PUNCTUATION_RANGE_TWO_LOW &&
          char <= PUNCTUATION_RANGE_TWO_HIGH) ||
      (char >= PUNCTUATION_RANGE_THREE_LOW &&
          char <= PUNCTUATION_RANGE_THREE_HIGH) ||
      (char >= PUNCTUATION_RANGE_FOUR_LOW &&
          char <= PUNCTUATION_RANGE_FOUR_HIGH);
}

// Check if the parameter character is a char.
// Defined as not null and above the special character range.
bool isChar(int char) {
  return char >= CHARACTER_RANGE_LOW;
}

// Check if parameter character code point is white space.
// Defined using regular expression /\s/.
bool isWhiteSpace(int char) =>
    RegExp(r'\s').hasMatch(String.fromCharCode(char));

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
