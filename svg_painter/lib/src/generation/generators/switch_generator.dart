import 'package:svg_painter_annotation/svg_painter_annotation.dart';

import '../../painting_model/_painting_model.dart';
import '../command_generator.dart';
import '../generator_buffer.dart';
import '../models.dart';
import '../palette_analyzer.dart';
import '../shape_generator.dart';

/// Generator for [DrawSwitch] commands.
class SwitchGenerator extends ShapeGenerator<DrawSwitch> {
  const SwitchGenerator();

  @override
  void generate(
    DrawSwitch command,
    GeneratorBuffer buffer, {
    Map<Type, CommandGenerator<PaintCommand>>? generators,
    PaletteResult? palette,
    Map<String, String>? activeFillProperties,
    Map<String, String>? activeStrokeProperties,
    List<InheritedProperty>? inheritedFills,
    List<InheritedProperty>? inheritedStrokes,
    String? painterClassName,
    Set<String>? gradientsNeedingStretch,
    SvgColorMapping colorMapping = SvgColorMapping.material,
    bool isInsideMarker = false,
  }) {
    if (generators == null) {
      return;
    }

    void emitCommands(List<PaintCommand> cmds) {
      for (final child in cmds) {
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
          colorMapping: colorMapping,
          isInsideMarker: isInsideMarker,
        );
      }
    }

    wrapWithStyle(buffer, command.style, 'Offset.zero & viewBox', () {
      if (command.cases.isEmpty) {
        emitCommands(command.fallback);
      } else {
        buffer.writeln(
          'final String currentLocale = ui.PlatformDispatcher.instance.locale.toLanguageTag().toLowerCase();',
        );

        for (var i = 0; i < command.cases.length; i++) {
          final SwitchCase switchCase = command.cases[i];
          final conditions = <String>[];
          for (final String lang in switchCase.languages) {
            conditions.add("currentLocale == '$lang'");
            conditions.add("currentLocale.startsWith('$lang-')");
            conditions.add("'$lang'.startsWith('\$currentLocale-')");
          }
          final String conditionExpr = conditions.join(' || ');
          final keyword = i == 0 ? 'if' : 'else if';
          buffer.writeBlock('$keyword ($conditionExpr) {', () {
            emitCommands(switchCase.commands);
          });
        }

        if (command.fallback.isNotEmpty) {
          buffer.writeBlock('else {', () {
            emitCommands(command.fallback);
          });
        }
      }
    });
  }
}
