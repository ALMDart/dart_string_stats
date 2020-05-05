import 'package:string_stats/string_stats.dart';

void main() {
  //
  // Processing Functions

  // allCharFrequency
  allCharFrequency('aabbcc')['a']; // 2

  // allPositionsWord
  allPositionsWord('mineral apple mineral coral mineral', 'mineral').last.start; // 28

  // allWordFrequency
  allWordFrequency('word word word duck duck')['word']; // 3

  // allWordsPositions
  allWordsPositions('mineral apple mineral coral mineral')['apple'].length; // 1

  // charCount
  charCount('12345\n 6'); // 7

  // charFrequency
  charFrequency('aabaa aaa', 'a'); // 7

  // emptyLineCount
  emptyLineCount('\n\n'); // 3

  // firstPositionWord
  firstPositionWord(' word ', 'word').end; // 4

  // lineCount
  lineCount('\nasdsd\n'); // 3

  // nonEmptyLineCount
  nonEmptyLineCount('\nasdsd\n');

  // statistics
  statistics('\nword duck pond \n\n   \n martian'); // StringStatistics

  // subStringFrequency
  subStringFrequency(' word      word    ', 'word'); // 2

  // wordCount
  wordCount('12 345\n 6'); // 3

  // wordFrequency
  wordFrequency(' word      word    ', 'word'); // 2

  //
  // Processing Classes

  // AllCharFrequencyCounter
  final allCharFreqCounter = AllCharFrequencyCounter();
  allCharFreqCounter.add('aabbcc').length; // 3
  allCharFreqCounter.add('aabbcc')['a']; // 4

  // AllWordFrequencyCounter
  final allWordFreqCounter = AllWordFrequencyCounter();
  allWordFreqCounter.add('word ').length; // 1
  allWordFreqCounter.add('word')['word']; // 2

  // CharCounter
  final charCounter = CharCounter();
  charCounter.add(' 12345 '); // 7
  charCounter.add('12 345\n 6'); // 15

  // CharFrequencyCounter
  final charFreqCounter = CharFrequencyCounter('a');
  charFreqCounter.add('a'); // 1
  charFreqCounter.add('a'); // 2
  charFreqCounter.add('hfdtfdthfdh5 y'); // 2

  // StatisticsCounter
  final statisticsCounter = StatisticsCounter();
  statisticsCounter.add('\nword duck pond \n\n   \n martian'); // StringStatistics
  statisticsCounter.add('\nword duck pond \n\n   \n martian'); // StringStatistics

  // WordCounter
  final wordCounter = WordCounter();
  wordCounter.add(' 12345 '); // 1
  wordCounter.add('12 345\n 6'); // 4

  // WordFrequencyCounter
  final wordFreqCounter = WordFrequencyCounter('word');
  wordFreqCounter.add('word'); // 1
  wordFreqCounter.add(' word word word '); // 4
}
