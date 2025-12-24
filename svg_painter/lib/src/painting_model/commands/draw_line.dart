part of '../paint_command.dart';

/// A command to draw a line segment.
@immutable
final class DrawLine extends PaintCommand {
  const DrawLine({
    required this.x1,
    required this.y1,
    required this.x2,
    required this.y2,
    required this.style,
    this.transform,
  });

  final double x1;
  final double y1;
  final double x2;
  final double y2;

  /// The visual style of the line.
  final PaintingStyle style;

  final String? transform;

  @override
  String toString() =>
      'DrawLine(x1: $x1, y1: $y1, x2: $x2, y2: $y2, style: $style, transform: $transform)';
}
