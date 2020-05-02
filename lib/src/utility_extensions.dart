import 'package:string_stats/src/utility_functions.dart' as utils;

extension StringTests on String {
  bool isNumeric() => runes.every(utils.isNumeric);

  bool isPunctuation() => runes.every(utils.isPunctuation);

  bool isChar() => runes.every(utils.isChar);

  bool isWhiteSpace() => runes.every(utils.isWhiteSpace);

  String generateUnicodeString(int length) => utils.generateUnicodeString(length);
}
