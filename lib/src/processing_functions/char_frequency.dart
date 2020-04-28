import 'package:string_stats/src/utils.dart';

int charFrequency(String str, String char) {
  if (isNull(str) || isNull(char) || str.isEmpty || char.length != 1) return 0;
  final charCode = char.codeUnitAt(0);
  return str.runes.where((rune) => rune == charCode).length;
}
