import 'package:string_stats/src/utility_extensions.dart';

// TODO Add support for punctuation and new lines

/// Returns the frequency of all words in a given string str.
///
/// The default behavior of the function is to count the last word a string
/// as a word even if it ends without a new lines
/// leftOvers and continues allows for incremental counting over a string
/// over multiple calls. leftOvers is what remained of a word from a previous
/// string
Map<String, int> allWordFrequency(String str,
    {String leftOvers = '',
    bool continues = false,
    bool ignorePunctuation = false}) {
  final out = <String, int>{};
  var sb = StringBuffer();
  sb.write(leftOvers);
  for (final ch in str.split('')) {
    if (ch.isWhiteSpace() || (!ignorePunctuation && ch.isPunctuation())) {
      if (sb.isNotEmpty) {
        out.update(sb.toString(), (v) => v + 1, ifAbsent: () => 1);
      }
      sb = StringBuffer();
    } else {
      sb.write(ch);
    }
  }
  if (!continues && sb.isNotEmpty) {
    out.update(sb.toString(), (v) => v + 1, ifAbsent: () => 1);
  }
  return out;
}
