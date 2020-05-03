import 'package:string_stats/src/utility_functions.dart';

/// Counts the number of characters in str.
int charCount(String str) => str.runes.where(isChar).length;
