part of '../../svg_element.dart';

/// Represents an `<svg>` element (generic container).
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/svg
base class SvgSvg extends SvgContainerElement with SvgViewportAttributable, SvgBounded {
  const SvgSvg({
    required super.children,
    this.width,
    this.height,
    this.viewportAttributes,
    this.x,
    this.y,
    this.styleSheet = const SvgStyleSheet.empty(),
    super.presentationAttributes,
    super.coreAttributes,
  });

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
    super.viewportAttributes,
    super.presentationAttributes,
    super.coreAttributes,
  });

  @override
  String toString() => 'SvgRoot(children: ${children.length}, id: $id)';
}
