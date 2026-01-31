import '../../svg_model/_svg_model.dart';

/// Extension on [String] to convert it to an [SvgPointList].
extension ToSvgPointList on String {
  /// Parses the string as an [SvgPointList].
  SvgPointList toSvgPointList() {
    final List<double> points = <double>[];
    // Match numbers (including scientific notation) or any other non-separator tokens
    final RegExp regex = RegExp(r'[+-]?\d*\.?\d+(?:[eE][+-]?\d+)?|[^,\s]+');
    final Iterable<Match> matches = regex.allMatches(this);

    for (final Match match in matches) {
      try {
        points.add(double.parse(match.group(0)!));
      } on FormatException {
        // According to SVG spec, if an invalid value is encountered (e.g. "1,B,2"),
        // parsing stops immediately and returns the valid values parsed so far.
        break;
      }
    }

    return SvgPointList(points);
  }
}
