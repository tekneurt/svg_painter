import '../../svg_model/_svg_model.dart';

/// Extension on [String] to convert it to an [SvgPointList].
extension ToSvgPointList on String {
  /// Parses the string as an [SvgPointList].
  SvgPointList toSvgPointList() {
    final List<double> points = <double>[];
    final RegExp regex = RegExp(r'[+-]?(\d*\.\d+|\d+)');
    final Iterable<Match> matches = regex.allMatches(this);

    for (final Match match in matches) {
      final double? value = double.tryParse(match.group(0)!);
      if (value != null) {
        points.add(value);
      }
    }

    return SvgPointList(points);
  }
}
