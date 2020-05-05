import 'package:string_stats/src/utility_functions.dart' as utils;

extension StringTests on String {
  Iterable<String> where(bool Function(String) f) {
    final filtered = runes.where((e) => f(String.fromCharCode(e))).toList();
    return Iterable<String>.generate(filtered.length, (index) {
      return String.fromCharCode(filtered[index]);
    });
  }

  bool get isNumeric => runes.every(utils.isNumeric);

  bool get isPunctuation => runes.every(utils.isPunctuation);

  bool get isChar => runes.every(utils.isChar);

  bool get isWhiteSpace => runes.every(utils.isWhiteSpace);

  String generateUnicodeString(int length) =>
      utils.generateUnicodeString(length);
}
