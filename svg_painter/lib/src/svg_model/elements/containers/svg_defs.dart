part of '../../svg_element.dart';

/// Represents a `<defs>` element in SVG.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/defs
@immutable
final class SvgDefs extends SvgDefinitionElement
    with SvgParent, SvgPresentable, SvgFontAttributable, SvgFillAttributable, SvgStrokeAttributable {
  const SvgDefs({
    required this.children,
    this.presentationAttributes,
    super.coreAttributes,
  });

  @override
  final List<SvgElement> children;

  @override
  final SvgPresentationAttributes? presentationAttributes;

  @override
  SvgFontAttributes? get fontAttributes => presentationAttributes?.font;

  @override
  SvgFillAttributes? get fillAttributes => presentationAttributes?.fill;

  @override
  SvgStrokeAttributes? get strokeAttributes => presentationAttributes?.stroke;

  @override
  String toString() => 'SvgDefs(children: ${children.length}, id: $id)';
}
