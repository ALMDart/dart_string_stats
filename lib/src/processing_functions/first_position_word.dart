import 'package:string_stats/src/position.dart';
import 'package:string_stats/src/utility_extensions.dart';

/// Returns the first [Position] of word in the str.
///
/// The default behavior of the function is to count the last substring beginning
/// with white space as a word even if it ends without a whitespace or punctuation
/// mark. leftOvers and continues allows for incremental counting of a string
/// over multiple calls. leftOvers is what remained of a word from a previous
/// string and continues indicates that the string will continue, preventing the
/// count of the last whitespace lead substring.
///
/// ignorePunctuation facilitates checking words that include symbols.
Position? firstPositionWord(String? str, String? word,
    {String? leftOvers = '',
    bool? continues = false,
    bool? ignorePunctuation = false}) {
  final sb = StringBuffer();
  sb.write(leftOvers);
  final chars = str!.split('');
  var start = 0;
  for (var i = 0; i < chars.length; i++) {
    final ch = chars[i];
    if (ch.isWhiteSpace || (!ignorePunctuation! && ch.isPunctuation)) {
      if (!continues! && sb.isNotEmpty) {
        final sbString = sb.toString();
        if (sbString == word) {
          return Position(start, i - 1);
        }
      }
      start = i + 1;
      sb.clear();
    } else {
      sb.write(ch);
    }
  }
  return null;
}
