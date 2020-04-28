import 'package:string_stats/src/utils.dart';

int wordFrequency(String str, String word, {int lastPos = 0}) {
  if (isNull(str) || isNull(word) || isNull(lastPos) || str.isEmpty || word.isEmpty) return 0;
  var _wordFrequency = 0;
  final stringLength = str.length;
  final wordLength = word.length;
  var j = lastPos;
  for (var i = 0; i < stringLength; i++) {
    for (; j + i - lastPos < stringLength && j < wordLength; j++) {
      // If first character in string is a space, skip
      if (i == 0 && isWhiteSpace(str[i])) break;

      // If first letter in match and last letter was not a space, skip
      if (j == 0 && i > 0 && !isWhiteSpace(str[i - 1])) break;

      // If the letters dont match in order, break
      if (word.codeUnitAt(j) != str.codeUnitAt(j + i - lastPos)) {
        break;
      }

      final lastSpot = i + j + 1 - lastPos;
      if (j == wordLength - 1 &&
          (lastSpot == stringLength ||
              isWhiteSpace(str[lastSpot]) ||
              !isChar(str[lastSpot].codeUnitAt(0)))) {
        _wordFrequency++;
        i += j - lastPos;
      }
    }
    lastPos = 0;
    j = 0;
  }
  return _wordFrequency;
}
