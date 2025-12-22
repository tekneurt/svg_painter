import '../../svg_model/_svg_model.dart';

extension StringToPointList on String {
  /// Parses a string of points into an [SvgPointList].
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
