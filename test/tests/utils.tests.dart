import 'package:string_stats/src/utils.dart' as utils;
import 'package:test/test.dart';

void utils_tests() {
  group('test util methods', () {
    test('utils.isWhiteSpaceCodePoint works', () {
      expect(utils.isWhiteSpaceCodePoint(32), isTrue);
      expect(utils.isWhiteSpaceCodePoint(9), isTrue);

      expect(utils.isWhiteSpaceCodePoint(62), isFalse);
      expect(utils.isWhiteSpaceCodePoint(97), isFalse);
    });

    test('utils.isWhiteSpace works', () {
      expect(utils.isWhiteSpace(' '), isTrue);
      expect(utils.isWhiteSpace('     '), isTrue);
      expect(utils.isWhiteSpace(' \t   \t   '), isTrue);
      expect(utils.isWhiteSpace('\t'), isTrue);

      expect(utils.isWhiteSpace('a    '), isFalse);
      expect(utils.isWhiteSpace('    D'), isFalse);
    });

    test('utils.isChar works', () {
      expect(utils.isChar(null), isFalse);

      expect(utils.isChar(0), isFalse);
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

    test('isNull works', () {
      expect(utils.isNull(null), isTrue);
      expect(utils.isNull('a'), isFalse);
    });

    test('isNull works', () {
      expect(utils.isNull(null), isTrue);
      expect(utils.isNull('a'), isFalse);
    });

    test('isCharNotSpace works', () {
      expect(utils.isCharNotSpace(32), isFalse);
      expect(utils.isCharNotSpace(45), isTrue);
    });
  });
}
