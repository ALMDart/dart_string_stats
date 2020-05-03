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
  Map<String, int> add(String str) {
    final tmpMap = allCharFrequency(str);
    for(final key in tmpMap.keys) {
      if(_counts.containsKey(key)) {
        _counts.update(key, (val) => val + tmpMap[key]);
      } else {
        _counts.putIfAbsent(key, () => tmpMap[key]);
      }
    }
    return _counts;
  }
}
