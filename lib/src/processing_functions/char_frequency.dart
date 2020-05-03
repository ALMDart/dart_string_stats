int charFrequency(String str, String char) {
  if(char.length != 1) return 0;
  final charCode = char.codeUnitAt(0);
  return str.runes.where((rune) => rune == charCode).length;
}
