part of '../../svg_element.dart';

/// Represents a `<tspan>` element in SVG.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/tspan
@immutable
final class SvgTspan extends SvgGraphicsElement with SvgFontAttributable, SvgTextContent {
  const SvgTspan({
    required this.children,
    this.x,
    this.y,
    this.dx,
    this.dy,
    this.rotate,
    super.presentationAttributes,
    super.coreAttributes,
  });

  /// The child elements or character data contained within this tspan.
  final List<SvgTextContent> children;

  /// The absolute x-axis coordinates for the characters in the tspan.
  final SvgLengthPercentage? x;

  /// The absolute y-axis coordinates for the characters in the tspan.
  final SvgLengthPercentage? y;

  /// The relative x-axis shifts for the characters in the tspan.
  final SvgLengthPercentage? dx;

  /// The relative y-axis shifts for the characters in the tspan.
  final SvgLengthPercentage? dy;

  /// The supplemental rotation applied to the characters in the tspan.
  final SvgNumber? rotate;

  @override
  SvgFontAttributes? get fontAttributes => presentationAttributes?.font;

  @override
  String toString() => 'SvgTspan(children: ${children.length}, id: $id)';
}
