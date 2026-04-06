part of 'painting_style.dart';

/// Enumeration of possible values for stroke line caps.
enum PaintingStrokeCap {
  /// The stroke is terminated at the end of the path.
  butt,

  /// The stroke is terminated with a rounded end.
  round,

  /// The stroke is terminated with a square end.
  square,
}

/// Enumeration of possible values for stroke line joins.
enum PaintingStrokeJoin {
  /// A sharp corner is created.
  miter,

  /// A rounded corner is created.
  round,

  /// A beveled corner is created.
  bevel,
}

/// Represents the stroking style for an SVG element.
@immutable
final class PaintingStrokeStyle implements PaintingPaintStyle {
  const PaintingStrokeStyle({
    this.colorArgb,
    this.shaderId,
    this.shaderUnits,
    this.width = 1.0,
    this.pathLength,
    this.opacity = 1.0,
    this.cap = PaintingStrokeCap.butt,
    this.join = PaintingStrokeJoin.miter,
    this.miterLimit = 4.0,
    this.dashArray,
    this.isExplicit = true,
    this.isCurrentColor = false,
  })  : assert(opacity >= 0.0 && opacity <= 1.0, 'Opacity must be between 0.0 and 1.0'),
        assert(miterLimit >= 1.0, 'Miter limit must be greater than or equal to 1.0');

  /// The ARGB integer for the stroke color.
  @override
  final int? colorArgb;

  /// The ID of the shader (e.g., gradient) to use for stroking.
  @override
  final String? shaderId;

  /// The coordinate system used for the shader coordinates.
  @override
  final PaintingGradientUnits? shaderUnits;

  /// The width of the stroke.
  final double width;

  /// The total length of the path in user units, used for scaling dashes.
  final double? pathLength;

  /// The opacity of the stroke (0.0 to 1.0).
  @override
  final double opacity;

  /// The shape to be used at the end of open subpaths.
  final PaintingStrokeCap cap;

  /// The shape to be used at the corners of paths or basic shapes.
  final PaintingStrokeJoin join;

  /// The limit on the ratio of the miter length to the stroke-width.
  final double miterLimit;

  /// The pattern of dashes and gaps used to stroke paths.
  final List<double>? dashArray;

  /// Whether this stroke was explicitly defined on the element (not just inherited).
  @override
  final bool isExplicit;

  /// Whether this stroke uses the 'currentColor' keyword.
  @override
  final bool isCurrentColor;

  @override
  String toString() =>
      'PaintingStrokeStyle(color: $colorArgb, shader: $shaderId, units: $shaderUnits, width: $width, opacity: $opacity, cap: $cap, join: $join, miterLimit: $miterLimit, explicit: $isExplicit, currentColor: $isCurrentColor)';
}
