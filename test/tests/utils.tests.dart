import 'package:string_stats/src/utility_functions.dart' as utils;
import 'package:test/test.dart';

void utils_tests() {
  group('test util methods', () {
    test('utils.isWhiteSpace works', () {
      expect(utils.isWhiteSpace(32), isTrue);
      expect(utils.isWhiteSpace(9), isTrue);

      expect(utils.isWhiteSpace(62), isFalse);
      expect(utils.isWhiteSpace(97), isFalse);
    });

//    test('utils.isWhiteSpace works', () {
//      expect(utils.isWhiteSpace(' '), isTrue);
//      expect(utils.isWhiteSpace('     '), isTrue);
//      expect(utils.isWhiteSpace(' \t   \t   '), isTrue);
//      expect(utils.isWhiteSpace('\t'), isTrue);
//
//      expect(utils.isWhiteSpace('a    '), isFalse);
//      expect(utils.isWhiteSpace('    D'), isFalse);
//    });

    test('utils.isNumeric works', () {
      expect(utils.isNumeric(47), isFalse);

      expect(utils.isNumeric(48), isTrue);
      expect(utils.isNumeric(57), isTrue);
      
      expect(utils.isNumeric(58), isFalse);

      expect(utils.isNumeric('.'.codeUnitAt(0)), isFalse);
      expect(utils.isNumeric('a'.codeUnitAt(0)), isFalse);


      expect(utils.isNumeric('0'.codeUnitAt(0)), isTrue);
      expect(utils.isNumeric('7'.codeUnitAt(0)), isTrue);
    });



    test('utils.isChar works', () {
//      expect(utils.isChar(0), isFalse);
      expect(utils.isChar(11), isFalse);
      expect(utils.isChar(31), isFalse);

      expect(utils.isChar(32), isTrue);
      expect(utils.isChar(45), isTrue);
      expect(utils.isChar(78), isTrue);
      expect(utils.isChar(90), isTrue);
      expect(utils.isChar(101), isTrue);
      expect(utils.isChar(126), isTrue);

      expect(utils.isChar('d'.codeUnitAt(0)), isTrue);
      expect(utils.isChar('0'.codeUnitAt(0)), isTrue);
      expect(utils.isChar('D'.codeUnitAt(0)), isTrue);
      expect(utils.isChar('&'.codeUnitAt(0)), isTrue);
      expect(utils.isChar('{'.codeUnitAt(0)), isTrue);
      expect(utils.isChar('\''.codeUnitAt(0)), isTrue);

      expect(utils.isChar('\n'.codeUnitAt(0)), isFalse);
      expect(utils.isChar('\r'.codeUnitAt(0)), isFalse);
    });

    test('isPunctuation works', () {
      expect(utils.isPunctuation(32), isFalse);

      expect(utils.isPunctuation(33), isTrue);
      expect(utils.isPunctuation(47), isTrue);

      expect(utils.isPunctuation(48), isFalse);

      expect(utils.isPunctuation(58), isTrue);
      expect(utils.isPunctuation(64), isTrue);

      expect(utils.isPunctuation(65), isFalse);

      expect(utils.isPunctuation(91), isTrue);
      expect(utils.isPunctuation(96), isTrue);

      expect(utils.isPunctuation(97), isFalse);

      expect(utils.isPunctuation(123), isTrue);
      expect(utils.isPunctuation(126), isTrue);

      expect(utils.isPunctuation(127), isFalse);
    });
  });
}
