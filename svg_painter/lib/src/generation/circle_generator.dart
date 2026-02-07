import '../painting_model/_painting_model.dart';
import 'command_generator.dart';

import 'palette_analyzer.dart';

class CircleGenerator extends ShapeGenerator<DrawCircle> {
  const CircleGenerator();

  @override
  void generate(
    DrawCircle command,
    StringBuffer buffer, {
    Map<Type, CommandGenerator<PaintCommand>>? generators,
    PaletteResult? palette,
    Map<String, String>? activeFillProperties,
    Map<String, String>? activeStrokeProperties,
    List<InheritedProperty>? inheritedFills,
    List<InheritedProperty>? inheritedStrokes,
  }) {
    wrapWithTransform(buffer, command.style.transformAttributes, () {
      final String bounds =
          'Rect.fromCircle(center: const Offset(${command.cx}, ${command.cy}), radius: ${command.radius})';
      generatePaintingCode(
        buffer,
        command,
        command.style,
        bounds,
        (String p, {String? dashArray, String? pathLength}) {
          if (dashArray == null) {
            buffer.writeln(
              '      canvas.drawCircle(const Offset(${command.cx}, ${command.cy}), ${command.radius}, $p);',
            );
          } else {
            final String plArg;
            if (pathLength?.isEmpty ?? true) {
              plArg = '';
            } else {
              plArg = ', pathLength: $pathLength';
            }
            buffer.writeln('      {');
            buffer.writeln('        final Path path = Path()..addOval($bounds);');
            buffer.writeln('        canvas.drawPath(_dashPath(path, $dashArray$plArg), $p);');
            buffer.writeln('      }');
          }
        },
        palette: palette,
        activeFillProperties: activeFillProperties,
        activeStrokeProperties: activeStrokeProperties,
        inheritedFills: inheritedFills,
        inheritedStrokes: inheritedStrokes,
      );
    });
  }
}
