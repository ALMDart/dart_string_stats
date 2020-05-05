import 'package:string_stats/src/processing_functions.dart';

/// Facilitates performing char_frequency on a stream of strings.
class CharFrequencyCounter {
  final String _char;
  int _count = 0;

  /// Count of character encountered thus far.
  int get count => _count;

  /// char is the character to count
  CharFrequencyCounter(String char) : _char = char;

  /// Creates a counter and adds parameter string.
  /// char is the character to count.
  CharFrequencyCounter.fromString(String str, String char) : _char = char {
    add(str);
  }

  /// Add another string to be processed, returns the counts.
  /// filterNonChars removes non-chars from count.
  int add(String str, {bool filterNonChars = true}) {
    _count += charFrequency(str, _char, filterNonChars: filterNonChars);
    return _count;
  }
}
