import '../../painting_model/_painting_model.dart';
import '../command_generator.dart';
import '../generator_buffer.dart';
import '../models.dart';
import '../palette_analyzer.dart';
import '../shape_generator.dart';

class RectGenerator extends ShapeGenerator<DrawRect> {
  const RectGenerator();

  @override
  void generate(
    DrawRect command,
    GeneratorBuffer buffer, {
    Map<Type, CommandGenerator<PaintCommand>>? generators,
    PaletteResult? palette,
    Map<String, String>? activeFillProperties,
    Map<String, String>? activeStrokeProperties,
    List<InheritedProperty>? inheritedFills,
    List<InheritedProperty>? inheritedStrokes,
  }) {
    wrapWithTransform(buffer, command.style.transformAttributes, () {
      final String bounds =
          'Rect.fromLTWH(${command.x}, ${command.y}, ${command.width}, ${command.height})';
      generatePaintingCode(
        buffer,
        command,
        command.style,
        bounds,
        (String p, {String? dashArray, String? pathLength}) {
          if (dashArray == null) {
            if (command.rx != 0 || command.ry != 0) {
              buffer.writeln(
                'canvas.drawRRect(RRect.fromRectAndRadius($bounds, const Radius.elliptical(${command.rx}, ${command.ry})), $p);',
              );
            } else {
              buffer.writeln('canvas.drawRect($bounds, $p);');
            }
          } else {
            final String plArg;
            if (pathLength?.isEmpty ?? true) {
              plArg = '';
            } else {
              plArg = ', pathLength: $pathLength';
            }
            buffer.writeBlock('{', () {
              if (command.rx != 0 || command.ry != 0) {
                buffer.writeln(
                  'final Path path = Path()..addRRect(RRect.fromRectAndRadius($bounds, const Radius.elliptical(${command.rx}, ${command.ry})));',
                );
              } else {
                buffer.writeln('final Path path = Path()..addRect($bounds);');
              }
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
