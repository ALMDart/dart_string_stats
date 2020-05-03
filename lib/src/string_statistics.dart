import 'package:string_stats/src/position.dart';

class StringStatistics {
  final int charCount;
  final int emptyLineCount;
  final int lineCount;
  final int nonEmptyLineCount;
  final int wordCount;
  final Map<String, int> charFrequencies;
  final Map<String, int> wordFrequencies;
  final Map<String, Set<Position>> wordPositions;
  final Set<int> linesAllSpaces;

  const StringStatistics(
      this.charCount,
      this.wordCount,
      this.lineCount,
      this.emptyLineCount,
      this.nonEmptyLineCount,
      this.charFrequencies,
      this.wordFrequencies,
      this.wordPositions,
      this.linesAllSpaces);

  StringStatistics combine(StringStatistics stats) {
    final newCharFrequencies = <String, int>{};
    newCharFrequencies.addAll(wordFrequencies);
    for (final key in stats.charFrequencies.keys) {
      newCharFrequencies.update(key, (val) => val + stats.charFrequencies[key],
          ifAbsent: () => stats.charFrequencies[key]);
    }

    final newWordFrequencies = <String, int>{};
    newWordFrequencies.addAll(wordFrequencies);
    for (final key in stats.wordFrequencies.keys) {
      newWordFrequencies.update(key, (val) => val + stats.wordFrequencies[key],
          ifAbsent: () => stats.wordFrequencies[key]);
    }

    final newWordPositions = <String, Set<Position>>{};
    wordPositions.forEach(
        (val, set) => newWordPositions.putIfAbsent(val, () => Set.from(set)));
    stats.wordPositions.forEach((val, set) => newWordPositions
        .update(val, (old) => set.union(old), ifAbsent: () => Set.from(set)));

    return StringStatistics(
      charCount + stats.charCount,
      wordCount + stats.wordCount,
      lineCount + stats.lineCount,
      emptyLineCount + stats.emptyLineCount,
      nonEmptyLineCount + stats.nonEmptyLineCount,
      newCharFrequencies,
      newWordFrequencies,
      newWordPositions,
      linesAllSpaces.union(stats.linesAllSpaces)
    );
  }
}
