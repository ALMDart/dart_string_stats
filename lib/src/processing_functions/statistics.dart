/// Finds the general string statistics for the provided string.
import 'package:string_stats/string_stats.dart';

/// Finds the data points in StringStatistics for provided string.
///
/// Includes: character count, empty line count, line count, non-empty line count,
/// word count, character frequencies, word frequencies, and word positions.
///
/// The default behavior of the function is to count the last substring beginning
/// with white space as a word even if it ends without a whitespace or punctuation
/// mark. leftOvers and continues allows for incremental counting of a string
/// over multiple calls. leftOvers is what remained of a word from a previous
/// string and continues indicates that the string will continue, preventing the
/// count of the last whitespace lead substring.
///
/// ignorePunctuation facilitates checking words that include symbols.
///
/// inWord allows for incremental counting of a string over multiple calls, and
/// prevents double counting by telling function it's still in a word.
///
/// filterNonChars removes non-chars from count.
StringStatistics statistics(String str,
    {bool filterNonChars = true,
    String leftOvers = '',
    bool continues = false,
    bool inWord = false,
    bool ignorePunctuation = false}) {
  var charCount = 0;
  var emptyLineCount = 0;
  var lineCount = 0;
  var nonEmptyLineCount = 0;
  var wordCount = 0;
  final charFrequencies = <String, int>{};
  final wordFrequencies = <String, int>{};
  final wordPositions = <String, Set<Position>>{};

  var start = 0;
  final sb = StringBuffer();
  final chars = str.split('');
  sb.write(leftOvers);
  for (var i = 0; i < chars.length; i++) {
    final ch = chars[i];
    if (ch == '\n') {
      lineCount++;

      if (i == 0) {
        emptyLineCount++;
      } else {
        if (chars[i - 1] == '\n') {
          emptyLineCount++;
        } else {
          nonEmptyLineCount++;
        }
      }
    }

    final punctuationContinue = !ignorePunctuation && !ch.isPunctuation;
    if (ch.isChar && !ch.isWhiteSpace && punctuationContinue) {
      if (inWord == false) {
        inWord = true;
      }
    } else {
      if (inWord) wordCount++;
      inWord = false;
    }

    if (ch.isChar || !filterNonChars) {
      charFrequencies.update(ch, (v) => v + 1, ifAbsent: () => 1);
      charCount++;
    }

    if (ch.isWhiteSpace || (!ignorePunctuation && ch.isPunctuation)) {
      if (sb.isNotEmpty) {
        final sbString = sb.toString();
        wordFrequencies.update(sbString, (v) => v + 1, ifAbsent: () => 1);
        wordPositions.update(sbString, (set) {
          set.add(Position(start, i - 1));
          return set;
        }, ifAbsent: () => {Position(start, i - 1)});
      }
      start = i + 1;
      sb.clear();
    } else {
      sb.write(ch);
    }
  }

  if (!continues && sb.isNotEmpty) {
    final sbString = sb.toString();
    wordFrequencies.update(sb.toString(), (v) => v + 1, ifAbsent: () => 1);
    wordPositions.update(sbString, (set) {
      set.add(Position(start, str.length - 1));
      return set;
    }, ifAbsent: () => {Position(start, str.length - 1)});
  }

  if (!continues && inWord) wordCount++;

  return StringStatistics(
      charCount,
      wordCount,
      lineCount + 1,
      emptyLineCount,
      nonEmptyLineCount + 1,
      charFrequencies,
      wordFrequencies,
      wordPositions
  );
}
