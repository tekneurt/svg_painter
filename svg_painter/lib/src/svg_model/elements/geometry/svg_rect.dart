part of '../../svg_element.dart';

/// Represents a `<rect>` element in SVG.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/rect
@immutable
final class SvgRect extends SvgBasicShape with SvgBounded {
  const SvgRect({
    required this.x,
    required this.y,
    required this.width,
    required this.height,
    required this.rx,
    required this.ry,
    super.pathLength,
    super.fillAttributes,
    super.strokeAttributes,
    super.opacity,
    super.cssClass,
    super.inlineStyle,
    super.transformAttributes,
    super.id,
  });

  @override
  final SvgLengthPercentage x;

  @override
  final SvgLengthPercentage y;

  @override
  final SvgLengthPercentageAuto width;

  @override
  final SvgLengthPercentageAuto height;

  /// For rounded rectangles, the x-axis radius of the ellipse used to round off the corners of the rectangle.
  final SvgLengthPercentageAuto rx;

  /// The y-axis radius of the rectangle's corners.
  final SvgLengthPercentageAuto ry;

  @override
  String toString() {
    final List<String> parts = <String>[
      'x: $x',
      'y: $y',
      'w: $width',
      'h: $height',
      'rx: $rx',
      'ry: $ry',
      if (pathLength != null) 'pathLength: $pathLength',
      if (id != null) 'id: $id',
    ];
    return 'SvgRect(${parts.join(', ')})';
  }
}
