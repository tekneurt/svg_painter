part of '../../svg_element.dart';

/// Represents an `<image>` element in SVG.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/image
@immutable
final class SvgImage extends SvgGraphicsElement
    with SvgBounded, SvgViewportAttributable {
  const SvgImage({
    required this.href,
    this.x,
    this.y,
    this.width,
    this.height,
    this.viewportAttributes,
    this.decoding = SvgImageDecoding.auto,
    super.presentationAttributes,
    super.coreAttributes,
  });

  /// The URL of the image.
  final String href;

  @override
  final SvgLengthPercentageAuto? x;

  @override
  final SvgLengthPercentageAuto? y;

  @override
  final SvgLengthPercentageAuto? width;

  @override
  final SvgLengthPercentageAuto? height;

  @override
  final SvgViewportAttributes? viewportAttributes;

  /// The decoding hint for the image.
  final SvgImageDecoding decoding;

  @override
  String toString() {
    return 'SvgImage(href: $href, x: $x, y: $y, width: $width, height: $height, decoding: $decoding, id: $id)';
  }
}
