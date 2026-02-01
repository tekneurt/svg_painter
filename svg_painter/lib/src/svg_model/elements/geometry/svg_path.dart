part of '../../svg_element.dart';

/// Represents an SVG `<path>` element.
@immutable
final class SvgPath extends SvgGraphicsElement with SvgGeometry {
  const SvgPath({
    required this.d,
    this.pathLength,
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
    super.id,
  });

  /// The path data.
  final String d;

  @override
  final SvgNonNegativeNumber? pathLength;

  @override
  String toString() {
    final List<String> parts = <String>[
      'd: $d',
      if (pathLength != null) 'pathLength: $pathLength',
      if (id != null) 'id: $id',
    ];
    return 'SvgPath(${parts.join(', ')})';
  }
}
