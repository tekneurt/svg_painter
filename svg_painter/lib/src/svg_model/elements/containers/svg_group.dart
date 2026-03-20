part of '../../svg_element.dart';

/// Represents an SVG `<g>` element.
@immutable
final class SvgGroup extends SvgContainerElement {
  const SvgGroup({
    required super.children,
    super.presentationAttributes,
    super.coreAttributes,
  });

  @override
  String toString() => 'SvgGroup(children: ${children.length}, id: $id)';
}
