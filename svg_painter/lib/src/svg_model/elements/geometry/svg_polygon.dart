part of '../../svg_element.dart';

/// Represents a `<polygon>` element in SVG.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/polygon
@immutable
final class SvgPolygon extends SvgBasicShape {
  const SvgPolygon({
    required this.points,
    super.pathLength,
    super.fillAttributes,
    super.strokeAttributes,
    super.opacity,
    super.cssClass,
    super.inlineStyle,
    super.transformAttributes,
    super.id,
  });

  /// The points that define the polygon.
  final SvgPointList points;

  @override
  String toString() {
    final List<String> parts = <String>[
      'pts: ${points.points.length}',
      if (pathLength != null) 'pathLength: $pathLength',
      if (id != null) 'id: $id',
    ];
    return 'SvgPolygon(${parts.join(', ')})';
  }
}
