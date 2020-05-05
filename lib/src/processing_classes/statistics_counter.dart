import 'package:string_stats/src/processing_functions.dart';
import 'package:string_stats/string_stats.dart';

/// Facilitates collecting statistics on a stream of strings.
class StatisticsCounter {
  StringStatistics stats;
  bool _inWord = false;
  final StringBuffer _buffer = StringBuffer();

  StatisticsCounter();
  StatisticsCounter.fromString(String str) {
    add(str);
  }

  /// Add another string to be processed, returns the counts collection.
  /// filterNonChars removes non-chars from count.
  /// end indicates final word to flush buffers and finalize count.
  /// ignorePunctuation facilitates checking words that include symbols.
  StringStatistics add(String str,
      {bool ignorePunctuation = false,
      bool end = false,
      bool filterNonChars = true}) {
    if (stats == null) {
      stats = statistics(str,
          leftOvers: _buffer.toString(),
          continues: !end,
          ignorePunctuation: ignorePunctuation,
          inWord: _inWord,
          filterNonChars: filterNonChars);
    } else {
      stats = stats.combine(statistics(str,
          leftOvers: _buffer.toString(),
          continues: !end,
          ignorePunctuation: ignorePunctuation,
          inWord: _inWord,
          filterNonChars: filterNonChars));
    }
    for (var i = str.length - 1; i >= 0; i--) {
      if (str[i].isWhiteSpace || (!ignorePunctuation && str[i].isPunctuation)) {
          _buffer.clear();
        if (i != str.length - 1) {
          _buffer.write(str.substring(i + 1));
        }
        break;
      }
      if (i == 0) {
        _buffer.write(str);
      }
    }

    final lastChar = str[str.length - 1];
    var punctuationContinue = !ignorePunctuation && !lastChar.isPunctuation;
    if (lastChar.isChar && !lastChar.isWhiteSpace && punctuationContinue) {
      _inWord = true;
    } else {
      _inWord = false;
    }
    return stats;
  }
}
