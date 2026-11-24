part of '../../svg_value.dart';

/// Represents a CSS 2 / SVG 1.1 system color in SVG (e.g., 'Background', 'Window').
@immutable
final class SvgSystemColor extends SvgColor {
  const SvgSystemColor(this.name);

  /// The SVG system color name.
  final SvgSystemColorName name;

  @override
  String toString() => 'SvgSystemColor(${name.name})';
}
