import '../painting_model/_painting_model.dart';
import 'command_generator.dart';

import 'palette_analyzer.dart';

class PolyGenerator extends ShapeGenerator<PaintCommand> {
  const PolyGenerator();

  @override
  void generate(
    PaintCommand command,
    StringBuffer buffer, {
    Map<Type, CommandGenerator<PaintCommand>>? generators,
    PaletteResult? palette,
    Map<String, String>? activeFillProperties,
    Map<String, String>? activeStrokeProperties,
  }) {
    final List<double> pts;
    final bool closed;
    final PaintingStyle style;
    final String? transform;

    if (command is DrawPolyline) {
      pts = command.points;
      closed = false;
      style = command.style;
      transform = command.transform;
    } else if (command is DrawPolygon) {
      pts = command.points;
      closed = true;
      style = command.style;
      transform = command.transform;
    } else {
      return;
    }

    wrapWithTransform(buffer, transform, () {
      buffer.writeln('      {');
      buffer.writeln('        final Path path = Path();');
      final StringBuffer sb = StringBuffer();
      for (int i = 0; i < pts.length; i += 2) {
        if (i > 0) {
          sb.write(', ');
        }
        sb.write('const Offset(${pts[i]}, ${pts[i + 1]})');
      }
      buffer.writeln('        path.addPolygon([$sb], $closed);');
      generatePaintingCode(
        buffer,
        command,
        style,
        'path.getBounds()',
        (
          String p, {
          String? dashArray,
          String? pathLength,
        }) {
          if (dashArray == null) {
            buffer.writeln('        canvas.drawPath(path, $p);');
          } else {
            final String plArg = (pathLength != null && pathLength.isNotEmpty)
                ? ', pathLength: $pathLength'
                : '';
            buffer.writeln('        canvas.drawPath(_dashPath(path, $dashArray$plArg), $p);');
          }
        },
        palette: palette,
        activeFillProperties: activeFillProperties,
        activeStrokeProperties: activeStrokeProperties,
      );
      buffer.writeln('      }');
    });
  }
}
