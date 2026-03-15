part of '../paint_command.dart';

/// A command to define a linear gradient that can be referenced by ID.
@immutable
final class DefineLinearGradient extends DefineGradient {
  const DefineLinearGradient({
    required super.id,
    required this.x1,
    required this.y1,
    required this.x2,
    required this.y2,
    required super.stops,
    super.transformAttributes,
  });

  /// Normalized x-axis start coordinate (0.0 - 1.0).
  final double x1;

  /// Normalized y-axis start coordinate (0.0 - 1.0).
  final double y1;

  /// Normalized x-axis end coordinate (0.0 - 1.0).
  final double x2;

  /// Normalized y-axis end coordinate (0.0 - 1.0).
  final double y2;

  @override
  String toString() => 'DefineLinearGradient(id: $id, stops: ${stops.length})';
}
