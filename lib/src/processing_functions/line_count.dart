import 'package:string_stats/src/processing_functions/char_frequency.dart';

/// Determines the number of lines in str.
int lineCount(String str) =>
    charFrequency(str, '\n', filterNonChars: false) + 1;
