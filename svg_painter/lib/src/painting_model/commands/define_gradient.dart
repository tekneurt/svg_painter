part of '../paint_command.dart';

/// A command to define a gradient stop.
@immutable
final class GradientStop {
  const GradientStop(this.offset, this.colorArgb);

  final double offset;
  final int colorArgb;

  @override
  String toString() => 'GradientStop(offset: $offset, color: $colorArgb)';
}

/// Base class for commands that define a gradient.
@immutable
sealed class DefineGradient extends PaintCommand {
  const DefineGradient({required this.id, required this.stops, this.transform});

  /// The unique identifier for the gradient.
  final String id;

  /// The list of color stops for the gradient.
  final List<GradientStop> stops;

  /// The transform applied to the gradient (e.g., 'rotate(90)').
  final String? transform;
}
