import '../../painting_model/_painting_model.dart';
import '../command_generator.dart';
import '../generator_buffer.dart';
import '../models.dart';
import '../palette_analyzer.dart';
import '../shape_generator.dart';

class PolyGenerator<T extends DrawCommand> extends ShapeGenerator<T> {
  const PolyGenerator();

  @override
  void generate(
    T command,
    GeneratorBuffer buffer, {
    Map<Type, CommandGenerator<PaintCommand>>? generators,
    PaletteResult? palette,
    Map<String, String>? activeFillProperties,
    Map<String, String>? activeStrokeProperties,
    List<InheritedProperty>? inheritedFills,
    List<InheritedProperty>? inheritedStrokes,
  }) {
    final List<double> points;
    bool isClosed = false;
    if (command is DrawPolyline) {
      points = command.points;
    } else if (command is DrawPolygon) {
      points = command.points;
      isClosed = true;
    } else {
      return;
    }

    wrapWithTransform(buffer, command.style.transformAttributes, () {
      if (points.isEmpty) {
        return;
      }

      buffer.writeBlock('{', () {
        buffer.writeln('final Path path = Path()');
        buffer.indent();
        buffer.writeln('..moveTo(${points[0]}, ${points[1]})');
        for (int i = 2; i < points.length; i += 2) {
          buffer.writeln('..lineTo(${points[i]}, ${points[i + 1]})');
        }
        if (isClosed) {
          buffer.writeln('..close()');
        }
        buffer.outdent();
        buffer.writeln(';');

        const String bounds = 'path.getBounds()';
        generatePaintingCode(
          buffer,
          command,
          command.style,
          bounds,
          (String p, {String? dashArray, String? pathLength}) {
            if (dashArray == null) {
              buffer.writeln('canvas.drawPath(path, $p);');
            } else {
              final String plArg;
              if (pathLength?.isEmpty ?? true) {
                plArg = '';
              } else {
                plArg = ', pathLength: $pathLength';
              }
              buffer.writeln('canvas.drawPath(_dashPath(path, $dashArray$plArg), $p);');
            }
          },
          palette: palette,
          activeFillProperties: activeFillProperties,
          activeStrokeProperties: activeStrokeProperties,
          inheritedFills: inheritedFills,
          inheritedStrokes: inheritedStrokes,
        );
      });
    });
  }
}
