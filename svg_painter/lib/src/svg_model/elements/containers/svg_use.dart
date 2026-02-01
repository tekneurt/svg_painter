part of '../../svg_element.dart';

/// Represents a `<use>` element in SVG.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/use
@immutable
final class SvgUse extends SvgGraphicsElement with SvgFontStylable {
  const SvgUse({
    required this.href,
    required this.x,
    required this.y,
    required this.width,
    required this.height,
    super.id,
    super.fill,
    super.stroke,
    this.font,
    super.opacity,
    super.cssClass,
    super.inlineStyle,
    super.transform,
  });

  /// The URI reference to the element to be cloned.
  final String href;

  /// The x-axis coordinate of the element.
  final SvgLengthPercentage x;

  /// The y-axis coordinate of the element.
  final SvgLengthPercentage y;

  /// The width of the element.
  final SvgLengthPercentageAuto width;

  /// The height of the referenced element.
  final SvgLengthPercentageAuto? height;

  @override
  final SvgFontAttributes? font;

  @override
  String toString() => 'SvgUse(href: $href, id: $id)';
}
