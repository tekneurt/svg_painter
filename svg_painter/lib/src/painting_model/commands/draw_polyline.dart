part of '../paint_command.dart';

/// A command to draw a polyline (connected line segments).
@immutable
final class DrawPolyline extends PaintCommand {
  const DrawPolyline({    required this.points,    required this.style,    super.id,    this.transform,  });

  final List<double> points;

  /// The visual style of the polyline.
  final PaintingStyle style;

  final String? transform;

  @override
  String toString() =>
      'DrawPolyline(points: ${points.length}, style: $style, transform: $transform)';
}
