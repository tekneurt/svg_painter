import '../../painting_model/_painting_model.dart';
import '../command_generator.dart';
import '../generator_buffer.dart';
import '../models.dart';
import '../palette_analyzer.dart';

/// Generator for [DrawGroup] but specifically from a `<use>` element.
/// Actually, our painting model transforms `<use>` into a `DrawGroup` with its own style.
/// We need to handle `DrawGroup` generally.
class UseGenerator extends CommandGenerator<DrawGroup> {
  const UseGenerator();

  @override
  void generate(
    DrawGroup command,
    GeneratorBuffer buffer, {
    Map<Type, CommandGenerator<PaintCommand>>? generators,
    PaletteResult? palette,
    Map<String, String>? activeFillProperties,
    Map<String, String>? activeStrokeProperties,
    List<InheritedProperty>? inheritedFills,
    List<InheritedProperty>? inheritedStrokes,
    String? painterClassName,
    Set<String>? gradientsNeedingStretch,
  }) {
    if (generators == null) {
      return;
    }

    // Use a placeholder for group bounds for now (viewport-sized)
    wrapWithStyle(buffer, command.style, 'Offset.zero & viewBox', () {
      for (final PaintCommand child in command.commands) {
        generators[child.runtimeType]?.generate(
          child,
          buffer,
          generators: generators,
          palette: palette,
          activeFillProperties: activeFillProperties,
          activeStrokeProperties: activeStrokeProperties,
          inheritedFills: inheritedFills,
          inheritedStrokes: inheritedStrokes,
          painterClassName: painterClassName,
          gradientsNeedingStretch: gradientsNeedingStretch,
        );
      }
    });
  }
}
