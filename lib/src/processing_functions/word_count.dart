import 'package:string_stats/src/utility_extensions.dart';

/// Finds the number of words in str
///
/// inWord allows for incremental counting of a string over multiple calls, and
/// prevents double counting by telling function it's still in a word.
///
/// ignorePunctuation facilitates checking words that include symbols.
int wordCount(String str, { bool inWord = false, bool ignorePunctuation = false }) {
  var _wordCount = 0;
  var _inWord = inWord;
  for(var i = 0; i < str.length; i++) {
    final tChar = str[i];
    final punctuationContinue = !ignorePunctuation && !tChar.isPunctuation;
    if (tChar.isChar && !tChar.isWhiteSpace && punctuationContinue) {
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
