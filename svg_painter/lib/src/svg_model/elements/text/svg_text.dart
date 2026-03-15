part of '../../svg_element.dart';

/// Represents a `<text>` element in SVG.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/text
@immutable
final class SvgText extends SvgGraphicsElement with SvgFontAttributable {
  const SvgText({
    required this.x,
    required this.y,
    required this.text,
    super.fillAttributes,
    super.strokeAttributes,
    this.fontAttributes,
    super.opacity,
    super.cssClass,
    super.inlineStyle,
    super.transformAttributes,
    super.id,
  });

  /// The x-axis coordinate of the starting point of the text.
  final SvgLengthPercentage x;

  /// The y-axis coordinate of the starting point of the text.
  final SvgLengthPercentage y;

  /// The text content to draw.
  final String text;

  @override
  final SvgFontAttributes? fontAttributes;

  @override
  String toString() => 'SvgText(x: $x, y: $y, text: $text, id: $id)';
}
