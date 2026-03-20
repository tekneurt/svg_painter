part of '../../svg_element.dart';

/// Represents an SVG `<path>` element.
@immutable
final class SvgPath extends SvgGraphicsElement with SvgGeometryAttributable {
  const SvgPath({
    required this.d,
    this.geometryAttributes,
    super.presentationAttributes,
    super.coreAttributes,
  });

  /// The path data.
  final String d;

  @override
  final SvgGeometryAttributes? geometryAttributes;

  @override
  String toString() {
    final List<String> parts = <String>[
      'd: $d',
      if (geometryAttributes != null) 'geometry: $geometryAttributes',
      if (presentationAttributes != null) 'presentation: $presentationAttributes',
      if (coreAttributes != null) 'core: $coreAttributes',
    ];
    return 'SvgPath(${parts.join(', ')})';
  }
}
