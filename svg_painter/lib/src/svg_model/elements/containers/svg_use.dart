part of '../../svg_element.dart';

/// Represents a `<use>` element in SVG.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/use
@immutable
final class SvgUse extends SvgGraphicsElement with SvgFontAttributable, SvgBounded {
  const SvgUse({
    required this.href,
    required this.x,
    required this.y,
    required this.width,
    required this.height,
    super.presentationAttributes,
    super.coreAttributes,
  });

  /// The URI reference to the element to be cloned.
  final String href;

  @override
  final SvgLengthPercentage x;

  @override
  final SvgLengthPercentage y;

  @override
  final SvgLengthPercentageAuto width;

  @override
  final SvgLengthPercentageAuto height;

  @override
  SvgFontAttributes? get fontAttributes => presentationAttributes?.font;

  @override
  String toString() => 'SvgUse(href: $href, id: $id)';
}
