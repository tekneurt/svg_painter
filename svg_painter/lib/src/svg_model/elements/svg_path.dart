part of '../svg_element.dart';

/// Represents an SVG <path> element.
@immutable
final class SvgPath extends SvgGraphicsElement {
  const SvgPath({
    required this.d,
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
    super.pathLength,
    super.id,
  });

  /// The path data.
  final String d;

  @override
  String toString() => 'SvgPath(d: $d, id: $id)';
}
