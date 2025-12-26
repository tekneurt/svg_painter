part of '../svg_element.dart';

/// Represents an SVG <g> element.
@immutable
final class SvgGroup extends SvgContainerElement {
  const SvgGroup({
    required super.children,
    super.id,
    super.fill,
    super.stroke,
    super.strokeWidth,
    super.strokeLinecap,
    super.strokeLinejoin,
    super.opacity,
    super.cssClass,
    super.inlineStyle,
    super.transform,
  });
}
