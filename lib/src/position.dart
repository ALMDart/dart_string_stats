/// Position class represents a substrings beginning and ending position.
/// Within a Greater String.
class Position {
  /// Position where word starts in string. 0 indexed.
  final int start;

  /// Position where word ends in string. 0 indexed.
  final int end;

  /// The length of the word, calculated from start and end dynamically.
  int get length => end - start + 1;
  const Position(this.start, this.end);
}
