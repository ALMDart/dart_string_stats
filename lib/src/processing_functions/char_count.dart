import 'package:string_stats/src/utility_functions.dart';

/// Counts the number of characters in str.
///
/// filterNonChars removes non-chars from count.
int charCount(String str, {bool filterNonChars = true}) {
  if(filterNonChars) {
    return str.runes.where(isChar).length;
  } else {
    return str.runes.length;
  }
}
