import 'package:svg_painter_annotation/svg_painter_annotation.dart';

import '../../painting_model/_painting_model.dart';
import '../../svg_model/_svg_model.dart';
import '../command_generator.dart';
import '../generator_buffer.dart';
import '../models.dart';
import '../palette_analyzer.dart';
import '../path_marker_extractor.dart';
import '../shape_generator.dart';
import '../svg_id_formatter.dart';

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
        for (final PathOperation op in command.operations) {
          switch (op) {
            case MoveTo(:final double x, :final double y):
              buffer.writeln('..moveTo($x, $y)');
            case LineTo(:final double x, :final double y):
              buffer.writeln('..lineTo($x, $y)');
            case CubicTo(
              :final double x1,
              :final double y1,
              :final double x2,
              :final double y2,
              :final double x3,
              :final double y3,
            ):
              buffer.writeln('..cubicTo($x1, $y1, $x2, $y2, $x3, $y3)');
            case QuadraticTo(
              :final double x1,
              :final double y1,
              :final double x2,
              :final double y2,
            ):
              buffer.writeln('..quadraticBezierTo($x1, $y1, $x2, $y2)');
            case ArcTo(
              :final double rx,
              :final double ry,
              :final double xAxisRotation,
              :final bool largeArcFlag,
              :final bool sweepFlag,
              :final double x,
              :final double y,
            ):
              buffer.writeln(
                '..arcToPoint(const Offset($x, $y), radius: const Radius.elliptical($rx, $ry), rotation: $xAxisRotation, largeArc: $largeArcFlag, clockwise: $sweepFlag)',
              );
            case ClosePath():
              buffer.writeln('..close()');
          }
        }
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
                  final String? markerStart = command.style.markerStartId;
                  final String? markerMid = command.style.markerMidId;
                  final String? markerEnd = command.style.markerEndId;
                  final double strokeWidth = command.style.strokeWidth;
                  final List<MarkerVertex> vertices = PathMarkerExtractor.extractFromOperations(
                    command.operations,
                  );
                  final fillArg = fillPaintVar != null ? ', contextFill: $fillPaintVar' : '';
                  final strokeArg = strokePaintVar != null
                      ? ', contextStroke: $strokePaintVar'
                      : '';
                  for (final v in vertices) {
                    if (v.isStart) {
                      if (markerStart != null) {
                        final String cleanStart = SvgIdFormatter.sanitizeId(markerStart);
                        buffer.writeln(
                          '_marker_$cleanStart(canvas, const Offset(${v.x}, ${v.y}), ${v.angle}, $strokeWidth, isStart: true$fillArg$strokeArg);',
                        );
                      }
                    } else if (v.isEnd) {
                      if (markerEnd != null) {
                        final String cleanEnd = SvgIdFormatter.sanitizeId(markerEnd);
                        buffer.writeln(
                          '_marker_$cleanEnd(canvas, const Offset(${v.x}, ${v.y}), ${v.angle}, $strokeWidth$fillArg$strokeArg);',
                        );
                      }
                    } else {
                      if (markerMid != null) {
                        final String cleanMid = SvgIdFormatter.sanitizeId(markerMid);
                        buffer.writeln(
                          '_marker_$cleanMid(canvas, const Offset(${v.x}, ${v.y}), ${v.angle}, $strokeWidth$fillArg$strokeArg);',
                        );
                      }
                    }
                  }
                }
              : null,
        );
      });
    });
  }
}
