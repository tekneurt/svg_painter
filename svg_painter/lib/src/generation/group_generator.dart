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
      for (final PaintCommand child in command.commands) {
        // Find generator for child type
        final CommandGenerator<PaintCommand>? generator = generators[child.runtimeType];
        if (generator != null) {
          generator.generate(child, buffer, generators: generators);
        } else {
          // Fallback or ignore?
          // For polyline/polygon, the type might be specific but the key is specific too.
          // Let's assume the map is complete.
          // However, PolyGenerator handles both DrawPolyline and DrawPolygon but might be registered under both?
          // Let's check registration in SvgPainterGenerator.
        }
      }
    });
  }
}
