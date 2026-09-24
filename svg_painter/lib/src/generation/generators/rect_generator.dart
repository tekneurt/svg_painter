import 'package:svg_painter_annotation/svg_painter_annotation.dart';

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
    String? painterClassName,
    Set<String>? gradientsNeedingStretch,
    SvgColorMapping colorMapping = SvgColorMapping.material,
  }) {
    final bounds = 'Rect.fromLTWH(${command.x}, ${command.y}, ${command.width}, ${command.height})';
    final bool isRounded = command.rx != 0 || command.ry != 0;

    void emitDirectDraw(String p) {
      if (isRounded) {
        buffer.writeln(
          'canvas.drawRRect(RRect.fromRectAndRadius($bounds, const Radius.elliptical(${command.rx}, ${command.ry})), $p);',
        );
      } else {
        buffer.writeln('canvas.drawRect($bounds, $p);');
      }
    }

    wrapWithStyle(buffer, command.style, bounds, () {
      generatePaintingCode(
        buffer,
        command,
        command.style,
        bounds,
        colorMapping: colorMapping,
        palette: palette,
        activeFillProperties: activeFillProperties,
        activeStrokeProperties: activeStrokeProperties,
        inheritedFills: inheritedFills,
        inheritedStrokes: inheritedStrokes,
        (String p, {String? dashArray, String? pathLength, String? dashOffset}) {
          emitDirectDraw(p);
        },
        drawStrokeCall: (String p, {String? dashArray, String? pathLength, String? dashOffset}) {
          if (dashArray == null && command.style.vectorEffect == .none) {
            emitDirectDraw(p);
          } else {
            final plArg = (pathLength?.isEmpty ?? true) ? '' : ', pathLength: $pathLength';
            final doArg = (dashOffset?.isEmpty ?? true) ? '' : ', dashOffset: $dashOffset';
            buffer.writeBlock('{', () {
              if (isRounded) {
                buffer.writeln(
                  'final Path path = Path()..addRRect(RRect.fromRectAndRadius($bounds, const Radius.elliptical(${command.rx}, ${command.ry})));',
                );
              } else {
                buffer.writeln('final Path path = Path()..addRect($bounds);');
              }
              final pathExpr = dashArray == null ? 'path' : '_dashPath(path, $dashArray$plArg$doArg)';
              emitDrawStrokePath(buffer, pathExpr, p, style: command.style);
            });
          }
        },
      );
    });
  }
}
