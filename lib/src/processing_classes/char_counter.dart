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
  /// filterNonChars removes non-chars from count.
  int add(String str, {bool filterNonChars = true}) {
    _count += charCount(str, filterNonChars: filterNonChars);
    return _count;
  }
}
