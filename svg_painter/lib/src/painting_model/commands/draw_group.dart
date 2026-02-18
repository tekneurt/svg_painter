part of '../paint_command.dart';

/// Command to draw a group of commands, potentially with a transform.
@immutable
final class DrawGroup extends DrawCommand {
  const DrawGroup({
    required this.commands,
    this.style = const PaintingStyle(),
    super.id,
    this.opacity = 1.0,
  }) : assert(opacity >= 0.0 && opacity <= 1.0, 'Opacity must be between 0.0 and 1.0');

  /// The list of commands in this group.
  final List<PaintCommand> commands;

  /// The visual style of the group (used for inheritance/overrides).
  @override
  final PaintingStyle style;

  /// The opacity to apply to the group as a whole (layering).
  final double opacity;

  @override
  String toString() => 'DrawGroup(cmds: ${commands.length}, style: $style, opacity: $opacity)';
}
