import 'package:string_stats/src/utils.dart';

int nonEmptyLineCount(String str) {
  if (isNull(str) || str.isEmpty) return 0;
  var _nonEmptyLineCount = 0;
  for (var i = 1; i < str.length; i++) {
    if (str[i] == '\n' && str[i - 1] != '\n') {
      _nonEmptyLineCount++;
    }
  }
  return _nonEmptyLineCount;
}
