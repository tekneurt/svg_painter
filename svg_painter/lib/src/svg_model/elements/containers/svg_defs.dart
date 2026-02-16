part of '../../svg_element.dart';

/// Represents a `<defs>` element in SVG.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/defs
@immutable
final class SvgDefs extends SvgDefinitionElement
    with SvgParent, SvgFontAttributable, SvgFillAttributable, SvgStrokeAttributable {
  const SvgDefs({
    required this.children,
    this.fontAttributes,
    this.fillAttributes,
    this.strokeAttributes,
    super.id,
  });

  @override
  final List<SvgElement> children;

  @override
  final SvgFontAttributes? fontAttributes;

  @override
  final SvgFillAttributes? fillAttributes;

  @override
  final SvgStrokeAttributes? strokeAttributes;

  @override
  String toString() => 'SvgDefs(children: ${children.length}, id: $id)';
}
