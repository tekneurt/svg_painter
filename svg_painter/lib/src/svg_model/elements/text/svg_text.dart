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

  /// The x-axis coordinate(s) of the text.
  final SvgLengthPercentageOrList x;

  /// The y-axis coordinate(s) of the text.
  final SvgLengthPercentageOrList y;

  /// The primary x coordinate.
  SvgLengthPercentage get primaryX => x.primary;

  /// The primary y coordinate.
  SvgLengthPercentage get primaryY => y.primary;

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
