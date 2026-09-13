part of '../paint_command.dart';

/// A command to define a clipping path.
@immutable
final class DefineClipPath extends DefineCommand {
  const DefineClipPath({
    required super.id,
    required this.commands,
    this.clipPathUnits = PaintingGradientUnits.userSpaceOnUse,
  });

  /// The commands that make up the clip path geometry.
  final List<PaintCommand> commands;

  /// The coordinate system for the contents of the clip path.
  final PaintingGradientUnits clipPathUnits;

  @override
  String toString() => 'DefineClipPath(id: $id, commands: ${commands.length})';
}
