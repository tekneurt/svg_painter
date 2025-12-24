part of '../paint_command.dart';

/// A command to draw an oval (ellipse).
@immutable
final class DrawOval extends PaintCommand {
  const DrawOval({
    required this.cx,
    required this.cy,
    required this.rx,
    required this.ry,
    this.fillColorArgb,
    this.strokeColorArgb,
    this.strokeWidth = 0.0,
    this.fillShaderId,
    this.strokeShaderId,
    this.transform,
  });

  /// The x-coordinate of the center.
  final double cx;

  /// The y-coordinate of the center.
  final double cy;

  /// The x-axis radius.
  final double rx;

  /// The y-axis radius.
  final double ry;

  /// The fill color in ARGB format.
  final int? fillColorArgb;

  /// The stroke color in ARGB format.
  final int? strokeColorArgb;

  /// The width of the stroke.
  final double strokeWidth;

  /// The ID of the fill shader.
  final String? fillShaderId;

  /// The ID of the stroke shader.
  final String? strokeShaderId;

  /// The transformation string.
  final String? transform;

  @override
  String toString() =>
      'DrawOval(cx: $cx, cy: $cy, rx: $rx, ry: $ry, fill: $fillColorArgb, stroke: $strokeColorArgb, width: $strokeWidth, fillShader: $fillShaderId, strokeShader: $strokeShaderId, transform: $transform)';
}
