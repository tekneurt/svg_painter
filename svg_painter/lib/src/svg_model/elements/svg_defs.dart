part of '../svg_element.dart';

/// Represents a <defs> element in SVG.
///
/// See: https://developer.mozilla.org/en-US/docs/Web/SVG/Element/defs
@immutable
final class SvgDefs extends SvgElement {
  const SvgDefs({required this.children, super.id});

  /// The child elements contained within these definitions.
  final List<SvgElement> children;
}
