import 'package:string_stats/src/processing_functions.dart';
import 'package:string_stats/src/utils.dart';

class WordCounter {
  int _count = 0;
  bool _inWord = false;
  int get count => _count;

  WordCounter();

  WordCounter.fromString(String str) {
    add(str);
  }

  int add(String str) {
    if (str == null || str.isEmpty) {
      _inWord = false;
      return _count;
    }

    _count += wordCount(str, inWord: _inWord);

    final lastChar = str.runes.last;
    if (isCharNotSpace(lastChar)) {
      _inWord = true;
    }
    return _count;
  }
}
