import 'package:string_stats/src/utility_extensions.dart';

// TODO Add support for punctuation and new lines

/// Returns the frequency of all words in a given string str.
///
/// The default behavior of the function is to count the last substring beginning
/// with white space as a word even if it ends without a whitespace or punctuation
/// mark. leftOvers and continues allows for incremental counting of a string
/// over multiple calls. leftOvers is what remained of a word from a previous
/// string and continues indicates that the string will continue, preventing the
/// count of the last whitespace lead substring.
Map<String, int> allWordFrequency(String str,
    {String leftOvers = '',
    bool continues = false,
    bool ignorePunctuation = false}) {
  final out = <String, int>{};
  final sb = StringBuffer();
  sb.write(leftOvers);
  for (final ch in str.split('')) {
    if (ch.isWhiteSpace || (!ignorePunctuation && ch.isPunctuation)) {
      if (sb.isNotEmpty) {
        out.update(sb.toString(), (v) => v + 1, ifAbsent: () => 1);
      }
      sb.clear();
    } else {
      sb.write(ch);
    }
  }
  if (!continues && sb.isNotEmpty) {
    out.update(sb.toString(), (v) => v + 1, ifAbsent: () => 1);
  }
  return out;
}
