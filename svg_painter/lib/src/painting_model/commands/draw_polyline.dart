part of '../paint_command.dart';

/// A command to draw a polyline (connected line segments).
@immutable
final class DrawPolyline extends PaintCommand {
  const DrawPolyline({
    required this.points,
    this.fillColorArgb,
    this.strokeColorArgb,
    this.strokeWidth = 1.0,
    this.fillShaderId,
    this.strokeShaderId,
    this.transform,
  });

  final List<double> points;

  final int? fillColorArgb;
  final int? strokeColorArgb;
  final double strokeWidth;
  final String? fillShaderId;
  final String? strokeShaderId;
  final String? transform;

  @override
  String toString() =>
      'DrawPolyline(points: ${points.length}, fill: $fillColorArgb, stroke: $strokeColorArgb, width: $strokeWidth, fillShader: $fillShaderId, strokeShader: $strokeShaderId, transform: $transform)';
}
