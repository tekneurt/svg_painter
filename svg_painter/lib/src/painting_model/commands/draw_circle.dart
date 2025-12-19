part of '../paint_command.dart';

/// A command to draw a circle.
@immutable
final class DrawCircle extends PaintCommand {
  const DrawCircle({
    required this.cx,
    required this.cy,
    required this.radius,
    required this.colorHex,
  });

  /// The x-coordinate of the center.
  final double cx;

  /// The y-coordinate of the center.
  final double cy;

  /// The radius of the circle.
  final double radius;

  /// The fill color in hex format (e.g. 0xFF000000).
  final int colorHex;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DrawCircle &&
          runtimeType == other.runtimeType &&
          cx == other.cx &&
          cy == other.cy &&
          radius == other.radius &&
          colorHex == other.colorHex);

  @override
  int get hashCode => Object.hash(cx, cy, radius, colorHex);

  @override
  String toString() =>
      'DrawCircle(cx: $cx, cy: $cy, radius: $radius, color: $colorHex)';
}
