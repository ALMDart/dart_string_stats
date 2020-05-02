import 'package:string_stats/src/utility_functions.dart';
import 'package:string_stats/src/utility_extensions.dart';
import 'package:string_stats/string_stats.dart';

void main() {
  var str = generateUnicodeString(15);
  str = String.fromCharCode(15) + str;
  print(str);
  print(str.runes.length);
  print(charCount(str));

  print('1awd'[0].isNumeric());
}
