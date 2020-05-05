import 'package:string_stats/src/utility_extensions.dart';

/// Determines the frequency of char in str.
///
/// filterNonChars removes non-chars from count.
int charFrequency(String str, String char, {bool filterNonChars = true}) {
  if (char.length != 1) return 0;
  if (filterNonChars && !char.isChar) return 0;
  final charCode = char.codeUnitAt(0);
  return str.runes.where((rune) => rune == charCode).length;
}
