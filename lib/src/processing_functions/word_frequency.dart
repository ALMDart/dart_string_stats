import 'package:string_stats/src/utility_extensions.dart';

/// Determines the frequency of word within string.
///
/// lastPos allows for incremental counting of a string over multiple calls
/// by passing what remained of a word from a previous string.
///
/// ignorePunctuation facilitates checking words that include symbols.
int wordFrequency(String str, String word,
    {int lastPos = 0, bool ignorePunctuation = false}) {
  var _wordFrequency = 0;
  final stringLength = str.length;
  final wordLength = word.length;
  var j = lastPos;
  for (var i = 0; i < stringLength; i++) {
    for (; j + i - lastPos < stringLength && j < wordLength; j++) {
      // If first character in string is a space or punctuation, skip
      var punctuationContinue = !ignorePunctuation && str[i].isPunctuation;
      if (i == 0 && (str[i].isWhiteSpace || punctuationContinue)) break;

      // If first letter in match and last letter was not a space or punctuation, skip
      if (j == 0 &&
          i > 0 &&
          !str[i - 1].isWhiteSpace &&
          (!ignorePunctuation && !str[i - 1].isPunctuation)) break;

      // If the letters dont match in order, break
      if (word[j] != str[j + i - lastPos]) {
        break;
      }

      final lastSpot = i + j + 1 - lastPos;
      if (j == wordLength - 1 &&
          (lastSpot == stringLength ||
              str[lastSpot].isWhiteSpace ||
              (!ignorePunctuation && str[lastSpot].isPunctuation) ||
              !str[lastSpot].isChar)) {
        _wordFrequency++;
        i += j - lastPos;
      }
    }
    lastPos = 0;
    j = 0;
  }
  return _wordFrequency;
}
