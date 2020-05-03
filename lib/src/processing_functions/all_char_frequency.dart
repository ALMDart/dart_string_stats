import 'package:string_stats/src/utility_extensions.dart';

/// Counts the frequency of all characters in the parameter string.
Map<String, int> allCharFrequency(String str, {bool filterNonChars = true}) {
  final out = <String, int>{};
  for(final ch in str.split('')) {
    if(filterNonChars && !ch.isChar) continue;
    out.update(ch, (v) => v + 1, ifAbsent: () => 1);
  }
  return out;
}
