import 'package:string_stats/src/processing_functions.dart';
import 'package:string_stats/src/utility_extensions.dart';

/// Facilitates performing word_frequency on a stream of strings.
class WordFrequencyCounter {
  int _count = 0;

  /// Count of word encountered thus far.
  int get count => _count;
  int _lastPos = 0;
  final String _word;
  final _ignorePunctuation;

  /// word is the word to count
  /// ignorePunctuation facilitates checking words that include symbols.
  WordFrequencyCounter(String word, {bool ignorePunctuation = false})
      : _ignorePunctuation = ignorePunctuation,
        _word = word;

  /// Creates a counter and adds parameter string.
  /// word is the word to count
  /// ignorePunctuation facilitates checking words that include symbols.
  WordFrequencyCounter.fromString(String str, String word,
      {bool ignorePunctuation = false})
      : _ignorePunctuation = ignorePunctuation,
        _word = word {
    add(str);
  }

  /// Add another string to be processed, returns the counts.
  int add(String str) {
    if (str == null || str.isEmpty) {
      _lastPos = 0;
      return _count;
    }

    _count += wordFrequency(str, _word, lastPos: _lastPos);

    var start = str.length - _word.length;
    start = start < 0 ? 0 : start;
    var inWord;
    var j;
    for (var i = start; i < str.length; i++) {
      inWord = false;
      for (j = 0; j + i < str.length && j < _word.length; j++) {
        // If first character in string is a space, skip
        var punctuationContinue = !_ignorePunctuation && str[i].isPunctuation;
        if (i == 0 && (str[i].isWhiteSpace || punctuationContinue)) break;

        // If first letter in match and last letter was not a space or punctuation, skip
        if (j == 0 &&
            i > 0 &&
            !str[i - 1].isWhiteSpace &&
            (!_ignorePunctuation && !str[i - 1].isPunctuation)) break;


        // If the letters dont match in order, break
        if (_word.codeUnitAt(j) != str.codeUnitAt(j + i)) {
          break;
        }
        inWord = true;
      }
      i += j;
    }
    if (inWord) {
      _lastPos = j;
    } else {
      _lastPos = 0;
    }
    return _count;
  }
}
