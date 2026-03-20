part of '../../svg_element.dart';

/// Represents a `<polygon>` element in SVG.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/polygon
@immutable
final class SvgPolygon extends SvgBasicShape {
  const SvgPolygon({
    required this.points,
    super.geometryAttributes,
    super.presentationAttributes,
    super.coreAttributes,
  });

  /// The points that define the polygon.
  final SvgPointList points;

  @override
  String toString() {
    final List<String> parts = <String>[
      'pts: ${points.points.length}',
      if (geometryAttributes != null) 'geometry: $geometryAttributes',
      if (presentationAttributes != null) 'presentation: $presentationAttributes',
      if (coreAttributes != null) 'core: $coreAttributes',
    ];
    return 'SvgPolygon(${parts.join(', ')})';
  }
}
