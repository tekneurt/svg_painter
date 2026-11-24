part of '../../svg_element.dart';

/// Represents an `<feFlood>` filter primitive element.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/feFlood
@immutable
final class SvgFeFlood extends SvgFilterPrimitive {
  const SvgFeFlood({
    this.floodColor = const SvgNamedColor(SvgColorName.black),
    this.floodOpacity = 1.0,
    this.x,
    this.y,
    this.width,
    this.height,
    super.inSource,
    super.result,
    super.coreAttributes,
  });

  /// The color to use to flood the subregion.
  final SvgColor floodColor;

  /// The opacity to use to flood the subregion.
  final double floodOpacity;

  /// Optional x coordinate of the filter subregion.
  final SvgLengthPercentage? x;

  /// Optional y coordinate of the filter subregion.
  final SvgLengthPercentage? y;

  /// Optional width of the filter subregion.
  final SvgLengthPercentage? width;

  /// Optional height of the filter subregion.
  final SvgLengthPercentage? height;
}
