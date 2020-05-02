import 'package:string_stats/src/utility_functions.dart';

int charCount(String str) => str.runes.where(isChar).length;
