part of '../svg_element.dart';

/// Represents a <line> element in SVG.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/line
@immutable
final class SvgLine extends SvgBasicShape {
  const SvgLine({
    required this.x1,
    required this.y1,
    required this.x2,
    required this.y2,
    super.id,
    super.fill,
    super.fillOpacity,
    super.stroke,
    super.strokeOpacity,
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

  /// The x-axis coordinate of the start of the line.
  final SvgLengthPercentage x1;

  /// The y-axis coordinate of the start of the line.
  final SvgLengthPercentage y1;

  /// The x-axis coordinate of the end of the line.
  final SvgLengthPercentage x2;

  /// The y-axis coordinate of the end of the line.
  final SvgLengthPercentage y2;
}
