import 'package:string_stats/src/processing_functions.dart';

/// Facilitates performing char_count on a stream of strings.
class CharCounter {
  int _count = 0;
  /// Count of characters encountered thus far.
  int get count => _count;

  CharCounter();

  /// Creates a counter and adds parameter string.
  CharCounter.fromString(String str) {
    add(str);
  }

  /// Add another string to be processed, returns count.
  int add(String str) {
    _count += charCount(str);
    return _count;
  }
}
