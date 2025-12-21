part of '../paint_command.dart';

/// A command to define a radial gradient stop.
@immutable
final class GradientStop {
  const GradientStop(this.offset, this.colorArgb);

  final double offset;
  final int colorArgb;
}

/// A command to define a radial gradient that can be referenced by ID.
@immutable
final class DefineRadialGradient extends PaintCommand {
  const DefineRadialGradient({
    required this.id,
    required this.cx,
    required this.cy,
    required this.radius,
    required this.fx,
    required this.fy,
    required this.stops,
    this.transform,
  });

  final String id;
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
  final List<GradientStop> stops;
  final String? transform;

  @override
  String toString() => 'DefineRadialGradient(id: $id, stops: ${stops.length})';
}
