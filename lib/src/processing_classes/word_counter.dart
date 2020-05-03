import 'package:string_stats/src/processing_functions.dart';
import 'package:string_stats/src/utility_extensions.dart';

/// Facilitates performing word_count on a stream of strings.
class WordCounter {
  bool _inWord = false;
  int _count = 0;
  /// Count of words encountered thus far.
  int get count => _count;

  final _ignorePunctuation;

  /// ignorePunctuation facilitates checking words that include symbols.
  WordCounter({bool ignorePunctuation = false})
      : _ignorePunctuation = ignorePunctuation;

  /// Creates a counter and adds parameter string.
  /// ignorePunctuation facilitates checking words that include symbols.
  WordCounter.fromString(String str, {bool ignorePunctuation = false})
      : _ignorePunctuation = ignorePunctuation {
    add(str);
  }

  /// Add another string to be processed, returns the counts.
  int add(String str) {
    if (str == null || str.isEmpty) {
      _inWord = false;
      return _count;
    }

    _count += wordCount(str, inWord: _inWord);

    final lastChar = str[str.length - 1];
    var punctuationContinue = !_ignorePunctuation && !lastChar.isPunctuation;
    if (lastChar.isChar && !lastChar.isWhiteSpace && punctuationContinue) {
      _inWord = true;
    }
    return _count;
  }
}
