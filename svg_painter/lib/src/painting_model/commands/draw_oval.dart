part of '../paint_command.dart';

/// A command to draw an oval (ellipse).
@immutable
final class DrawOval extends DrawCommand {
  const DrawOval({
    required this.cx,
    required this.cy,
    required this.rx,
    required this.ry,
    required this.style,
    super.id,
  });

  /// The x-coordinate of the center.
  final double cx;

  /// The y-coordinate of the center.
  final double cy;

  /// The x-axis radius.
  final double rx;

  /// The y-axis radius.
  final double ry;

  /// The visual style of the oval.
  @override
  final PaintingStyle style;

  @override
  String toString() => 'DrawOval(cx: $cx, cy: $cy, rx: $rx, ry: $ry, style: $style, id: $id)';
}
