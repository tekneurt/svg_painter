part of 'painting_style.dart';

/// Represents the filling style for an SVG element.
@immutable
final class PaintingFillStyle {
  const PaintingFillStyle({
    this.colorArgb,
    this.shaderId,
    this.opacity = 1.0,
  });

  /// The ARGB integer for the fill color.
  final int? colorArgb;

  /// The ID of the shader (e.g., gradient) to use for filling.
  final String? shaderId;

  /// The opacity of the fill (0.0 to 1.0).
  final double opacity;

  @override
  String toString() => 'PaintingFillStyle(color: $colorArgb, shader: $shaderId, opacity: $opacity)';
}
