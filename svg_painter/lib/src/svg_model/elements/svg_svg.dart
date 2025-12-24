part of '../svg_element.dart';

/// Represents an <svg> element (generic container).
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/svg
@immutable
base class SvgSvg extends SvgContainerElement {
  const SvgSvg({
    required super.children,
    this.x,
    this.y,
    this.width,
    this.height,
    this.viewBox,
    super.id,
    super.fill,
    super.stroke,
    super.strokeWidth,
    super.transform,
  });

  /// The x-axis coordinate of the SVG.
  final SvgLengthPercentage? x;

  /// The y-axis coordinate of the SVG.
  final SvgLengthPercentage? y;

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
    super.x,
    super.y,
    super.width,
    super.height,
    super.viewBox,
    super.id,
    super.fill,
    super.stroke,
    super.strokeWidth,
    super.transform,
  });
}
