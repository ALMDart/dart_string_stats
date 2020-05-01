import 'package:string_stats/src/utils.dart';

int wordCount(String str, {bool inWord = false}) {
  var _wordCount = 0;
  var _inWord = inWord;
  var _hasSeenWhiteSpace = false;
  for (final rune in str.runes) {
    if (isCharNotSpace(rune)) {
      if (_inWord == false) {
        _inWord = true;
      }
    } else {
      if (_inWord) _wordCount++;
      _hasSeenWhiteSpace = true;
      _inWord = false;
    }
  }
  if (_inWord && _hasSeenWhiteSpace) _wordCount++;
  return _wordCount;
}
