part of '../paint_command.dart';

/// Command to draw text at a specific location.
@immutable
final class DrawText extends PaintCommand {
  const DrawText({
    required this.x,
    required this.y,
    required this.text,
    required this.style,
    this.transform,
  });

  /// The x-axis coordinate of the starting point of the text.
  final double x;

  /// The y-axis coordinate of the starting point of the text.
  final double y;

  /// The text content to draw.
  final String text;

  /// The visual style (font, fill, etc.) for the text.
  final PaintingStyle style;

  /// The transform to apply.
  final String? transform;
}
