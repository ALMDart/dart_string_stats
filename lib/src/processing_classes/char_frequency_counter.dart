import 'package:string_stats/src/processing_functions.dart';

class CharFrequencyCounter {
  final String _char;
  int _count = 0;
  int get count => _count;
  CharFrequencyCounter(String char) : _char = char;

  CharFrequencyCounter.fromString(String str, String char) : _char = char {
    add(str);
  }

  int add(String str) {
    _count += charFrequency(str, _char);
    return _count;
  }
}
