part of '../svg_element.dart';

/// Represents a <rect> element in SVG.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/rect
@immutable
final class SvgRect extends SvgBasicShape {
  const SvgRect({
    required this.x,
    required this.y,
    required this.width,
    required this.height,
    required this.rx,
    required this.ry,
    super.id,
    super.fill,
    super.stroke,
    super.strokeWidth,
    super.strokeLinecap,
    super.strokeLinejoin,
    super.opacity,
    super.cssClass,
    super.inlineStyle,
    super.transform,
  });

  /// The x-axis coordinate of the side of the rectangle which has the smaller x-axis coordinate value.
  final SvgLengthPercentage x;

  /// The y-axis coordinate of the side of the rectangle which has the smaller y-axis coordinate value.
  final SvgLengthPercentage y;

  /// The width of the rectangle.
  final SvgLengthPercentageAuto width;

  /// The height of the rectangle.
  final SvgLengthPercentageAuto height;

  /// For rounded rectangles, the x-axis radius of the ellipse used to round off the corners of the rectangle.
  final SvgLengthPercentageAuto rx;

  /// For rounded rectangles, the y-axis radius of the ellipse used to round off the corners of the rectangle.
  final SvgLengthPercentageAuto ry;
}
