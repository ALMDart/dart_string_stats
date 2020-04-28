import 'package:string_stats/src/utils.dart';

Map<String, int> allWordFrequency(String str) {
  if (isNull(str) || str.isEmpty) return <String, int>{};
  final out = <String, int>{};
  var sb = StringBuffer();
  for(final ch in str.split('')) {
    if(isWhiteSpace(ch)) {
      if(sb.isNotEmpty) {
        out.update(sb.toString(), (v) => v + 1, ifAbsent: () => 1);
      }
      sb = StringBuffer();
    } else {
      sb.write(ch);
    }
  }
  if(sb.isNotEmpty) {
    out.update(sb.toString(), (v) => v + 1, ifAbsent: () => 1);
  }
  return out;
}
