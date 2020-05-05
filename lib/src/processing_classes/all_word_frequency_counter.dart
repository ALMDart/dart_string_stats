import 'package:string_stats/src/processing_functions.dart';
import 'package:string_stats/src/utility_extensions.dart';

/// Facilitates performing all_word_frequency on a stream of strings.
class AllWordFrequencyCounter {
  final Map<String, int> _counts = <String, int>{};

  /// Counts of each word encountered thus far.
  Map<String, int> get counts => _counts;
  final StringBuffer _buffer = StringBuffer();

  AllWordFrequencyCounter();

  /// Creates a counter and adds parameter string.
  AllWordFrequencyCounter.fromString(String str) {
    add(str);
  }

  /// Add another string to be processed, returns the counts collection.
  /// end indicates final word to flush buffers and finalize count.
  /// ignorePunctuation facilitates checking words that include symbols.
  Map<String, int> add(String str, {bool end = false, bool ignorePunctuation = false}) {
    allWordFrequency(str, leftOvers: _buffer.toString(), continues: !end, ignorePunctuation: ignorePunctuation)
        .forEach((key, val) {
      _counts.update(key, (val1) => val1 + val, ifAbsent: () => val);
    });

    for (var i = str.length - 1; i >= 0; i--) {
      if (str[i].isWhiteSpace ||
          (!ignorePunctuation && str[i].isPunctuation)) {
        if (i == str.length - 1) {
          _buffer.clear();
        } else {
          _buffer.write(str.substring(i + 1));
        }
        break;
      }
      if (i == 0) {
        _buffer.write(str);
      }
    }

    return _counts;
  }
}
