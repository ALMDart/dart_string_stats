import 'package:string_stats/src/utility_functions.dart' as utils;

extension StringTests on String {
  bool get isNumeric => runes.every(utils.isNumeric);

  bool get isPunctuation => runes.every(utils.isPunctuation);

  bool get isChar => runes.every(utils.isChar);

  bool get isWhiteSpace => runes.every(utils.isWhiteSpace);

  String generateUnicodeString(int length) => utils.generateUnicodeString(length);
}
