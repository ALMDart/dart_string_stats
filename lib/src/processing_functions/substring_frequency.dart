import 'package:string_stats/src/utils.dart';

int subStringFrequency(String str, String substr, {int lastPos = 0}) {
  if (isNull(str) || isNull(substr) || isNull(lastPos) || str.isEmpty || substr.isEmpty) return 0;
  var _substrFrequency = 0;

  final stringLength = str.length;
  final substrLength = substr.length;
  var j = lastPos;
  for (var i = 0; i < stringLength; i++) {
    for (; j + i - lastPos < stringLength && j < substrLength; j++) {
      // If the letters dont match in order, break
      if (substr.codeUnitAt(j) != str.codeUnitAt(j + i - lastPos)) {
        break;
      }

      if (j == substrLength - 1) {
        _substrFrequency++;
        i += j - lastPos;
      }
    }
    j = 0;
    lastPos = 0;
  }
  return _substrFrequency;
}
