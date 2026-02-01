part of '../../svg_element.dart';

/// Represents an `<ellipse>` element in SVG.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/ellipse
@immutable
final class SvgEllipse extends SvgBasicShape {
  const SvgEllipse({
    required this.cx,
    required this.cy,
    required this.rx,
    required this.ry,
    super.pathLength,
    super.fill,
    super.stroke,
    super.opacity,
    super.cssClass,
    super.inlineStyle,
    super.transform,
    super.id,
  });

  /// The x-axis coordinate of the center of the ellipse.
  final SvgLengthPercentage cx;

  /// The y-axis coordinate of the center of the ellipse.
  final SvgLengthPercentage cy;

  /// The x-axis radius of the ellipse.
  final SvgLengthPercentageAuto rx;

  /// The y-axis radius of the ellipse.
  final SvgLengthPercentageAuto ry;

  @override
  String toString() {
    final List<String> parts = <String>[
      'cx: $cx',
      'cy: $cy',
      'rx: $rx',
      'ry: $ry',
      if (pathLength != null) 'pathLength: $pathLength',
      if (id != null) 'id: $id',
    ];
    return 'SvgEllipse(${parts.join(', ')})';
  }
}
