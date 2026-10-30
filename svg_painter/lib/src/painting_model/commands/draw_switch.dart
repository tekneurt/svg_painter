part of '../paint_command.dart';

/// Represents a single conditional case in a [DrawSwitch] command.
@immutable
final class SwitchCase {
  const SwitchCase({
    required this.languages,
    required this.commands,
  });

  /// The list of BCP 47 language tags that this case matches.
  final List<String> languages;

  /// The commands to execute if this case matches.
  final List<PaintCommand> commands;

  @override
  String toString() => 'SwitchCase(languages: $languages, cmds: ${commands.length})';
}

/// Command to conditionally draw one branch among multiple cases based on system language.
@immutable
final class DrawSwitch extends DrawCommand {
  const DrawSwitch({
    required this.cases,
    this.fallback = const <PaintCommand>[],
    this.style = const PaintingStyle(),
    super.id,
  });

  /// The conditional cases to evaluate in document order.
  final List<SwitchCase> cases;

  /// The fallback commands to execute if no cases match.
  final List<PaintCommand> fallback;

  @override
  final PaintingStyle style;

  /// All commands contained within cases and the fallback.
  Iterable<PaintCommand> get allCommands sync* {
    for (final SwitchCase c in cases) {
      yield* c.commands;
    }
    yield* fallback;
  }

  @override
  String toString() {
    return 'DrawSwitch(cases: ${cases.length}, fallback: ${fallback.length}, id: $id)';
  }
}
