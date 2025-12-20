part of '../svg_element.dart';

/// Represents an <svg> element (generic container).
@immutable
base class SvgSvg extends SvgElement {
  const SvgSvg({required this.children});

  /// The child elements contained within this SVG.
  final List<SvgElement> children;
}

/// Represents the root <svg> element.
@immutable
final class SvgRoot extends SvgSvg {
  const SvgRoot({required super.children});
}
