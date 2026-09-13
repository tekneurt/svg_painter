part of '../paint_command.dart';

/// A command to draw a closed polygon.
@immutable
final class DrawPolygon extends DrawCommand {
  const DrawPolygon({required this.points, required this.style, super.id});

  final List<double> points;

  /// The visual style of the polygon.
  @override
  final PaintingStyle style;

  @override
  String toString() {
    final parts = <String>[
      'points: ${points.length}',
      'style: $style',
      if (id != null) 'id: $id',
    ];
    return 'DrawPolygon(${parts.join(', ')})';
  }
}
