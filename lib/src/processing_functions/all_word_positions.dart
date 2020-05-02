import 'package:string_stats/src/position.dart';
import 'package:string_stats/src/utility_extensions.dart';

Map<String, Set<Position>> allWordsPositions(String str) {
  final out = <String, Set<Position>>{};
  var sb = StringBuffer();
  final chars = str.split('');
  var start = 0;
  for(var i = 0; i < chars.length; i++) {
    final ch = chars[i];
    if(ch.isWhiteSpace()) {
      if(sb.isNotEmpty) {
        final sbString = sb.toString();
        out.update(sbString, (set) {
          set.add(Position(start, i - 1));
          return set;
        }, ifAbsent: () => {Position(start, i - 1)});
      }
      start = i + 1;
      sb = StringBuffer();
    } else {
      sb.write(ch);
    }
  }
  if(sb.isNotEmpty) {
    final sbString = sb.toString();
    out.update(sbString, (set) {
      set.add(Position(start, str.length - 1));
      return set;
    }, ifAbsent: () => {Position(start, str.length - 1)});
  }
  return out;
}
