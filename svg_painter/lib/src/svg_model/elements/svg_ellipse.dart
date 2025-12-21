part of '../svg_element.dart';

/// Represents an <ellipse> element in SVG.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/ellipse
@immutable
final class SvgEllipse extends SvgGraphicsElement {
  const SvgEllipse({
    required this.cx,
    required this.cy,
    required this.rx,
    required this.ry,
    super.fill,
    super.stroke,
    super.strokeWidth,
  });

  /// The x-coordinate of the center of the ellipse.
  final SvgLengthPercentage cx;

  /// The y-coordinate of the center of the ellipse.
  final SvgLengthPercentage cy;

  /// The x-axis radius of the ellipse.
  final SvgLengthPercentageAuto rx;

  /// The y-axis radius of the ellipse.
  final SvgLengthPercentageAuto ry;
}
