import '../painting_model/_painting_model.dart';
import 'command_generator.dart';

class LineGenerator extends ShapeGenerator<DrawLine> {
  const LineGenerator();

  @override
  void generate(DrawLine command, StringBuffer buffer) {
    wrapWithTransform(buffer, command.transform, () {
      final String p1 = 'const Offset(${command.x1}, ${command.y1})';
      final String p2 = 'const Offset(${command.x2}, ${command.y2})';
      final String bounds = 'Rect.fromPoints($p1, $p2)';

      buffer.writeln('      final Paint paint = Paint();');
      if (command.style.strokeShaderId != null) {
        buffer.writeln(
          '      paint.shader = _grad_${command.style.strokeShaderId}.createShader($bounds);',
        );
      } else if (command.style.strokeColorArgb != null && command.style.strokeColorArgb != 0) {
        buffer.writeln(
          '      paint.color = const Color(0x${command.style.strokeColorArgb!.toRadixString(16).toUpperCase()});',
        );
      }
      buffer.writeln('      paint.style = PaintingStyle.stroke;');
      buffer.writeln('      paint.strokeWidth = ${command.style.strokeWidth};');
      buffer.writeln('      canvas.drawLine($p1, $p2, paint);');
    });
  }
}
