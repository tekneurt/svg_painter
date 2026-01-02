import '../painting_model/_painting_model.dart';
import 'command_generator.dart';

/// Generator for [DrawGroup] commands.
class GroupGenerator extends ShapeGenerator<DrawGroup> {
  const GroupGenerator();

  @override
  void generate(
    DrawGroup command,
    StringBuffer buffer, {
    Map<Type, CommandGenerator<PaintCommand>>? generators,
  }) {
    if (generators == null) {
      // This should ideally not happen if properly wired.
      return;
    }

    wrapWithTransform(buffer, command.transform, () {
      if (command.groupOpacity < 1.0) {
        buffer.writeln('      canvas.saveLayer(');
        buffer.writeln('        null,');
        buffer.writeln(
          '        Paint()..color = Color.fromRGBO(255, 255, 255, ${command.groupOpacity}),',
        );
        buffer.writeln('      );');
      }

      for (final PaintCommand child in command.commands) {
        // Find generator for child type
        final CommandGenerator<PaintCommand>? generator = generators[child.runtimeType];
        if (generator != null) {
          generator.generate(child, buffer, generators: generators);
        } else {
          // Fallback or ignore?
        }
      }

      if (command.groupOpacity < 1.0) {
        buffer.writeln('      canvas.restore();');
      }
    });
  }
}
