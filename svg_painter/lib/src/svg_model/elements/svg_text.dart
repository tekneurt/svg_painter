part of '../svg_element.dart';

/// Represents a <text> element in SVG.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/text
@immutable
final class SvgText extends SvgGraphicsElement {
  const SvgText({
    required this.x,
    required this.y,
    required this.text,
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
  });

  /// The x-axis coordinate of the starting point of the text.
  final SvgLengthPercentage x;

  /// The y-axis coordinate of the starting point of the text.
  final SvgLengthPercentage y;

  /// The text content.
  final String text;
}
