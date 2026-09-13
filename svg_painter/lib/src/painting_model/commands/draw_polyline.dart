part of '../paint_command.dart';

/// A command to draw a polyline (connected line segments).
@immutable
final class DrawPolyline extends DrawCommand {
  const DrawPolyline({required this.points, required this.style, super.id});

  /// The points that make up the polyline.
  final List<double> points;

  /// The visual style of the polyline.
  @override
  final PaintingStyle style;

  @override
  String toString() {
    final parts = <String>[
      'points: ${points.length}',
      'style: $style',
      if (id != null) 'id: $id',
    ];
    return 'DrawPolyline(${parts.join(', ')})';
  }
}
