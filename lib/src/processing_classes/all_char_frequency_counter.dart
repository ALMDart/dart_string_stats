import 'package:string_stats/src/processing_functions.dart';

/// Facilitates performing all_char_frequency on a stream of strings.
class AllCharFrequencyCounter {
  final Map<String, int> _counts = <String, int>{};

  /// Counts of each character encountered thus far.
  Map<String, int> get counts => _counts;

  AllCharFrequencyCounter();

  /// Creates a counter and adds parameter string.
  AllCharFrequencyCounter.fromString(String str) {
    add(str);
  }

  /// Add another string to be processed, returns the counts collection.
  /// filterNonChars removes non-chars from count.
  Map<String, int> add(String str, {bool filterNonChars = true}) {
    allCharFrequency(str, filterNonChars: filterNonChars).forEach((key, val) {
      _counts.update(key, (val1) => val1 + val, ifAbsent: () => val);
    });
    return _counts;
  }
}
