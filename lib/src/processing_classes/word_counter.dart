import 'package:string_stats/src/processing_functions.dart';
import 'package:string_stats/src/utility_extensions.dart';

class WordCounter {
  int _count = 0;
  bool _inWord = false;
  int get count => _count;

  final _ignorePunctuation;
  WordCounter({bool ignorePunctuation = false})
      : _ignorePunctuation = ignorePunctuation;

  WordCounter.fromString(String str, {bool ignorePunctuation = false})
      : _ignorePunctuation = ignorePunctuation {
    add(str);
  }

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
