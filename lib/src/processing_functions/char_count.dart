import 'package:string_stats/src/utils.dart';

int charCount(String str) => isNull(str) ? 0 : str.runes.where(isChar).length;
