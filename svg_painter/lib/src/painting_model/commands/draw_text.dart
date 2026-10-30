part of '../paint_command.dart';

/// Command to draw text at a specific location.
@immutable
final class DrawText extends DrawCommand {
  const DrawText({
    required this.rootSpan,
    required this.x,
    required this.y,
    required this.style,
    this.chunks,
    super.id,
  });

  /// The x-axis coordinate of the starting point of the text.
  final double x;

  /// The y-axis coordinate of the starting point of the text.
  final double y;

  /// The structured text hierarchy to draw.
  final PaintingTextSpan rootSpan;

  /// The visual style (font, fill, etc.) for the text.
  @override
  final PaintingStyle style;

  /// Individual positioned chunks of text when multi-coordinate lists are used.
  final List<PaintingTextChunk>? chunks;

  @override
  String toString() {
    final parts = <String>[
      'x: $x',
      'y: $y',
      'span: $rootSpan',
      'style: $style',
      if (chunks != null) 'chunks: ${chunks!.length}',
      if (id != null) 'id: $id',
    ];
    return 'DrawText(${parts.join(', ')})';
  }
}
