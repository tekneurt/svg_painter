part of '../../svg_element.dart';

/// Represents an SVG `<switch>` element.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/switch
@immutable
final class SvgSwitch extends SvgContainerElement {
  const SvgSwitch({
    required super.children,
    super.title,
    super.desc,
    super.presentationAttributes,
    super.coreAttributes,
  });

  @override
  String toString() => 'SvgSwitch(children: ${children.length}, id: $id)';
}
