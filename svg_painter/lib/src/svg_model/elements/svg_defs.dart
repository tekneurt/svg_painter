part of '../svg_element.dart';

/// Represents a <defs> element in SVG.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Reference/Element/defs
@immutable
final class SvgDefs extends SvgDefinitionElement with SvgParent {
  const SvgDefs({
    required this.children,
    super.id,
  });

  @override
  final List<SvgElement> children;
}
