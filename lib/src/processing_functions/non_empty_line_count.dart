import 'package:string_stats/src/utility_functions.dart';

int nonEmptyLineCount(String str) {
  var _nonEmptyLineCount = 0;
  for (var i = 1; i < str.length; i++) {
    if (str[i] == '\n' && str[i - 1] != '\n') {
      _nonEmptyLineCount++;
    }
  }
  return _nonEmptyLineCount;
}
