part of '../paint_command.dart';

/// Command to render text along the contour of a path.
@immutable
final class DrawTextPath extends DrawCommand {
  const DrawTextPath({
    required this.pathOperations,
    required this.text,
    required this.style,
    this.startOffset = 0.0,
    super.id,
  });

  /// The operations that define the path to follow.
  final List<PathOperation> pathOperations;

  /// The text to draw along the path.
  final String text;

  /// The offset from the start of the path where text begins.
  final double startOffset;

  /// The visual style (font, fill, stroke, groupOpacity, etc.) for the text.
  @override
  final PaintingStyle style;

  @override
  String toString() {
    final parts = <String>[
      'pathOperations: ${pathOperations.length}',
      "text: '$text'",
      'startOffset: $startOffset',
      'style: $style',
      if (id != null) 'id: $id',
    ];
    return 'DrawTextPath(${parts.join(', ')})';
  }
}
