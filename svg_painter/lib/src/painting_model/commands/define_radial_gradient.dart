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
    super.transformAttributes,
    super.units,
    super.spreadMethod,
  });

  /// The x-axis coordinate of the center.
  final double cx;

  /// The y-axis coordinate of the center.
  final double cy;

  /// The radius.
  final double radius;

  /// The x-axis coordinate of the focal point.
  final double fx;

  /// The y-axis coordinate of the focal point.
  final double fy;

  /// The focal radius.
  final double focalRadius;

  @override
  String toString() => 'DefineRadialGradient(id: $id, stops: ${stops.length}, units: $units)';
}
