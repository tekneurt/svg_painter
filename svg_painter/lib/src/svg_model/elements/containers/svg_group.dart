part of '../../svg_element.dart';

/// Represents an SVG `<g>` element.
@immutable
final class SvgGroup extends SvgContainerElement {
  const SvgGroup({
    required super.children,
    super.id,
    super.fillAttributes,
    super.strokeAttributes,
    super.fontAttributes,
    super.opacity,
    super.cssClass,
    super.inlineStyle,
    super.transformAttributes,
  });

  @override
  String toString() => 'SvgGroup(children: ${children.length}, id: $id)';
}
