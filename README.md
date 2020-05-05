# string_stats

## API In Fluid State

Library is still in 0.0.# semver and any opinions on how the final API should work is appreciated.
Particularly looking for help to strictly define what each of the utilities should do.

### Description
string_stats provides utility functions and classes for determining
basic frequency statistics on strings. Provides support for
asynchronous or incremental accumulation.

## Utilities

### Utility Functions

- allCharFrequency
- allPositionsWord
- allWordFrequency
- allWordsPositions
- charCount
- charFrequency
- emptyLineCount
- firstPositionWord
- lineCount
- nonEmptyLineCount
- statistics
- subStringFrequency
- wordCount
- wordFrequency

### Utility Classes

- AllCharFrequencyCounter
- AllWordFrequencyCounter
- CharCounter
- CharFrequencyCounter
- StatisticsCounter
- WordCounter
- WordFrequencyCounter

### String Extensions
- where(bool Function(String))
- isNumeric
- isPunctuation
- isChar
- isWhiteSpace
- generateUnicodeString

### Return Class
- StringStatistics

### Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: https://github.com/ALMaclaine/dart_string_stats/issues
