import 'package:string_stats/src/processing_functions.dart';
import 'package:string_stats/src/utility_extensions.dart';

class SubStringFrequencyCounter {
  final String _word;
  int _count = 0;

  int get count => _count;
  int _lastPos = 0;

  SubStringFrequencyCounter(String word) : _word = word;

  SubStringFrequencyCounter.fromString(String str, String word) : _word = word {
    add(str);
  }

  int add(String str) {
    if (str == null || str.isEmpty) {
      _lastPos = 0;
      return _count;
    }

    _count += subStringFrequency(str, _word, lastPos: _lastPos);

    var start = str.length - _word.length;
    start = start < 0 ? 0 : start;
    var inWord;
    var j;
    for (var i = start; i < str.length; i++) {
      inWord = false;
      for (j = 0; j + i < str.length && j < _word.length; j++) {
        // If first character in string is a space, skip
        if (i == 0 && str[i].isWhiteSpace) break;

        // If first letter in match and last letter was not a space, skip
//        if (j == 0 && i > 0 && !isWhiteSpace(str[i - 1])) break;

        // If the letters dont match in order, break
        if (_word.codeUnitAt(j) != str.codeUnitAt(j + i)) {
          break;
        }
        inWord = true;
      }
      i += j;
    }
    if(inWord) {
      _lastPos = j;
    } else {
      _lastPos = 0;
    }
    return _count;
  }
}
