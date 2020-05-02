import 'package:string_stats/src/processing_functions.dart';
import 'package:string_stats/src/processing_classes.dart';
import 'package:test/test.dart';

void processing_function_tests() {
  group('processing_function_tests', () {
    test('charCount works', () {
      expect(charCount('12345'), 5);
      expect(charCount('12345\n 6'), 7);

      expect(charCount(''), 0);
      expect(charCount(' '), 1);
      expect(charCount('\t'), 0);
      expect(charCount('\r'), 0);
      expect(charCount('\n'), 0);
      expect(charCount('\n\r'), 0);

      expect(charCount('\n\r%s@#(a\\|'), 8);
    });

    test('wordCount works', () {
      expect(wordCount(' 12345 '), 1);
      expect(wordCount('12 345\n 6'), 3);

      expect(wordCount(''), 0);
      expect(wordCount(' '), 0);
      expect(wordCount('\t'), 0);
      expect(wordCount('\r'), 0);
      expect(wordCount('\n'), 0);
      expect(wordCount('\n\r'), 0);

      expect(wordCount('\n\r% s @ # (a\\|'), 2);

      expect(wordCount('12345'), 1);

      expect(wordCount('word!word'), 2);
    });

    test('charFrequency works', () {
      expect(charFrequency('', '23'), 0);

      expect(charFrequency(' 12345 ', 'a'), 0);
      expect(charFrequency('12 345\n 6', '6'), 1);

      expect(charFrequency('aabaa aaa', 'a'), 7);
      expect(charFrequency('aaba\na a\taa', 'a'), 7);
      expect(charFrequency('\t\t', '\t'), 2);
      expect(charFrequency('\n\n\n', '\n'), 3);
    });

    test('allWordFrequency works', () {
      expect(allWordFrequency('word word word duck duck')['word'], 3);
      expect(allWordFrequency('word word word duck duck')['duck'], 2);
      expect(allWordFrequency('word wo2rd word duck duck')['wo2rd'], 1);
    });

    test('firstPositionWord works', () {
      expect(firstPositionWord('',null), null);
      expect(firstPositionWord('',''), null);

      expect(firstPositionWord(' word ', 'word').start, 1);
      expect(firstPositionWord(' word ', 'word').end, 4);
      expect(firstPositionWord(' word ', 'word').length, 4);

      expect(firstPositionWord(' apple mineral coral', 'mineral').start, 7);
      expect(firstPositionWord(' apple mineral coral', 'mineral').end, 13);
      expect(firstPositionWord(' apple mineral coral', 'mineral').length, 7);

    });

    test('allPositionsWord works', () {
      expect(allPositionsWord('','').length, 0);

      expect(allPositionsWord(' word ', 'word').length, 1);
      expect(allPositionsWord(' word ', 'word').first.end, 4);
      expect(allPositionsWord(' word ', 'word').first.length, 4);

      expect(allPositionsWord('mineral apple mineral coral mineral', 'mineral').length, 3);
      expect(allPositionsWord('mineral apple mineral coral mineral', 'mineral').last.length, 7);
      expect(allPositionsWord('mineral apple mineral coral mineral', 'mineral').last.start, 28);
      expect(allPositionsWord('mineral apple mineral coral mineral', 'mineral').last.end, 34);
    });

    test('firstPositionWord works', () {
      expect(allWordsPositions('').length, 0);

      expect(allWordsPositions(' word ').length, 1);
      expect(allWordsPositions(' word ')['word'].length, 1);
      expect(allWordsPositions(' word ')['word'].first.start, 1);
      expect(allWordsPositions(' word ')['word'].first.end, 4);
      expect(allWordsPositions(' word ')['word'].first.length, 4);

      expect(allWordsPositions('mineral apple mineral coral mineral').length, 3);

      expect(allWordsPositions('mineral apple mineral coral mineral')['mineral'].length, 3);
      expect(allWordsPositions('mineral apple mineral coral mineral')['apple'].length, 1);
      expect(allWordsPositions('mineral apple mineral coral mineral')['coral'].length, 1);

      expect(allWordsPositions('mineral apple mineral coral mineral')['mineral'].last.length, 7);
      expect(allWordsPositions('mineral apple mineral coral mineral')['mineral'].last.start, 28);
      expect(allWordsPositions('mineral apple mineral coral mineral')['mineral'].last.end, 34);
    });

    test('wordFrequency works', () {
      expect(wordFrequency('', 'a'), 0);
      expect(wordFrequency('a', ''), 0);

      expect(wordFrequency('abbbba', 'a'), 0);
      expect(wordFrequency('a bbbba', 'a'), 1);
      expect(wordFrequency(' a bbbba', 'a'), 1);
      expect(wordFrequency('a bbbb a', 'a'), 2);
      expect(wordFrequency('a bbbb a ', 'a'), 2);
      expect(wordFrequency(' a bbbb a ', 'a'), 2);

      expect(wordFrequency('word word', 'word'), 2);

      expect(wordFrequency(' word      word    ', 'word'), 2);
      expect(wordFrequency(' word      word\t\n', 'word'), 2);
      expect(wordFrequency(' word    @7  word    word word word \n gds4   word', 'word'), 6);

      expect(wordFrequency('333  sef sf 3fsf 333', '333'), 2);

      expect(wordFrequency('%@% %@% 5552', '%@%'), 2);
    });

    test('subStringFrequency works', () {
      expect(subStringFrequency('', 'a'), 0);
      expect(subStringFrequency('a', ''), 0);

      expect(subStringFrequency('abbbba', 'a'), 2);
      expect(subStringFrequency('a bbbba', 'a'), 2);
      expect(subStringFrequency(' a bbbba', 'a'), 2);
      expect(subStringFrequency('a bbbb a', 'a'), 2);
      expect(subStringFrequency('a bbbb a ', 'a'), 2);
      expect(subStringFrequency(' a bbbb a ', 'a'), 2);

      expect(subStringFrequency('word word', 'word'), 2);

      expect(subStringFrequency(' word      word    ', 'word'), 2);
      expect(subStringFrequency(' word      word\t\n', 'word'), 2);
      expect(subStringFrequency(' word    @7  word    word word word \n gds4   word', 'word'), 6);

      expect(subStringFrequency('333  sef sf 3fsf 333', '333'), 2);

      expect(subStringFrequency('%@% %@% 5552', '%@%'), 2);

      ////////

      expect(subStringFrequency('abbbba', 'a'), 2);
      expect(subStringFrequency('abbbba', 'a'), 2);

      expect(subStringFrequency('wordword', 'word'), 2);

      expect(subStringFrequency('wordword', 'word'), 2);
      expect(subStringFrequency('wordword\t\n', 'word'), 2);
      expect(subStringFrequency('word@7wordwordwordword\ngds4word', 'word'), 6);
      expect(subStringFrequency('333sefsf3fsf333', '333'), 2);

      expect(subStringFrequency('%@%%@%5552', '%@%'), 2);
    });

    test('nonEmptyLineCount works', () {
      expect(nonEmptyLineCount(''), 0);
      expect(nonEmptyLineCount('\n'), 0);
      expect(nonEmptyLineCount('\n\n'), 0);

      expect(nonEmptyLineCount('\nasdsd\n'), 1);
      expect(nonEmptyLineCount('\nasdsd\n\n'), 1);
    });

    test('emptyLineCount works', () {
      expect(emptyLineCount(''), 0);
      expect(emptyLineCount('\n'), 1);
      expect(emptyLineCount('\n\n'), 2);

      expect(emptyLineCount('\nasdsd\n'), 1);
      expect(emptyLineCount('\nasdsd\n\n'), 2);
    });

    test('lineCount works', () {
      expect(lineCount(''), 0);
      expect(lineCount('\n'), 1);
      expect(lineCount('\n\n'), 2);

      expect(lineCount('\nasdsd\n'), 2);
      expect(lineCount('\nasdsd\n\n'), 3);
    });

    test('linesAllSpaces', () {
      expect(linesAllSpaces('').isEmpty, isTrue);
      expect(linesAllSpaces('    ').contains(0), isTrue);

      expect(linesAllSpaces('    \n ').contains(0), isTrue);
      expect(linesAllSpaces('    \n ').contains(1), isTrue);

      expect(linesAllSpaces('    \n ').contains(0), isTrue);
      expect(linesAllSpaces('    \n \n').contains(1), isTrue);
      expect(linesAllSpaces('    \n \n').contains(2), isTrue);
      expect(linesAllSpaces('    \n\n \n ').contains(3), isTrue);
    });

    test('allCharFrequency', () {
      expect(allCharFrequency('').isEmpty, isTrue);

      expect(allCharFrequency('aabbcc')['a'], 2);
      expect(allCharFrequency('aabbcc')['b'], 2);
      expect(allCharFrequency('aabbcc')['c'], 2);
      expect(allCharFrequency('aabbcc')['d'], isNull);

      expect(allCharFrequency('mississippi@#^*^&*^&*^&ss \n')['s'], 6);
    });
  });
}
