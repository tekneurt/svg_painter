part of '../../svg_element.dart';

/// Represents an `<svg>` element (generic container).
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/svg
base class SvgSvg extends SvgContainerElement with SvgViewportAttributable, SvgPresentable {
  const SvgSvg({
    required super.children,
    this.x,
    this.y,
    this.width,
    this.height,
    this.viewportAttributes,
    super.presentationAttributes,
    super.coreAttributes,
  });

  final SvgLengthPercentage? x;

  final SvgLengthPercentage? y;

  final SvgLengthPercentageAuto? width;

  final SvgLengthPercentageAuto? height;

  @override
  final SvgViewportAttributes? viewportAttributes;

  @override
  String toString() => 'SvgSvg(children: ${children.length}, id: $id)';
}
