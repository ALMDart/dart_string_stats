import 'package:string_stats/src/processing_functions.dart';

class CharCounter {
  int _count = 0;
  int get count => _count;

  CharCounter();
  CharCounter.fromString(String str) {
    add(str);
  }

  int add(String str) {
    _count += charCount(str);
    return _count;
  }
}
