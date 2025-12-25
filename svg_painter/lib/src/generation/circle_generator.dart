import '../painting_model/_painting_model.dart';
import 'command_generator.dart';

class CircleGenerator extends ShapeGenerator<DrawCircle> {
  const CircleGenerator();

  @override
  void generate(
    DrawCircle command,
    StringBuffer buffer, {
    Map<Type, CommandGenerator<PaintCommand>>? generators,
  }) {
    wrapWithTransform(buffer, command.transform, () {
      final String bounds =
          'Rect.fromCircle(center: const Offset(${command.cx}, ${command.cy}), radius: ${command.radius})';
      generatePaintingCode(buffer, command.style, bounds, (String p) {
        buffer.writeln(
          '      canvas.drawCircle(const Offset(${command.cx}, ${command.cy}), ${command.radius}, $p);',
        );
      });
    });
  }
}
