import '../painting_model/_painting_model.dart';
import 'command_generator.dart';

class OvalGenerator extends ShapeGenerator<DrawOval> {
  const OvalGenerator();

  @override
  void generate(DrawOval command, StringBuffer buffer) {
    if (command.rx <= 0 || command.ry <= 0) return;

    wrapWithTransform(buffer, command.transform, () {
      final String bounds =
          'Rect.fromCenter(center: const Offset(${command.cx}, ${command.cy}), width: ${command.rx * 2}, height: ${command.ry * 2})';
      generatePaintingCode(buffer, command.style, bounds, (String p) {
        buffer.writeln('      canvas.drawOval($bounds, $p);');
      });
    });
  }
}
