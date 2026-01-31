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
    this.transform,
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

  /// The transformation string.
  final String? transform;

  @override
  String toString() =>
      'DrawCircle(cx: $cx, cy: $cy, radius: $radius, style: $style, transform: $transform)';
}
