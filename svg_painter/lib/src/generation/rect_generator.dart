import '../painting_model/_painting_model.dart';
import 'command_generator.dart';

import 'palette_analyzer.dart';

class RectGenerator extends ShapeGenerator<DrawRect> {
  const RectGenerator();

  @override
  void generate(
    DrawRect command,
    StringBuffer buffer, {
    Map<Type, CommandGenerator<PaintCommand>>? generators,
    PaletteResult? palette,
    Map<String, String>? activeFillProperties,
    Map<String, String>? activeStrokeProperties,
    List<InheritedProperty>? inheritedFills,
    List<InheritedProperty>? inheritedStrokes,
  }) {
    wrapWithTransform(buffer, command.transform, () {
      final String r =
          'Rect.fromLTWH(${command.x}, ${command.y}, ${command.width}, ${command.height})';
      final String drawMethod =
          (command.rx > 0 || command.ry > 0) ? 'drawRRect' : 'drawRect';
      final String rectCode = (command.rx > 0 || command.ry > 0)
          ? 'RRect.fromRectAndRadius($r, const Radius.elliptical(${command.rx}, ${command.ry}))'
          : r;

      generatePaintingCode(
        buffer,
        command,
        command.style,
        (command.rx > 0 || command.ry > 0) ? r : rectCode, // Bounds is always the Rect
        (
          String p, {
          String? dashArray,
          String? pathLength,
        }) {
          if (dashArray == null) {
            buffer.writeln('      canvas.$drawMethod($rectCode, $p);');
          } else {
            final String plArg;
            if (pathLength?.isEmpty ?? true) {
              plArg = '';
            } else {
              plArg = ', pathLength: $pathLength';
            }
            buffer.writeln('      {');
            buffer.writeln('        final Path path = Path();');
            if (command.rx > 0 || command.ry > 0) {
              buffer.writeln('        path.addRRect($rectCode);');
            } else {
              buffer.writeln('        path.addRect($r);');
            }
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
