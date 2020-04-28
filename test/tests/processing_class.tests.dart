import 'package:string_stats/src/processing_functions.dart';
import 'package:string_stats/src/processing_classes.dart';
import 'package:test/test.dart';

void processing_class_tests() {
  group('processing_function_tests', () {
    test('WordCounter works', () {
      var wordCountSum = WordCounter();
      expect(wordCountSum.add(null), 0);

      expect(wordCountSum.add(' 12345 '), 1);
      expect(wordCountSum.add('12 345\n 6'), 4);

      expect(wordCountSum.add(''), 4);
      expect(wordCountSum.add(' '), 4);
      expect(wordCountSum.add('\t'), 4);
      expect(wordCountSum.add('\r'), 4);
      expect(wordCountSum.add('\n'), 4);
      expect(wordCountSum.add('\n\r'), 4);

      expect(wordCountSum.add('\n\r% s @ # (a\\|'), 9);
      // word continues on
      expect(wordCountSum.add('12345'), 9);
    });

    test('CharCounter works', () {
      var countCharSum = CharCounter();
      expect(countCharSum.add(null), 0);
      expect(countCharSum.add(null), 0);
      expect(countCharSum.add(''), 0);

      expect(countCharSum.add(' 12345 '), 7);
      expect(countCharSum.add('12 345\n 6'), 15);

      expect(countCharSum.add('aabaa aaa'), 24);
      expect(countCharSum.add('aaba\na a\taa'), 33);
      expect(countCharSum.add('\t\t'), 33);
      expect(countCharSum.add('\n\n\n'), 33);
    });

    test('CharFrequency works', () {
      var counter = CharFrequency('a');

      expect(counter.add(null), 0);
      expect(counter.add('a'), 1);
      expect(counter.add('a'), 2);
      expect(counter.add('hfdtfdthfdh5 y'), 2);
      expect(counter.add(' a   a a aa   aaa  a  '), 11);
      expect(counter.add(' adgr g4 a afw4 geg a  '), 15);
    });

    test('WordFrequency works', () {
      var counter = WordFrequencyCounter('word');

      expect(counter.add(null), 0);
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

    test('SubStringFrequency works', () {
      var counter = SubStringFrequencyCounter('word');

      expect(counter.add(null), 0);
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
  });
}
