import '../../painting_model/_painting_model.dart';
import '../command_generator.dart';
import '../generator_buffer.dart';
import '../models.dart';
import '../palette_analyzer.dart';
import '../shape_generator.dart';

class PathGenerator extends ShapeGenerator<DrawPath> {
  const PathGenerator();

  @override
  void generate(
    DrawPath command,
    GeneratorBuffer buffer, {
    Map<Type, CommandGenerator<PaintCommand>>? generators,
    PaletteResult? palette,
    Map<String, String>? activeFillProperties,
    Map<String, String>? activeStrokeProperties,
    List<InheritedProperty>? inheritedFills,
    List<InheritedProperty>? inheritedStrokes,
  }) {
    wrapWithTransform(buffer, command.style.transformAttributes, () {
      final String pathVar = '_path_${command.hashCode.abs()}';
      buffer.writeln('final Path $pathVar = Path()');
      buffer.indent();
      for (final PathOperation op in command.operations) {
        switch (op) {
          case MoveTo(:final double x, :final double y):
            buffer.writeln('..moveTo($x, $y)');
          case LineTo(:final double x, :final double y):
            buffer.writeln('..lineTo($x, $y)');
          case CubicTo(
            :final double x1,
            :final double y1,
            :final double x2,
            :final double y2,
            :final double x3,
            :final double y3,
          ):
            buffer.writeln('..cubicTo($x1, $y1, $x2, $y2, $x3, $y3)');
          case QuadraticTo(:final double x1, :final double y1, :final double x2, :final double y2):
            buffer.writeln('..quadraticTo($x1, $y1, $x2, $y2)');
          case ArcTo(
            :final double rx,
            :final double ry,
            :final double xAxisRotation,
            :final bool largeArcFlag,
            :final bool sweepFlag,
            :final double x,
            :final double y,
          ):
            buffer.writeln(
              '..arcToPoint(const Offset($x, $y), radius: const Radius.elliptical($rx, $ry), rotation: $xAxisRotation, largeArc: $largeArcFlag, clockwise: $sweepFlag)',
            );
          case ClosePath():
            buffer.writeln('..close()');
        }
      }
      buffer.outdent();
      buffer.writeln(';');

      final String bounds = '$pathVar.getBounds()';
      generatePaintingCode(
        buffer,
        command,
        command.style,
        bounds,
        (String p, {String? dashArray, String? pathLength}) {
          if (dashArray == null) {
            buffer.writeln('canvas.drawPath($pathVar, $p);');
          } else {
            final String plArg;
            if (pathLength?.isEmpty ?? true) {
              plArg = '';
            } else {
              plArg = ', pathLength: $pathLength';
            }
            buffer.writeln('canvas.drawPath(_dashPath($pathVar, $dashArray$plArg), $p);');
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
