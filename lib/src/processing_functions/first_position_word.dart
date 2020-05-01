import 'package:string_stats/src/position.dart';
import 'package:string_stats/src/utils.dart';

Position firstPositionWord(String str, String word) {
  var sb = StringBuffer();
  final chars = str.split('');
  var start = 0;
  for(var i = 0; i < chars.length; i++) {
    final ch = chars[i];
    if(isWhiteSpace(ch)) {
      if(sb.isNotEmpty) {
        final sbString = sb.toString();
        if(sbString == word) {
          return Position(start, i - 1);
        }
      }
      start = i + 1;
      sb = StringBuffer();
    } else {
      sb.write(ch);
    }
  }
  return null;
}
