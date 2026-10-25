part of '../../svg_element.dart';

/// Represents an `<feDropShadow>` filter primitive element.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/feDropShadow
@immutable
final class SvgFeDropShadow extends SvgFilterPrimitive {
  const SvgFeDropShadow({
    this.dx = 2.0,
    this.dy = 2.0,
    this.stdDeviationX = 2.0,
    this.stdDeviationY = 2.0,
    this.floodColor = const SvgNamedColor(SvgColorName.black),
    this.floodOpacity = 1.0,
    super.inSource,
    super.result,
    super.coreAttributes,
  });

  /// The horizontal offset of the drop shadow.
  final double dx;

  /// The vertical offset of the drop shadow.
  final double dy;

  /// The standard deviation for the blur operation along the x-axis.
  final double stdDeviationX;

  /// The standard deviation for the blur operation along the y-axis.
  final double stdDeviationY;

  /// The color of the drop shadow.
  final SvgColor floodColor;

  /// The opacity of the drop shadow.
  final double floodOpacity;
}
