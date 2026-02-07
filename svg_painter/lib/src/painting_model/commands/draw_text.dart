part of '../paint_command.dart';

/// Command to draw text at a specific location.
@immutable
final class DrawText extends DrawCommand {
  const DrawText({
    required this.text,
    required this.x,
    required this.y,
    required this.style,
    super.id,
  });

  /// The x-axis coordinate of the starting point of the text.
  final double x;

  /// The y-axis coordinate of the starting point of the text.
  final double y;

  /// The text content to draw.
  final String text;

  /// The visual style (font, fill, etc.) for the text.
  @override
  final PaintingStyle style;

  @override
  String toString() => 'DrawText(x: $x, y: $y, text: $text, style: $style, id: $id)';
}
