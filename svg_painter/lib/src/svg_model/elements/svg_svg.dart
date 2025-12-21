part of '../svg_element.dart';

/// Represents an <svg> element (generic container).
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/svg
@immutable
base class SvgSvg extends SvgGraphicsElement {
  const SvgSvg({
    required this.children,
    this.width,
    this.height,
    this.viewBox,
    super.fill,
    super.stroke,
    super.strokeWidth,
  });

  /// The child elements contained within this SVG.
  final List<SvgElement> children;

  /// The width of the SVG.
  final SvgLengthPercentageAuto? width;

  /// The height of the SVG.
  final SvgLengthPercentageAuto? height;

  /// The viewBox of the SVG.
  final SvgViewBox? viewBox;
}

/// Represents the root <svg> element.
@immutable
final class SvgRoot extends SvgSvg {
  const SvgRoot({
    required super.children,
    super.width,
    super.height,
    super.viewBox,
    super.fill,
    super.stroke,
    super.strokeWidth,
  });
}
