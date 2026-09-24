import 'package:svg_painter_annotation/svg_painter_annotation.dart';

import '../../painting_model/_painting_model.dart';
import '../command_generator.dart';
import '../flutter_color_map.dart';
import '../generator_buffer.dart';
import '../models.dart';
import '../palette_analyzer.dart';
import '../shape_generator.dart';
import 'text_generator.dart';

/// Generator for [DrawTextPath] commands that render text along a path contour.
class TextPathGenerator extends ShapeGenerator<DrawTextPath> {
  const TextPathGenerator();

  @override
  void generate(
    DrawTextPath command,
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
    wrapWithStyle(buffer, command.style, 'Offset.zero & viewBox', () {
      final double effectiveOpacity = command.style.groupOpacity;
      final bool useLayer = effectiveOpacity < 1.0;

      if (useLayer) {
        final String hexOpacity = (effectiveOpacity * 255)
            .round()
            .toRadixString(16)
            .padLeft(2, '0')
            .toUpperCase();
        buffer.writeln(
          'canvas.saveLayer(null, Paint()..color = const Color(0x${hexOpacity}FFFFFF));',
        );
      }

      buffer.writeBlock('{', () {
        buffer.writeln('final Path path = Path()');
        buffer.indent();
        for (final PathOperation op in command.pathOperations) {
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

        buffer.writeBlock('for (final metric in path.computeMetrics()) {', () {
          buffer.writeln('double currentOffset = ${command.startOffset};');
          final String escapedText = escapeDartStringLiteral(command.text);
          buffer.writeln("final String text = '$escapedText';");
          buffer.writeln('TextPainter tp;');
          buffer.writeBlock("for (final String char in text.split('')) {", () {
            buffer.writeln('tp = TextPainter(');
            buffer.indent();
            buffer.writeBlock('text: TextSpan(', () {
              buffer.writeln('text: char,');
              buffer.writeBlock('style: TextStyle(', () {
                final PaintingFillStyle? fill = command.style.fill;
                if (fill?.colorArgb != null) {
                  final String colorCode = FlutterColorMap.getColorCode(
                    fill!.colorArgb!,
                    colorMapping: colorMapping,
                  );
                  final String? tokenName = palette?.colorTokens[fill.colorArgb!];
                  if (tokenName != null) {
                    buffer.writeln('color: $tokenName ?? $colorCode,');
                  } else {
                    buffer.writeln('color: $colorCode,');
                  }
                }
                final PaintingTextStyle? textStyle = command.style.text;
                if (textStyle != null) {
                  buffer.writeln('fontSize: ${textStyle.fontSize},');
                  buffer.writeln('fontWeight: ${textStyle.fontWeight.toFlutterString()},');
                  buffer.writeln('fontStyle: ${textStyle.fontStyle.toFlutterString()},');
                  if (textStyle.fontFamily case final String family) {
                    buffer.writeln("fontFamily: '${escapeDartStringLiteral(family)}',");
                  }
                  if (textStyle.fontPackage != null) {
                    buffer.writeln("package: '${textStyle.fontPackage}',");
                  }
                }
              }, footer: '),');
            }, footer: '),');
            buffer.writeln('textDirection: TextDirection.ltr,');
            buffer.outdent();
            buffer.writeln(')..layout();');

            buffer.writeln('final double halfWidth = tp.width / 2.0;');
            buffer.writeln('final double distance = currentOffset + halfWidth;');
            buffer.writeBlock('if (distance <= metric.length) {', () {
              buffer.writeln('final tangent = metric.getTangentForOffset(distance);');
              buffer.writeBlock('if (tangent != null) {', () {
                buffer.writeln('canvas.save();');
                buffer.writeln('canvas.translate(tangent.position.dx, tangent.position.dy);');
                buffer.writeln('canvas.rotate(-tangent.angle);');
                buffer.writeln(
                  'tp.paint(canvas, Offset(-halfWidth, -tp.computeDistanceToActualBaseline(TextBaseline.alphabetic)));',
                );
                buffer.writeln('canvas.restore();');
              });
            });
            buffer.writeln('currentOffset += tp.width;');
          });
        });
      });

      if (useLayer) {
        buffer.writeln('canvas.restore();');
      }
    });
  }
}
