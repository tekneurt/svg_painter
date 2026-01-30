import '../painting_model/_painting_model.dart';
import 'command_generator.dart';

import 'palette_analyzer.dart';

class OvalGenerator extends ShapeGenerator<DrawOval> {
  const OvalGenerator();

  @override
  void generate(
    DrawOval command,
    StringBuffer buffer, {
    Map<Type, CommandGenerator<PaintCommand>>? generators,
    PaletteResult? palette,
    Set<String>? activeFillProperties,
    Set<String>? activeStrokeProperties,
  }) {
    wrapWithTransform(buffer, command.transform, () {
      final String bounds =
          'Rect.fromCenter(center: const Offset(${command.cx}, ${command.cy}), width: ${command.rx * 2}, height: ${command.ry * 2})';
      generatePaintingCode(
        buffer,
        command,
        command.style,
        bounds,
        (
          String p, {
          String? dashArray,
          String? pathLength,
        }) {
          if (dashArray == null) {
            buffer.writeln('      canvas.drawOval($bounds, $p);');
          } else {
            final String plArg = (pathLength != null && pathLength.isNotEmpty)
                ? ', pathLength: $pathLength'
                : '';
            buffer.writeln('      {');
            buffer.writeln('        final Path path = Path()..addOval($bounds);');
            buffer.writeln('        canvas.drawPath(_dashPath(path, $dashArray$plArg), $p);');
            buffer.writeln('      }');
          }
        },
        palette: palette,
        activeFillProperties: activeFillProperties,
        activeStrokeProperties: activeStrokeProperties,
      );
    });
  }
}
