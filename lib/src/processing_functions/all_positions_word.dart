import 'package:string_stats/src/position.dart';
import 'package:string_stats/src/utility_extensions.dart';

/// Determines all of the [Position]s of a word in parameter string str
Set<Position> allPositionsWord(String str, String word) {
  final out = <Position>{};
  var sb = StringBuffer();
  final chars = str.split('');
  var start = 0;
  for(var i = 0; i < chars.length; i++) {
    final ch = chars[i];
    if(ch.isWhiteSpace()) {
      if(sb.isNotEmpty) {
        final sbString = sb.toString();
        if(sbString == word) {
          out.add(Position(start, i - 1));
        }
      }
      start = i + 1;
      sb = StringBuffer();
    } else {
      sb.write(ch);
    }
  }
  if(sb.isNotEmpty) {
    final sbString = sb.toString();
    if(sbString == word) {
      out.add(Position(start, str.length - 1));
    }
  }
  return out;
}
