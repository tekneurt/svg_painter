part of '../paint_command.dart';

/// A command to draw a circle.
@immutable
final class DrawCircle extends DrawCommand {
  const DrawCircle({
    required this.cx,
    required this.cy,
    required this.radius,
    required this.style,
    super.id,
  });

  /// The x-coordinate of the center.
  final double cx;

  /// The y-coordinate of the center.
  final double cy;

  /// The radius of the circle.
  final double radius;

  /// The visual style of the circle.
  @override
  final PaintingStyle style;

  @override
  String toString() => 'DrawCircle(cx: $cx, cy: $cy, radius: $radius, style: $style, id: $id)';
}
