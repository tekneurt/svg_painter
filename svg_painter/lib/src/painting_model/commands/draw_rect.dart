part of '../paint_command.dart';

/// A command to draw a rectangle (optionally rounded).
@immutable
final class DrawRect extends PaintCommand {
  const DrawRect({
    required this.x,
    required this.y,
    required this.width,
    required this.height,
    required this.rx,
    required this.ry,
    required this.style,
    this.transform,
  });

  final double x;
  final double y;
  final double width;
  final double height;

  /// Rounded corner x-radius.
  final double rx;

  /// Rounded corner y-radius.
  final double ry;

  /// The visual style of the rectangle.
  final PaintingStyle style;

  final String? transform;

  @override
  String toString() =>
      'DrawRect(x: $x, y: $y, w: $width, h: $height, rx: $rx, ry: $ry, style: $style, transform: $transform)';
}
