part of '../paint_command.dart';

/// A command to define a linear gradient that can be referenced by ID.
@immutable
final class DefineLinearGradient extends PaintCommand {
  const DefineLinearGradient({
    required this.id,
    required this.x1,
    required this.y1,
    required this.x2,
    required this.y2,
    required this.stops,
    this.transform,
  });

  final String id;

  /// Normalized x-axis start coordinate (0.0 - 1.0).
  final double x1;

  /// Normalized y-axis start coordinate (0.0 - 1.0).
  final double y1;

  /// Normalized x-axis end coordinate (0.0 - 1.0).
  final double x2;

  /// Normalized y-axis end coordinate (0.0 - 1.0).
  final double y2;
  final List<GradientStop> stops;
  final String? transform;

  @override
  String toString() => 'DefineLinearGradient(id: $id, stops: ${stops.length})';
}
