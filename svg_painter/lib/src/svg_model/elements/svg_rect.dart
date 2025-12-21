part of '../svg_element.dart';

/// Represents a <rect> element in SVG.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/rect
@immutable
final class SvgRect extends SvgGraphicsElement {
  const SvgRect({
    required this.x,
    required this.y,
    required this.width,
    required this.height,
    required this.rx,
    required this.ry,
    super.fill,
    super.stroke,
    super.strokeWidth,
  });

  /// The x-axis coordinate of the rectangle.
  final SvgLengthPercentage x;

  /// The y-axis coordinate of the rectangle.
  final SvgLengthPercentage y;

  /// The width of the rectangle.
  final SvgLengthPercentageAuto width;

  /// The height of the rectangle.
  final SvgLengthPercentageAuto height;

  /// The x-axis radius for rounded corners.
  final SvgLengthPercentageAuto rx;

  /// The y-axis radius for rounded corners.
  final SvgLengthPercentageAuto ry;
}
