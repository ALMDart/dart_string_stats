import 'package:string_stats/src/processing_functions.dart';
import 'package:string_stats/src/utility_extensions.dart';

/// Facilitates performing word_count on a stream of strings.
class WordCounter {
  bool _inWord = false;
  int _count = 0;

  /// Count of words encountered thus far.
  int get count => _count;

  /// ignorePunctuation facilitates checking words that include symbols.
  WordCounter();

  /// Creates a counter and adds parameter string.
  WordCounter.fromString(String str) {
    add(str);
  }

  /// Add another string to be processed, returns the counts.
  /// ignorePunctuation facilitates checking words that include symbols.
  int add(String str, {bool ignorePunctuation = false}) {
    if (str.isEmpty) {
      _inWord = false;
      return _count;
    }

    _count += wordCount(str, inWord: _inWord);

    final lastChar = str[str.length - 1];
    var punctuationContinue = !ignorePunctuation && !lastChar.isPunctuation;
    if (lastChar.isChar && !lastChar.isWhiteSpace && punctuationContinue) {
      _inWord = true;
    } else {
      _inWord = false;
    }
    return _count;
  }
}
