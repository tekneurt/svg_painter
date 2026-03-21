part of '../paint_command.dart';

/// A command to define a gradient stop.
@immutable
final class GradientStop {
  const GradientStop({required this.offset, required this.colorArgb, this.opacity = 1.0});

  /// The location of the stop (0.0 to 1.0).
  final double offset;

  /// The color of the stop.
  final int colorArgb;

  /// The opacity of the stop (0.0 to 1.0).
  final double opacity;

  @override
  String toString() => 'GradientStop(offset: $offset, color: $colorArgb, opacity: $opacity)';
}

/// Base class for commands that define a gradient.
@immutable
sealed class DefineGradient extends DefineCommand {
  const DefineGradient({
    required String id,
    required this.stops,
    this.transformAttributes,
    this.units = PaintingGradientUnits.objectBoundingBox,
    this.spreadMethod = PaintingSpreadMethod.pad,
  }) : super(id: id);

  /// The list of color stops for the gradient.
  final List<GradientStop> stops;

  /// The transform applied to the gradient.
  final SvgTransformAttributes? transformAttributes;

  /// The coordinate system used for the gradient coordinates.
  final PaintingGradientUnits units;

  /// The method used to fill the area outside the gradient vector.
  final PaintingSpreadMethod spreadMethod;
}
