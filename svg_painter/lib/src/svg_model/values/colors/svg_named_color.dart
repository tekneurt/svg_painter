part of '../../svg_value.dart';

/// Represents a named color in SVG (e.g., 'red', 'blue').
@immutable
final class SvgNamedColor extends SvgColor {
  const SvgNamedColor(this.name);

  /// The SVG color name.
  final SvgColorName name;

  @override
  String toString() => 'SvgNamedColor(${name.name})';
}
