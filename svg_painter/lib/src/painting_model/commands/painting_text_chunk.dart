part of '../paint_command.dart';

/// Represents a single positioned chunk or glyph of text within a [DrawText] command.
@immutable
final class PaintingTextChunk {
  const PaintingTextChunk({
    required this.text,
    this.x,
    this.y,
    this.dx,
    this.dy,
    this.style,
  });

  /// The text content of this chunk.
  final String text;

  /// The explicit x-coordinate for this chunk, or null if advancing horizontally.
  final double? x;

  /// The explicit y-coordinate for this chunk, or null if inheriting current y.
  final double? y;

  /// The relative x-axis shift for this chunk, or null if none.
  final double? dx;

  /// The relative y-axis shift for this chunk, or null if none.
  final double? dy;

  /// Optional style override for this chunk.
  final PaintingStyle? style;

  @override
  String toString() =>
      'PaintingTextChunk(text: "$text", x: $x, y: $y, dx: $dx, dy: $dy, style: $style)';
}
