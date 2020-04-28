import 'package:string_stats/src/position.dart';
import 'package:string_stats/src/utils.dart';

Set<Position> allPostionsWord(String str, String word) {
  if (isNull(str) || isNull(word) || str.isEmpty || word.isEmpty) return <Position>{};
  final out = <Position>{};
  var sb = StringBuffer();
  final chars = str.split('');
  var start = 0;
  for(var i = 0; i < chars.length; i++) {
    final ch = chars[i];
    if(isWhiteSpace(ch)) {
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
