import 'package:string_stats/src/processing_functions.dart';
import 'package:string_stats/src/utility_extensions.dart';

/// Facilitates performing substring_frequency on a stream of strings.
class SubStringFrequencyCounter {
  final String _substring;
  int _count = 0;

  /// Count of substring encountered thus far.
  int get count => _count;
  int _lastPos = 0;

  /// substring is the substring to count
  SubStringFrequencyCounter(String substring) : _substring = substring;

  /// Creates a counter and adds parameter string.
  /// word is the word to count
  SubStringFrequencyCounter.fromString(String str, String word) : _substring = word {
    add(str);
  }

  /// Add another string to be processed, returns the counts.
  int add(String str) {
    if (str == null || str.isEmpty) {
      _lastPos = 0;
      return _count;
    }

    _count += subStringFrequency(str, _substring, lastPos: _lastPos);

    var start = str.length - _substring.length;
    start = start < 0 ? 0 : start;
    var inWord;
    var j;
    for (var i = start; i < str.length; i++) {
      inWord = false;
      for (j = 0; j + i < str.length && j < _substring.length; j++) {
        // If first character in string is a space, skip.
        if (i == 0 && str[i].isWhiteSpace) break;

        // If the letters dont match in order, break.
        if (_substring.codeUnitAt(j) != str.codeUnitAt(j + i)) {
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
