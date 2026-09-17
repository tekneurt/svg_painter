import 'package:svg_painter_annotation/svg_painter_annotation.dart';

import '../../painting_model/_painting_model.dart';
import '../command_generator.dart';
import '../generator_buffer.dart';
import '../models.dart';
import '../palette_analyzer.dart';
import '../shape_generator.dart';

class CircleGenerator extends ShapeGenerator<DrawCircle> {
  const CircleGenerator();

  @override
  void generate(
    DrawCircle command,
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
    final bounds =
        'Rect.fromCircle(center: const Offset(${command.cx}, ${command.cy}), radius: ${command.radius})';
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
          buffer.writeln(
            'canvas.drawCircle(const Offset(${command.cx}, ${command.cy}), ${command.radius}, $p);',
          );
        },
        drawStrokeCall: (String p, {String? dashArray, String? pathLength, String? dashOffset}) {
          if (dashArray == null && command.style.vectorEffect == .none) {
            buffer.writeln(
              'canvas.drawCircle(const Offset(${command.cx}, ${command.cy}), ${command.radius}, $p);',
            );
          } else {
            final plArg = (pathLength?.isEmpty ?? true) ? '' : ', pathLength: $pathLength';
            final doArg = (dashOffset?.isEmpty ?? true) ? '' : ', dashOffset: $dashOffset';
            buffer.writeBlock('{', () {
              buffer.writeln('final Path path = Path()..addOval($bounds);');
              final pathExpr = dashArray == null ? 'path' : '_dashPath(path, $dashArray$plArg$doArg)';
              emitDrawStrokePath(buffer, pathExpr, p, style: command.style);
            });
          }
        },
      );
    });
  }
}
