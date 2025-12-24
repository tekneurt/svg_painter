part of '../paint_command.dart';

/// A command to define a radial gradient that can be referenced by ID.
@immutable
final class DefineRadialGradient extends DefineGradient {
  const DefineRadialGradient({
    required super.id,
    required this.cx,
    required this.cy,
    required this.radius,
    required this.fx,
    required this.fy,
    required this.focalRadius,
    required super.stops,
    super.transform,
  });

  /// Normalized x-coordinate (0.0 - 1.0).
  final double cx;

  /// Normalized y-coordinate (0.0 - 1.0).
  final double cy;

  /// Normalized radius (0.0 - 1.0).
  final double radius;

  /// Normalized focal x-coordinate (0.0 - 1.0).
  final double fx;

  /// Normalized focal y-coordinate (0.0 - 1.0).
  final double fy;

  /// Normalized focal radius (0.0 - 1.0).
  final double focalRadius;

  @override
  String toString() => 'DefineRadialGradient(id: $id, stops: ${stops.length})';
}
