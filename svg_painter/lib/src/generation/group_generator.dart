import '../painting_model/_painting_model.dart';
import 'command_generator.dart';

import 'palette_analyzer.dart';

/// Generator for [DrawGroup] commands.
class GroupGenerator extends ShapeGenerator<DrawGroup> {
  const GroupGenerator();

  @override
  void generate(
    DrawGroup command,
    StringBuffer buffer, {
    Map<Type, CommandGenerator<PaintCommand>>? generators,
    PaletteResult? palette,
    Map<String, String>? activeFillProperties,
    Map<String, String>? activeStrokeProperties,
  }) {
    if (generators == null) {
      // This should ideally not happen if properly wired.
      return;
    }

    wrapWithTransform(buffer, command.transform, () {
      if (command.opacity == 1.0) {
        // Full opacity, no layer needed
      } else {
        buffer.writeln('      canvas.saveLayer(');
        buffer.writeln('        null,');
        buffer.writeln(
          '        Paint()..color = Color.fromRGBO(255, 255, 255, ${command.opacity}),',
        );
        buffer.writeln('      );');
      }

      for (final PaintCommand child in command.commands) {
        // Find generator for child type
        final CommandGenerator<PaintCommand>? generator = generators[child.runtimeType];
        if (generator == null) {
          throw StateError('No generator found for command type ${child.runtimeType}');
        } else {
          generator.generate(
            child,
            buffer,
            generators: generators,
            palette: palette,
            activeFillProperties: activeFillProperties,
            activeStrokeProperties: activeStrokeProperties,
          );
        }
      }

      if (command.opacity == 1.0) {
        // No restore needed
      } else {
        buffer.writeln('      canvas.restore();');
      }
    });
  }
}
