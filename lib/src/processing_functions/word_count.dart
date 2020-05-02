import 'package:string_stats/src/utility_extensions.dart';

int wordCount(String str, { bool inWord = false, bool ignorePunctuation = false }) {
  var _wordCount = 0;
  var _inWord = inWord;
  for(var i = 0; i < str.length; i++) {
    var tChar = str[i];
    var punctuationContinue = !ignorePunctuation && !tChar.isPunctuation();
    if (tChar.isChar() && !tChar.isWhiteSpace() && punctuationContinue) {
      if (_inWord == false) {
        _inWord = true;
      }
    } else {
      if (_inWord) _wordCount++;
      _inWord = false;
    }
  }
  if (_inWord) _wordCount++;
  return _wordCount;
}
