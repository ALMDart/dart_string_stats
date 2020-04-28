import 'package:string_stats/src/utils.dart';

int emptyLineCount(String str) {
  if (isNull(str) || str.isEmpty) return 0;
  var _emptyLineCount = 0;
  for (var i = 0; i < str.length; i++) {
    if (str[i] == '\n') {
      if (i == 0) {
        _emptyLineCount++;
      } else if (str[i - 1] == '\n') {
        _emptyLineCount++;
      }
    }
  }
  return _emptyLineCount;
}
