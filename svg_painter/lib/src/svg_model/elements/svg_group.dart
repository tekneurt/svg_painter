part of '../svg_element.dart';

/// Represents an SVG `<g>` element.
@immutable
final class SvgGroup extends SvgContainerElement {
  const SvgGroup({
    required super.children,
    super.id,
    super.fill,
    super.fillOpacity,
    super.stroke,
    super.opacity,
    super.fontSize,
    super.fontWeight,
    super.fontStyle,
    super.fontFamily,
    super.cssClass,
    super.inlineStyle,
    super.transform,
  });

  @override
  String toString() => 'SvgGroup(children: ${children.length}, id: $id)';
}
