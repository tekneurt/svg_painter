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
    super.units,
    super.spreadMethod,
  });

  /// The x-axis start coordinate.
  final double x1;

  /// The y-axis start coordinate.
  final double y1;

  /// The x-axis end coordinate.
  final double x2;

  /// The y-axis end coordinate.
  final double y2;

  @override
  String toString() => 'DefineLinearGradient(id: $id, stops: ${stops.length}, units: $units)';
}
