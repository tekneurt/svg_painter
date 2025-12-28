part of '../svg_element.dart';

/// Represents an SVG <path> element.
@immutable
final class SvgPath extends SvgGraphicsElement {
  const SvgPath({
    required this.d,
    super.id,
    super.fill,
    super.stroke,
    super.strokeWidth,
    super.strokeLinecap,
    super.strokeLinejoin,
    super.opacity,
    super.fontSize,
    super.fontWeight,
    super.fontStyle,
    super.fontFamily,
    super.cssClass,
    super.inlineStyle,
    super.transform,
  });

  /// The path data.
  final String d;
}
