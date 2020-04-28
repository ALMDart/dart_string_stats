class Position {
  final int start;
  final int end;
  int get length => end - start + 1;
  const Position(this.start, this.end);
}
