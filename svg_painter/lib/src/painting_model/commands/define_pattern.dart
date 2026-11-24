part of '../paint_command.dart';

/// A command to define a reusable pattern.
@immutable
final class DefinePattern extends DefineCommand {
  const DefinePattern({
    required super.id,
    required this.commands,
    this.x,
    this.y,
    this.width,
    this.height,
    this.patternUnits = SvgPatternUnits.objectBoundingBox,
    this.patternContentUnits = SvgPatternUnits.userSpaceOnUse,
    this.viewBox,
    this.preserveAspectRatio,
    this.patternTransform,
  });

  /// The commands that make up the pattern content.
  final List<PaintCommand> commands;

  /// The x-axis coordinate of the pattern tile start.
  final SvgLengthPercentage? x;

  /// The y-axis coordinate of the pattern tile start.
  final SvgLengthPercentage? y;

  /// The pattern tile width.
  final SvgLengthPercentageAuto? width;

  /// The pattern tile height.
  final SvgLengthPercentageAuto? height;

  /// The coordinate system for x, y, width and height.
  final SvgPatternUnits patternUnits;

  /// The coordinate system for the pattern content.
  final SvgPatternUnits patternContentUnits;

  /// The viewBox defining the coordinate system for the pattern's children.
  final SvgViewBox? viewBox;

  /// The preserveAspectRatio defining how the viewBox maps to the tile viewport.
  final SvgPreserveAspectRatio? preserveAspectRatio;

  /// The pattern transform attributes, if any.
  final SvgTransformAttributes? patternTransform;

  @override
  String toString() => 'DefinePattern(id: $id, commands: ${commands.length})';
}
