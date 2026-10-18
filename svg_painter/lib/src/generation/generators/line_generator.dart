import 'package:svg_painter_annotation/svg_painter_annotation.dart';

import '../../painting_model/_painting_model.dart';
import '../command_generator.dart';
import '../generator_buffer.dart';
import '../models.dart';
import '../palette_analyzer.dart';
import '../path_marker_extractor.dart';
import '../shape_generator.dart';

class LineGenerator extends ShapeGenerator<DrawLine> {
  const LineGenerator();

  @override
  void generate(
    DrawLine command,
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
        'Rect.fromPoints(const Offset(${command.x1}, ${command.y1}), const Offset(${command.x2}, ${command.y2}))';
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
            'canvas.drawLine(const Offset(${command.x1}, ${command.y1}), const Offset(${command.x2}, ${command.y2}), $p);',
          );
        },
        drawStrokeCall: (String p, {String? dashArray, String? pathLength, String? dashOffset}) {
          if (dashArray == null && command.style.vectorEffect == .none) {
            buffer.writeln(
              'canvas.drawLine(const Offset(${command.x1}, ${command.y1}), const Offset(${command.x2}, ${command.y2}), $p);',
            );
          } else {
            final plArg = (pathLength?.isEmpty ?? true) ? '' : ', pathLength: $pathLength';
            final doArg = (dashOffset?.isEmpty ?? true) ? '' : ', dashOffset: $dashOffset';
            buffer.writeBlock('{', () {
              buffer.writeln(
                'final Path path = Path()..moveTo(${command.x1}, ${command.y1})..lineTo(${command.x2}, ${command.y2});',
              );
              final pathExpr = dashArray == null
                  ? 'path'
                  : '_dashPath(path, $dashArray$plArg$doArg)';
              emitDrawStrokePath(buffer, pathExpr, p, style: command.style);
            });
          }
        },
        drawMarkersCall: command.style.hasMarkers
            ? () {
                final String? markerStart = command.style.markerStartId;
                final String? markerEnd = command.style.markerEndId;
                final double strokeWidth = command.style.stroke?.width ?? 1.0;
                final List<MarkerVertex> vertices = PathMarkerExtractor.extractFromLine(
                  command.x1,
                  command.y1,
                  command.x2,
                  command.y2,
                );
                for (final v in vertices) {
                  if (v.isStart && markerStart != null) {
                    buffer.writeln(
                      '_marker_$markerStart(canvas, const Offset(${v.x}, ${v.y}), ${v.angle}, $strokeWidth, isStart: true);',
                    );
                  } else if (v.isEnd && markerEnd != null) {
                    buffer.writeln(
                      '_marker_$markerEnd(canvas, const Offset(${v.x}, ${v.y}), ${v.angle}, $strokeWidth);',
                    );
                  }
                }
              }
            : null,
      );
    });
  }
}
