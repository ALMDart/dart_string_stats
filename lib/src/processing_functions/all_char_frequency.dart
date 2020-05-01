/// Counts the frequency of all characters in the parameter string.
Map<String, int> allCharFrequency(String str) {
  final out = <String, int>{};
  for(final ch in str.split('')) {
    out.update(ch, (v) => v + 1, ifAbsent: () => 1);
  }
  return out;
}
