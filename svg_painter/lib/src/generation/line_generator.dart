import '../painting_model/_painting_model.dart';
import 'command_generator.dart';

class LineGenerator extends ShapeGenerator<DrawLine> {
  const LineGenerator();

  @override
  void generate(
    DrawLine command,
    StringBuffer buffer, {
    Map<Type, CommandGenerator<PaintCommand>>? generators,
  }) {
    wrapWithTransform(buffer, command.transform, () {
      final String p1 = 'const Offset(${command.x1}, ${command.y1})';
      final String p2 = 'const Offset(${command.x2}, ${command.y2})';
      final String bounds = 'Rect.fromPoints($p1, $p2)';

      generatePaintingCode(buffer, command, command.style, bounds, (
        String p, {
        String? dashArray,
        String? pathLength,
      }) {
        if (dashArray != null) {
          final String plArg = (pathLength != null && pathLength.isNotEmpty)
              ? ', pathLength: $pathLength'
              : '';
          buffer.writeln('      {');
          buffer.writeln('        final Path path = Path();');
          buffer.writeln('        path.moveTo(${command.x1}, ${command.y1});');
          buffer.writeln('        path.lineTo(${command.x2}, ${command.y2});');
          buffer.writeln('        canvas.drawPath(_dashPath(path, $dashArray$plArg), $p);');
          buffer.writeln('      }');
        } else {
          buffer.writeln('      canvas.drawLine($p1, $p2, $p);');
        }
      });
    });
  }
}
