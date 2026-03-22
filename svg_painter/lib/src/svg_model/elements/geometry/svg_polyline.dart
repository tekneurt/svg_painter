part of '../../svg_element.dart';

/// Represents a `<polyline>` element in SVG.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/polyline
@immutable
final class SvgPolyline extends SvgBasicShape {
  const SvgPolyline({
    required this.points,
    super.geometryAttributes,
    super.presentationAttributes,
    super.coreAttributes,
  });

  /// The points that define the polyline.
  final SvgPointList points;

  @override
  String toString() {
    final parts = <String>[
      'pts: ${points.points.length}',
      if (geometryAttributes != null) 'geometry: $geometryAttributes',
      if (presentationAttributes != null) 'presentation: $presentationAttributes',
      if (coreAttributes != null) 'core: $coreAttributes',
    ];
    return 'SvgPolyline(${parts.join(', ')})';
  }
}
