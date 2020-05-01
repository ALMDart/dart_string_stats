int charFrequency(String str, String char) {
  final charCode = char.codeUnitAt(0);
  return str.runes.where((rune) => rune == charCode).length;
}
