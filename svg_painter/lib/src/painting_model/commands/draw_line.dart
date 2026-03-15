part of '../paint_command.dart';

/// A command to draw a line segment.
@immutable
final class DrawLine extends DrawCommand {
  const DrawLine({
    required this.x1,
    required this.y1,
    required this.x2,
    required this.y2,
    required this.style,
    super.id,
  });

  final double x1;
  final double y1;
  final double x2;
  final double y2;

  /// The visual style of the line.
  @override
  final PaintingStyle style;

  @override
  String toString() => 'DrawLine(x1: $x1, y1: $y1, x2: $x2, y2: $y2, style: $style, id: $id)';
}
