part of '../paint_command.dart';

/// A command to draw a line segment.
@immutable
final class DrawLine extends PaintCommand {
  const DrawLine({
    required this.x1,
    required this.y1,
    required this.x2,
    required this.y2,
    this.strokeColorArgb,
    this.strokeWidth = 1.0,
    this.strokeShaderId,
    this.transform,
  });

  final double x1;
  final double y1;
  final double x2;
  final double y2;

  final int? strokeColorArgb;
  final double strokeWidth;
  final String? strokeShaderId;
  final String? transform;

  @override
  String toString() =>
      'DrawLine(x1: $x1, y1: $y1, x2: $x2, y2: $y2, stroke: $strokeColorArgb, width: $strokeWidth, shader: $strokeShaderId, transform: $transform)';
}
