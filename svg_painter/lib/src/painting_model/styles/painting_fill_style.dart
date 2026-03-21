part of 'painting_style.dart';

/// Represents the filling style for an SVG element.
@immutable
final class PaintingFillStyle implements PaintingPaintStyle {
  const PaintingFillStyle({
    this.colorArgb,
    this.shaderId,
    this.shaderUnits,
    this.opacity = 1.0,
    this.isExplicit = true,
    this.isCurrentColor = false,
  }) : assert(opacity >= 0.0 && opacity <= 1.0, 'Opacity must be between 0.0 and 1.0');

  /// The ARGB integer for the fill color.
  @override
  final int? colorArgb;

  /// The ID of the shader (e.g., gradient) to use for filling.
  @override
  final String? shaderId;

  /// The coordinate system used for the shader coordinates.
  @override
  final PaintingGradientUnits? shaderUnits;

  /// The opacity of the fill (0.0 to 1.0).
  @override
  final double opacity;

  /// Whether this fill was explicitly defined on the element (not just inherited).
  @override
  final bool isExplicit;

  /// Whether this fill uses the 'currentColor' keyword.
  @override
  final bool isCurrentColor;

  @override
  String toString() =>
      'PaintingFillStyle(color: $colorArgb, shader: $shaderId, units: $shaderUnits, opacity: $opacity, explicit: $isExplicit, currentColor: $isCurrentColor)';
}
