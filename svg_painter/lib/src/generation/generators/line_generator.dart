import '../../painting_model/_painting_model.dart';
import '../command_generator.dart';
import '../generator_buffer.dart';
import '../models.dart';
import '../palette_analyzer.dart';
import '../shape_generator.dart';

class LineGenerator extends ShapeGenerator<DrawLine> {
  const LineGenerator();

  @override
  void generate(
    DrawLine command,
    GeneratorBuffer buffer, {
    Map<Type, CommandGenerator<PaintCommand>>? generators,
    PaletteResult? palette,
    Map<String, String>? activeFillProperties,
    Map<String, String>? activeStrokeProperties,
    List<InheritedProperty>? inheritedFills,
    List<InheritedProperty>? inheritedStrokes,
  }) {
    wrapWithStyle(buffer, command.style, () {
      final String bounds =
          'Rect.fromPoints(const Offset(${command.x1}, ${command.y1}), const Offset(${command.x2}, ${command.y2}))';
      generatePaintingCode(
        buffer,
        command,
        command.style,
        bounds,
        (String p, {String? dashArray, String? pathLength}) {
          if (dashArray == null) {
            buffer.writeln(
              'canvas.drawLine(const Offset(${command.x1}, ${command.y1}), const Offset(${command.x2}, ${command.y2}), $p);',
            );
          } else {
            final String plArg;
            if (pathLength?.isEmpty ?? true) {
              plArg = '';
            } else {
              plArg = ', pathLength: $pathLength';
            }
            buffer.writeBlock('{', () {
              buffer.writeln(
                'final Path path = Path()..moveTo(${command.x1}, ${command.y1})..lineTo(${command.x2}, ${command.y2});',
              );
              buffer.writeln('canvas.drawPath(_dashPath(path, $dashArray$plArg), $p);');
            });
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
