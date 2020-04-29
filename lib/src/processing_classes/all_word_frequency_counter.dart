import 'package:string_stats/src/processing_functions.dart';
import 'package:string_stats/src/utils.dart';

class AllWordFrequencyCounter {
  final Map<String, int> _counts = <String, int>{};
  Map<String, int> get counts => _counts;
  StringBuffer _buffer = StringBuffer();

  AllWordFrequencyCounter();
  AllWordFrequencyCounter.fromString(String str) {
    add(str);
  }

  Map<String, int> add(String str, { bool end = false }) {
    if (str == null || str.isEmpty) {
      return _counts;
    }
    final tmpMap = allWordFrequency(str, leftOvers: _buffer.toString(), continues: !end );
    for(final key in tmpMap.keys) {
      if(_counts.containsKey(key)) {
        _counts.update(key, (val) => val + tmpMap[key]);
      } else {
        _counts.putIfAbsent(key, () => tmpMap[key]);
      }
    }

    for(var i = str.length - 1; i >= 0; i--) {
      if(isWhiteSpace(str[i])) {
        if(i == str.length - 1) {
          _buffer = StringBuffer();
        } else {
          _buffer.write(str.substring(i + 1));
        }
        break;
      }
      if(i == 0) {
        _buffer.write(str);
      }
    }

    return _counts;
  }
}
