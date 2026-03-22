import '../../svg_model/_svg_model.dart';

/// Extension on [String] to convert it to an [SvgPointList].
extension ToSvgPointList on String {
  /// Parses the string as an [SvgPointList].
  SvgPointList toSvgPointList() {
    final points = <double>[];
    // Match numbers (including scientific notation) or any other non-separator tokens
    final regex = RegExp(r'[+-]?\d*\.?\d+(?:[eE][+-]?\d+)?|[^,\s]+');
    final Iterable<Match> matches = regex.allMatches(this);

    for (final match in matches) {
      final String? group = match.group(0);
      if (group == null) {
        break;
      }
      try {
        points.add(double.parse(group));
      } on FormatException {
        // According to SVG spec, if an invalid value is encountered (e.g. "1,B,2"),
        // parsing stops immediately and returns the valid values parsed so far.
        break;
      }
    }

    return SvgPointList(points);
  }
}
