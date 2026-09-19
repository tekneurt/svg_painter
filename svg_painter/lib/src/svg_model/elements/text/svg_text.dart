part of '../../svg_element.dart';

/// Represents a `<text>` element in SVG.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/text
@immutable
final class SvgText extends SvgGraphicsElement with SvgFontAttributable, SvgTextContent {
  const SvgText({
    required this.x,
    required this.y,
    required this.children,
    this.dx,
    this.dy,
    super.title,
    super.desc,
    super.presentationAttributes,
    super.coreAttributes,
  });

  /// The x-axis coordinate of the starting point of the text.
  final SvgLengthPercentage x;

  /// The y-axis coordinate of the starting point of the text.
  final SvgLengthPercentage y;

  /// The relative x-axis shift for the text.
  final SvgLengthPercentage? dx;

  /// The relative y-axis shift for the text.
  final SvgLengthPercentage? dy;

  /// The child elements or character data contained within this text element.
  final List<SvgTextContent> children;

  @override
  SvgFontAttributes? get fontAttributes => presentationAttributes?.font;

  @override
  String toString() => 'SvgText(x: $x, y: $y, dx: $dx, dy: $dy, children: ${children.length}, id: $id)';
}
