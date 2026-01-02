part of '../paint_command.dart';

/// Command to draw a group of commands, potentially with a transform.
@immutable
final class DrawGroup extends PaintCommand {
  const DrawGroup({required this.commands, this.transform, this.groupOpacity = 1.0});

  /// The list of commands in this group.
  final List<PaintCommand> commands;

  /// The transformation string to apply to the group.
  final String? transform;

  /// The opacity to apply to the group as a whole (layering).
  final double groupOpacity;
}
