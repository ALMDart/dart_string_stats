import 'package:string_stats/src/utils.dart';

int charCount(String str) => str.runes.where(isChar).length;
