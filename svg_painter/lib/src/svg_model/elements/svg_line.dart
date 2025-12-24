part of '../svg_element.dart';

/// Represents a <line> element in SVG.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/line
@immutable
final class SvgLine extends SvgGraphicsElement {
  const SvgLine({
    required this.x1,
    required this.y1,
    required this.x2,
    required this.y2,
    super.id,
    super.fill,
    super.stroke,
    super.strokeWidth,
    super.transform,
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
