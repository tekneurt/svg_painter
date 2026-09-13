import '../../painting_model/_painting_model.dart';
import '../../svg_model/_svg_model.dart';
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
    String? painterClassName,
    Set<String>? gradientsNeedingStretch,
  }) {
    final List<double> points;
    var isClosed = false;
    if (command is DrawPolyline) {
      points = command.points;
    } else if (command is DrawPolygon) {
      points = command.points;
      isClosed = true;
    } else {
      return;
    }

    wrapWithStyle(buffer, command.style, 'Offset.zero & viewBox', () {
      if (points.isEmpty) {
        return;
      }

      buffer.writeBlock('{', () {
        buffer.writeln('final Path path = Path()');
        buffer.indent();
        buffer.writeln('..moveTo(${points[0]}, ${points[1]})');
        for (var i = 2; i < points.length; i += 2) {
          buffer.writeln('..lineTo(${points[i]}, ${points[i + 1]})');
        }
        if (isClosed) {
          buffer.writeln('..close()');
        }
        buffer.outdent();
        buffer.writeln(';');
        if (command.style.fill?.fillRule == SvgFillRule.evenodd) {
          buffer.writeln('path.fillType = PathFillType.evenOdd;');
        }

        const bounds = 'path.getBounds()';
        generatePaintingCode(
          buffer,
          command,
          command.style,
          bounds,
          (String p, {String? dashArray, String? pathLength, String? dashOffset}) {
            buffer.writeln('canvas.drawPath(path, $p);');
          },
          drawStrokeCall: (String p, {String? dashArray, String? pathLength, String? dashOffset}) {
            final String pathExpr;
            if (dashArray == null) {
              pathExpr = 'path';
            } else {
              final plArg = (pathLength?.isEmpty ?? true) ? '' : ', pathLength: $pathLength';
              final doArg = (dashOffset?.isEmpty ?? true) ? '' : ', dashOffset: $dashOffset';
              pathExpr = '_dashPath(path, $dashArray$plArg$doArg)';
            }
            emitDrawStrokePath(buffer, pathExpr, p, style: command.style);
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
