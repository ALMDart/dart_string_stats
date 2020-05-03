import 'package:string_stats/src/utility_functions.dart';
import 'package:string_stats/src/utility_extensions.dart';

/// Determines the number of lines that are non-empty.
int nonEmptyLineCount(String str) {
  var _nonEmptyLineCount = 0;
  str.where((e) => !e.isWhiteSpace).length;
  for (var i = 1; i < str.length; i++) {
    if (str[i] == '\n' && str[i - 1] != '\n') {
      _nonEmptyLineCount++;
    }
  }
  return _nonEmptyLineCount;
}
