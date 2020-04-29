import 'package:string_stats/src/processing_functions.dart';

class AllCharFrequencyCounter {
  final Map<String, int> _counts = <String, int>{};
  Map<String, int> get counts => _counts;

  AllCharFrequencyCounter();
  AllCharFrequencyCounter.fromString(String str) {
    add(str);
  }

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
