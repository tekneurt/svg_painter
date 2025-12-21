part of '../paint_command.dart';

/// A command to draw a circle.
@immutable
final class DrawCircle extends PaintCommand {
  const DrawCircle({
    required this.cx,
    required this.cy,
    required this.radius,
    this.fillColorArgb,
    this.strokeColorArgb,
    this.strokeWidth = 0.0,
  });

  /// The x-coordinate of the center.
  final double cx;

  /// The y-coordinate of the center.
  final double cy;

  /// The radius of the circle.
  final double radius;

  /// The fill color in ARGB format.
  final int? fillColorArgb;

  /// The stroke color in ARGB format.
  final int? strokeColorArgb;

  /// The width of the stroke.
  final double strokeWidth;

  @override
  String toString() =>
      'DrawCircle(cx: $cx, cy: $cy, radius: $radius, fill: $fillColorArgb, stroke: $strokeColorArgb, strokeWidth: $strokeWidth)';
}
