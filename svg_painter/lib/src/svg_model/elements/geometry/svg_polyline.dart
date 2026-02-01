part of '../../svg_element.dart';

/// Represents a `<polyline>` element in SVG.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/polyline
@immutable
final class SvgPolyline extends SvgBasicShape {
  const SvgPolyline({
    required this.points,
    super.pathLength,
    super.fillAttributes,
    super.strokeAttributes,
    super.opacity,
    super.cssClass,
    super.inlineStyle,
    super.transform,
    super.id,
  });

  /// The points that define the polyline.
  final SvgPointList points;

  @override
  String toString() {
    final List<String> parts = <String>[
      'pts: ${points.points.length}',
      if (pathLength != null) 'pathLength: $pathLength',
      if (id != null) 'id: $id',
    ];
    return 'SvgPolyline(${parts.join(', ')})';
  }
}
