import '../painting_model/_painting_model.dart';
import 'command_generator.dart';

import 'palette_analyzer.dart';

/// Generator for [DrawPath] commands.
class PathGenerator extends ShapeGenerator<DrawPath> {
  const PathGenerator();

  @override
  void generate(
    DrawPath command,
    StringBuffer buffer, {
    Map<Type, CommandGenerator<PaintCommand>>? generators,
    PaletteResult? palette,
    Set<String>? activeFillProperties,
    Set<String>? activeStrokeProperties,
  }) {
    wrapWithTransform(buffer, command.transform, () {
      buffer.writeln('      // Path');
      buffer.writeln('      {');
      buffer.writeln('        final Path path = Path();');

      for (final PathOperation op in command.operations) {
        if (op is MoveTo) {
          buffer.writeln('        path.moveTo(${op.x}, ${op.y});');
        } else if (op is LineTo) {
          buffer.writeln('        path.lineTo(${op.x}, ${op.y});');
        } else if (op is CubicTo) {
          buffer.writeln(
            '        path.cubicTo(${op.x1}, ${op.y1}, ${op.x2}, ${op.y2}, ${op.x3}, ${op.y3});',
          );
        } else if (op is QuadraticTo) {
          buffer.writeln('        path.quadraticBezierTo(${op.x1}, ${op.y1}, ${op.x2}, ${op.y2});');
        } else if (op is ArcTo) {
          buffer.writeln(
            '        path.arcToPoint(const Offset(${op.x}, ${op.y}), radius: const Radius.elliptical(${op.rx}, ${op.ry}), rotation: ${op.xAxisRotation}, largeArc: ${op.largeArcFlag}, clockwise: ${op.sweepFlag});',
          );
        } else if (op is ClosePath) {
          buffer.writeln('        path.close();');
        }
      }

      generatePaintingCode(
        buffer,
        command,
        command.style,
        'path.getBounds()',
        (
          String paintVar, {
          String? dashArray,
          String? pathLength,
        }) {
          if (dashArray != null) {
            final String plArg = (pathLength != null && pathLength.isNotEmpty)
                ? ', pathLength: $pathLength'
                : '';
            buffer.writeln('        canvas.drawPath(_dashPath(path, $dashArray$plArg), $paintVar);');
          } else {
            buffer.writeln('        canvas.drawPath(path, $paintVar);');
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
