part of '../../svg_element.dart';

/// Represents a `<line>` element in SVG.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/line
@immutable
final class SvgLine extends SvgBasicShape {
  const SvgLine({
    required this.x1,
    required this.y1,
    required this.x2,
    required this.y2,
    super.geometryAttributes,
    super.presentationAttributes,
    super.coreAttributes,
  });

  /// The x-axis coordinate of the start of the line.
  final SvgLengthPercentage x1;

  /// The y-axis coordinate of the start of the line.
  final SvgLengthPercentage y1;

  /// The x-axis coordinate of the end of the line.
  final SvgLengthPercentage x2;

  /// The y-axis coordinate of the end of the line.
  final SvgLengthPercentage y2;

  @override
  String toString() {
    final parts = <String>[
      'x1: $x1',
      'y1: $y1',
      'x2: $x2',
      'y2: $y2',
      if (geometryAttributes != null) 'geometry: $geometryAttributes',
      if (presentationAttributes != null) 'presentation: $presentationAttributes',
      if (coreAttributes != null) 'core: $coreAttributes',
    ];
    return 'SvgLine(${parts.join(', ')})';
  }
}
