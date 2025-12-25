import '../painting_model/_painting_model.dart';
import 'command_generator.dart';

class RectGenerator extends ShapeGenerator<DrawRect> {
  const RectGenerator();

  @override
  void generate(
    DrawRect command,
    StringBuffer buffer, {
    Map<Type, CommandGenerator<PaintCommand>>? generators,
  }) {
    wrapWithTransform(buffer, command.transform, () {
      final String r =
          'Rect.fromLTWH(${command.x}, ${command.y}, ${command.width}, ${command.height})';
      final String rectCode = command.rx > 0 || command.ry > 0
          ? 'RRect.fromRectAndRadius($r, Radius.elliptical(${command.rx}, ${command.ry}))'
          : r;
      final String drawMethod = command.rx > 0 || command.ry > 0 ? 'drawRRect' : 'drawRect';

      generatePaintingCode(buffer, command.style, r, (String p) {
        buffer.writeln('      canvas.$drawMethod($rectCode, $p);');
      });
    });
  }
}
