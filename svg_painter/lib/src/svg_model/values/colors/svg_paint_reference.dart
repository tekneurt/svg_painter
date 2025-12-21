part of '../../svg_value.dart';

/// Represents a reference to a paint server (gradient, pattern) via 'url(#id)'.
@immutable
final class SvgPaintReference extends SvgColor {
  const SvgPaintReference(this.id, {this.fallback});

  /// The ID of the referenced element.
  final String id;

  /// Optional fallback color if the reference is invalid.
  final SvgColor? fallback;

  @override
  String toString() => 'SvgPaintReference($id, fallback: $fallback)';
}
