import 'package:string_stats/src/position.dart';
import 'package:string_stats/src/utility_extensions.dart';

/// Returns the first [Position] of word in the str.
///
/// ignorePunctuation facilitates checking words that include symbols.
Position firstPositionWord(String str, String word, {bool ignorePunctuation = false}) {
  final sb = StringBuffer();
  final chars = str.split('');
  var start = 0;
  for(var i = 0; i < chars.length; i++) {
    final ch = chars[i];
    if(ch.isWhiteSpace  || (!ignorePunctuation && ch.isPunctuation)) {
      if(sb.isNotEmpty) {
        final sbString = sb.toString();
        if(sbString == word) {
          return Position(start, i - 1);
        }
      }
      start = i + 1;
      sb.clear();
    } else {
      sb.write(ch);
    }
  }
  return null;
}
