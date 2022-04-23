extension DurationX on Duration {
  Duration operator /(double value) =>
      Duration(microseconds: (inMicroseconds / value).round());
}
