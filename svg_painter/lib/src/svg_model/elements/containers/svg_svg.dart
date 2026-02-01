part of '../../svg_element.dart';

/// Represents an `<svg>` element (generic container).
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/svg
base class SvgSvg extends SvgContainerElement {
  const SvgSvg({
    required super.children,
    this.width,
    this.height,
    this.viewBox,
    this.x,
    this.y,
    this.styleSheet = const SvgStyleSheet.empty(),
    super.id,
    super.fillAttributes,
    super.strokeAttributes,
    super.fontAttributes,
    super.opacity,
    super.cssClass,
    super.inlineStyle,
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

  /// The CSS rules defined for this SVG (or empty for non-root SVGs).
  final SvgStyleSheet styleSheet;

  @override
  String toString() => 'SvgSvg(children: ${children.length}, id: $id)';
}

/// Represents the root `<svg>` element.
final class SvgRoot extends SvgSvg {
  const SvgRoot({
    required super.children,
    super.styleSheet,
    super.x,
    super.y,
    super.width,
    super.height,
    super.viewBox,
    super.id,
    super.fillAttributes,
    super.strokeAttributes,
    super.fontAttributes,
    super.opacity,
    super.cssClass,
    super.inlineStyle,
    super.transform,
  });

  @override
  String toString() => 'SvgRoot(children: ${children.length}, id: $id)';
}
