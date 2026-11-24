import 'package:svg_painter_annotation/svg_painter_annotation.dart';

import '../../painting_model/_painting_model.dart';
import '../../svg_model/_svg_model.dart';
import '../command_generator.dart';
import '../generator_buffer.dart';
import '../models.dart';
import '../palette_analyzer.dart';
import '../path_marker_extractor.dart';
import '../shape_generator.dart';

class PathGenerator extends ShapeGenerator<DrawPath> {
  const PathGenerator();

  @override
  void generate(
    DrawPath command,
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
    bool isInsideMarker = false,
  }) {
    wrapWithStyle(buffer, command.style, 'Offset.zero & viewBox', () {
      buffer.writeBlock('{', () {
        buffer.writeln('final Path path = Path()');
        buffer.indent();
        emitPathOperations(buffer, command.operations);
        buffer.outdent();
        buffer.writeln(';');
        if (command.style.fill?.fillRule == SvgFillRule.evenodd) {
          buffer.writeln('path.fillType = PathFillType.evenOdd;');
        }

        const bounds = 'path.getBounds()';
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
          isInsideMarker: isInsideMarker,
          (String p, {String? dashArray, String? pathLength, String? dashOffset}) {
            buffer.writeln('canvas.drawPath(path, $p);');
          },
          drawStrokeCall: (String p, {String? dashArray, String? pathLength, String? dashOffset}) {
            final String pathExpr;
            if (dashArray == null) {
              pathExpr = 'path';
            } else {
              final plArg = (pathLength?.isEmpty ?? true) ? '' : ', pathLength: $pathLength';
              final doArg = (dashOffset?.isEmpty ?? true) ? '' : ', dashOffset: $dashOffset';
              pathExpr = '_dashPath(path, $dashArray$plArg$doArg)';
            }
            emitDrawStrokePath(buffer, pathExpr, p, style: command.style);
          },
          drawMarkersCall: command.style.hasMarkers
              ? (String? fillPaintVar, String? strokePaintVar) {
                  emitMarkerCalls(
                    buffer,
                    command.style,
                    PathMarkerExtractor.extractFromOperations(command.operations),
                    fillPaintVar: fillPaintVar,
                    strokePaintVar: strokePaintVar,
                  );
                }
              : null,
        );
      });
    });
  }
}
