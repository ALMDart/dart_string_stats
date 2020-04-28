import 'package:string_stats/src/utils.dart';

Map<String, int> allCharFrequency(String str) {
  if (isNull(str) || str.isEmpty) return <String, int>{};
  final out = <String, int>{};
  for(final ch in str.split('')) {
    out.update(ch, (v) => v + 1, ifAbsent: () => 1);
  }
  return out;
}
