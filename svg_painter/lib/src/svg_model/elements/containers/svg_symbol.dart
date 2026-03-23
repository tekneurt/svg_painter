part of '../../svg_element.dart';

/// Represents a `<symbol>` element in SVG.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/symbol
@immutable
final class SvgSymbol extends SvgContainerElement with SvgViewportAttributable, SvgBounded {
  const SvgSymbol({
    required super.children,
    this.x,
    this.y,
    this.width,
    this.height,
    this.viewportAttributes,
    super.presentationAttributes,
    super.coreAttributes,
  });

  @override
  final SvgLengthPercentage? x;

  @override
  final SvgLengthPercentage? y;

  @override
  final SvgLengthPercentageAuto? width;

  @override
  final SvgLengthPercentageAuto? height;

  @override
  final SvgViewportAttributes? viewportAttributes;

  @override
  String toString() => 'SvgSymbol(children: ${children.length}, id: $id)';
}
