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
final class PaintingStrokeStyle {
  const PaintingStrokeStyle({
    this.colorArgb,
    this.shaderId,
    this.width = 1.0,
    this.pathLength,
    this.opacity = 1.0,
    this.cap = PaintingStrokeCap.butt,
    this.join = PaintingStrokeJoin.miter,
    this.dashArray,
    this.isExplicit = true,
    this.isCurrentColor = false,
  });

  /// The ARGB integer for the stroke color.
  final int? colorArgb;

  /// The ID of the shader (e.g., gradient) to use for stroking.
  final String? shaderId;

  /// The width of the stroke.
  final double width;

  /// The total length of the path in user units, used for scaling dashes.
  final double? pathLength;

  /// The opacity of the stroke (0.0 to 1.0).
  final double opacity;

  /// The shape to be used at the end of open subpaths.
  final PaintingStrokeCap cap;

  /// The shape to be used at the corners of paths or basic shapes.
  final PaintingStrokeJoin join;

  /// The pattern of dashes and gaps used to stroke paths.
  final List<double>? dashArray;

  /// Whether this stroke was explicitly defined on the element (not just inherited).
  final bool isExplicit;

  /// Whether this stroke uses the 'currentColor' keyword.
  final bool isCurrentColor;

  @override
  String toString() =>
      'PaintingStrokeStyle(color: $colorArgb, shader: $shaderId, width: $width, opacity: $opacity, cap: $cap, join: $join, explicit: $isExplicit, currentColor: $isCurrentColor)';
}
