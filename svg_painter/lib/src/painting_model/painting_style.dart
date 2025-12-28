import 'package:meta/meta.dart';
import 'stroke_cap.dart';
import 'stroke_join.dart';

/// Represents the visual style (fill and stroke) for a drawing command.
@immutable
final class PaintingStyle {
  const PaintingStyle({
    this.fillColorArgb,
    this.fillShaderId,
    this.strokeColorArgb,
    this.strokeShaderId,
    this.strokeWidth = 1.0,
    this.strokeCap = StrokeCap.butt,
    this.strokeJoin = StrokeJoin.miter,
    this.opacity = 1.0,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.fontFamily,
  });

  /// The ARGB integer for the fill color.
  final int? fillColorArgb;

  /// The ID of the shader (e.g., gradient) to use for filling.
  final String? fillShaderId;

  /// The ARGB integer for the stroke color.
  final int? strokeColorArgb;

  /// The ID of the shader (e.g., gradient) to use for stroking.
  final String? strokeShaderId;

  /// The width of the stroke.
  final double strokeWidth;

  /// The shape to be used at the end of open subpaths.
  final StrokeCap strokeCap;

  /// The shape to be used at the corners of paths or basic shapes.
  final StrokeJoin strokeJoin;

  /// The transparency of the element (0.0 to 1.0).
  final double opacity;

  /// The size of the font.
  final double? fontSize;

  /// The weight of the font (e.g., 'bold').
  final String? fontWeight;

  /// The style of the font (e.g., 'italic').
  final String? fontStyle;

  /// The family of the font.
  final String? fontFamily;

  @override
  String toString() {
    return 'PaintingStyle(fill: $fillColorArgb/$fillShaderId, stroke: $strokeColorArgb/$strokeShaderId, width: $strokeWidth, cap: $strokeCap, join: $strokeJoin, opacity: $opacity, font: $fontStyle $fontWeight $fontSize $fontFamily)';
  }
}
