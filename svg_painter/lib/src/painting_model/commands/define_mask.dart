part of '../paint_command.dart';

/// A command to define a mask.
@immutable
final class DefineMask extends DefineCommand {
  const DefineMask({
    required super.id,
    required this.commands,
    this.x = const SvgPercentage(0),
    this.y = const SvgPercentage(0),
    this.width = const SvgPercentage(100),
    this.height = const SvgPercentage(100),
    this.maskUnits = PaintingGradientUnits.objectBoundingBox,
    this.maskContentUnits = PaintingGradientUnits.userSpaceOnUse,
  });

  /// The commands that make up the mask content.
  final List<PaintCommand> commands;

  /// The x-axis coordinate of the mask.
  final SvgLengthPercentage x;

  /// The y-axis coordinate of the mask.
  final SvgLengthPercentage y;

  /// The width of the mask.
  final SvgLengthPercentageAuto width;

  /// The height of the mask.
  final SvgLengthPercentageAuto height;

  /// The coordinate system for the mask's geometry.
  final PaintingGradientUnits maskUnits;

  /// The coordinate system for the contents of the mask.
  final PaintingGradientUnits maskContentUnits;

  @override
  String toString() => 'DefineMask(id: $id, commands: ${commands.length})';
}
