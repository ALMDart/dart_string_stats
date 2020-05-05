import 'package:string_stats/src/processing_classes.dart';
import 'package:string_stats/src/processing_classes/statistics_counter.dart';
import 'package:test/test.dart';

void processing_class_tests() {
  group('processing_function_tests', () {
    test('WordCounter works', () {
      var wordCountSum = WordCounter();
      expect(wordCountSum.add(' 12345 '), 1);
      expect(wordCountSum.add('12 345\n 6'), 4);

      expect(wordCountSum.add(''), 4);
      expect(wordCountSum.add(' '), 4);
      expect(wordCountSum.add('\t'), 4);
      expect(wordCountSum.add('\r'), 4);
      expect(wordCountSum.add('\n'), 4);
      expect(wordCountSum.add('\n\r'), 4);

      expect(wordCountSum.add('\n\r% s @ # (a\\|'), 6);
      // word continues on
      expect(wordCountSum.add('12345'), 7);
    });

    test('CharCounter works', () {
      var countCharSum = CharCounter();
      expect(countCharSum.add(''), 0);

      expect(countCharSum.add(' 12345 '), 7);
      expect(countCharSum.add('12 345\n 6'), 15);

      expect(countCharSum.add('aabaa aaa'), 24);
      expect(countCharSum.add('aaba\na a\taa'), 33);
      expect(countCharSum.add('\t\t'), 33);
      expect(countCharSum.add('\n\n\n'), 33);
    });

    test('CharFrequencyCounter works', () {
      var counter = CharFrequencyCounter('a');

      expect(counter.add('a'), 1);
      expect(counter.add('a'), 2);
      expect(counter.add('hfdtfdthfdh5 y'), 2);
      expect(counter.add(' a   a a aa   aaa  a  '), 11);
      expect(counter.add(' adgr g4 a afw4 geg a  '), 15);
    });

    test('StatisticsCounter works', () {
      final statistics = StatisticsCounter();
      var stats = statistics.add('\nword duck pond \n\n   \n martian');
      stats = statistics.add('\nword duck pond \n\n   \n martian');

      expect(stats.charCount, 2 * 26);
      expect(stats.emptyLineCount, 2 * 2);
      expect(stats.lineCount, 2 * 5);
      expect(stats.nonEmptyLineCount, 2 * 3);
      expect(stats.wordCount, 2 * 4 - 1);

      final charFreqs = stats.charFrequencies;
      expect(charFreqs.length, 14);
      expect(charFreqs['w'], 2 * 1);
      expect(charFreqs['o'], 2 * 2);

      final wordFreqs = stats.wordFrequencies;
      expect(wordFreqs.length, 4);
      expect(wordFreqs['word'], 2 * 1);
      expect(wordFreqs['martian'], 1);

      final wordPos = stats.wordPositions;
      expect(wordPos.length, 4);
      expect(wordPos['word'].first.start, 1);
      expect(wordPos['duck'].first.start, 6);

      stats = statistics.add(' ');
      expect(stats.wordFrequencies['martian'], 2);
    });

    test('WordFrequencyCounter works', () {
      var counter = WordFrequencyCounter('word');

      expect(counter.add('word'), 1);
      expect(counter.add(' word word word '), 4);

      expect(counter.add(' word word wo'), 6);
      expect(counter.add('rd'), 7);

      expect(counter.add('wordwo'), 7);
      expect(counter.add('rd '), 7);

      expect(counter.add('wor'), 7);
      expect(counter.add('d wor word d'), 9);

      expect(counter.add('  wor'), 9);
      expect(counter.add('d  wor'), 10);
      expect(counter.add('d  w'), 11);
      expect(counter.add('ord  wor'), 12);
      expect(counter.add('da  wor'), 12);
    });

    test('SubStringFrequencyCounter works', () {
      var counter = SubStringFrequencyCounter('word');

      expect(counter.add('word'), 1);
      expect(counter.add(' word word word '), 4);

      expect(counter.add(' word word wo'), 6);
      expect(counter.add('rd'), 7);

      expect(counter.add('wordwo'), 8);
      expect(counter.add('rd '), 9);

      expect(counter.add('wor'), 9);
      expect(counter.add('d wor word d'), 11);

      expect(counter.add('  wor'), 11);
      expect(counter.add('d  wor'), 12);
      expect(counter.add('d  w'), 13);
      expect(counter.add('ord  wor'), 14);
      expect(counter.add('da  wor'), 15);
      expect(counter.add('da word  wor'), 17);
    });

    test('AllCharFrequencyCounter works', () {
      var counter = AllCharFrequencyCounter();

      expect(counter.add('').isEmpty, isTrue);

      expect(counter.add('aabbcc').length, 3);
      expect(counter.add('aabbcc')['a'], 4);
      expect(counter.add('aabbcc')['b'], 6);
      expect(counter.add('aabbcc')['c'], 8);
      expect(counter.add('aabbcc')['d'], isNull);
    });

    test('AllWordFrequencyCounter works', () {
      var counter = AllWordFrequencyCounter();

      expect(counter.add('').isEmpty, isTrue);
      expect(counter.add('word ').length, 1);

      expect(counter.add('word').length, 1);
      expect(counter.add(' ')['word'], 2);
      expect(counter.add('w')['word'], 2);
      expect(counter.add('or')['word'], 2);
      expect(counter.add('d', end: true)['word'], 3);
    });
  });
}
