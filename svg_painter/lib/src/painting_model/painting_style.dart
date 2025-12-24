import 'package:meta/meta.dart';

/// Represents the visual style (fill and stroke) for a drawing command.
@immutable
final class PaintingStyle {
  const PaintingStyle({
    this.fillColorArgb,
    this.fillShaderId,
    this.strokeColorArgb,
    this.strokeShaderId,
    this.strokeWidth = 1.0,
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

  @override
  String toString() {
    return 'PaintingStyle(fill: $fillColorArgb/$fillShaderId, stroke: $strokeColorArgb/$strokeShaderId, width: $strokeWidth)';
  }
}
