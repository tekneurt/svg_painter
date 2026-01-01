part of '../svg_element.dart';

/// Represents an <ellipse> element in SVG.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/ellipse
@immutable
final class SvgEllipse extends SvgBasicShape {
  const SvgEllipse({
    required this.cx,
    required this.cy,
    required this.rx,
    required this.ry,
    super.id,
    super.fill,
    super.stroke,
    super.strokeWidth,
    super.strokeLinecap,
    super.strokeLinejoin,
    super.opacity,
    super.fontSize,
    super.fontWeight,
    super.fontStyle,
    super.fontFamily,
    super.cssClass,
    super.inlineStyle,
    super.transform,
    super.pathLength,
    super.strokeDasharray,
  });

  /// The x-axis coordinate of the center of the ellipse.
  final SvgLengthPercentage cx;

  /// The y-axis coordinate of the center of the ellipse.
  final SvgLengthPercentage cy;

  /// The x-axis radius of the ellipse.
  final SvgLengthPercentageAuto rx;

  /// The y-axis radius of the ellipse.
  final SvgLengthPercentageAuto ry;
}
