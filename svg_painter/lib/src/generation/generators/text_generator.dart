import '../../painting_model/_painting_model.dart';
import '../command_generator.dart';
import '../flutter_color_map.dart';
import '../generator_buffer.dart';
import '../models.dart';
import '../palette_analyzer.dart';
import '../shape_generator.dart';

class TextGenerator extends ShapeGenerator<DrawText> {
  const TextGenerator();

  @override
  void generate(
    DrawText command,
    GeneratorBuffer buffer, {
    Map<Type, CommandGenerator<PaintCommand>>? generators,
    PaletteResult? palette,
    Map<String, String>? activeFillProperties,
    Map<String, String>? activeStrokeProperties,
    List<InheritedProperty>? inheritedFills,
    List<InheritedProperty>? inheritedStrokes,
    String? painterClassName,
    Set<String>? gradientsNeedingStretch,
  }) {
    final bounds = 'Rect.fromLTWH(${command.x}, ${command.y}, 100, 100)'; // Approximation
    wrapWithStyle(buffer, command.style, 'Offset.zero & viewBox', () {
      generatePaintingCode(
        buffer,
        command,
        command.style,
        bounds,
        (String p, {String? dashArray, String? pathLength, String? dashOffset}) {
          _generateTextPainter(
            buffer,
            command,
            p,
            isStroke: false,
            palette: palette,
            activeFillProperties: activeFillProperties,
            activeStrokeProperties: activeStrokeProperties,
            inheritedFills: inheritedFills,
            inheritedStrokes: inheritedStrokes,
          );
        },
        drawStrokeCall: (String p, {String? dashArray, String? pathLength, String? dashOffset}) {
          _generateTextPainter(
            buffer,
            command,
            p,
            isStroke: true,
            palette: palette,
            activeFillProperties: activeFillProperties,
            activeStrokeProperties: activeStrokeProperties,
            inheritedFills: inheritedFills,
            inheritedStrokes: inheritedStrokes,
          );
        },
        palette: palette,
        activeFillProperties: activeFillProperties,
        activeStrokeProperties: activeStrokeProperties,
        inheritedFills: inheritedFills,
        inheritedStrokes: inheritedStrokes,
      );
    });
  }

  void _generateTextPainter(
    GeneratorBuffer buffer,
    DrawText command,
    String paintVar, {
    required bool isStroke,
    PaletteResult? palette,
    Map<String, String>? activeFillProperties,
    Map<String, String>? activeStrokeProperties,
    List<InheritedProperty>? inheritedFills,
    List<InheritedProperty>? inheritedStrokes,
  }) {
    buffer.writeBlock('{', () {
      buffer.writeln('final TextPainter tp = TextPainter(');
      buffer.indent();
      buffer.writeBlock('text:', () {
        _generateTextSpan(
          buffer,
          command.rootSpan,
          paintVar,
          isStroke: isStroke,
          initialStyle: command.style,
          palette: palette,
          activeFillProperties: activeFillProperties,
          activeStrokeProperties: activeStrokeProperties,
          inheritedFills: inheritedFills,
          inheritedStrokes: inheritedStrokes,
        );
      }, footer: ',');
      buffer.writeln('textDirection: TextDirection.ltr,');
      buffer.outdent();
      buffer.writeln(')..layout();');

      final PaintingTextAnchor anchor = command.style.text?.textAnchor ?? PaintingTextAnchor.start;
      final String xExpr = switch (anchor) {
        PaintingTextAnchor.middle => '${command.x} - tp.width / 2.0',
        PaintingTextAnchor.end => '${command.x} - tp.width',
        PaintingTextAnchor.start => '${command.x}',
      };

      buffer.writeln(
        'tp.paint(canvas, Offset($xExpr, ${command.y} - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic)));',
      );
    });
  }

  void _generateTextSpan(
    GeneratorBuffer buffer,
    PaintingTextSpan span,
    String parentPaint, {
    bool isStroke = false,
    PaintingStyle? initialStyle,
    PaletteResult? palette,
    Map<String, String>? activeFillProperties,
    Map<String, String>? activeStrokeProperties,
    List<InheritedProperty>? inheritedFills,
    List<InheritedProperty>? inheritedStrokes,
  }) {
    buffer.writeBlock('TextSpan(', () {
      if (span.text != null) {
        buffer.writeln("text: '${span.text!.replaceAll("'", r"\'")}',");
      }

      final PaintingStyle? style = span.style ?? initialStyle;
      if (style != null) {
        buffer.writeBlock('style: TextStyle(', () {
          if (isStroke) {
            buffer.writeln('foreground: $parentPaint,');
          } else {
            final PaintingFillStyle? fill = (span.style != null && span.style != initialStyle)
                ? span.style?.fill
                : style.fill;
            if (fill != null) {
              if (fill.shaderId != null) {
                buffer.writeln(
                  'foreground: Paint()..shader = _grad_${fill.shaderId}.createShader(Rect.zero),',
                );
              } else if (fill.colorArgb != null) {
                final String colorCode = FlutterColorMap.getColorCode(fill.colorArgb!);
                buffer.writeln('color: $colorCode,');
              }
            }
          }

          final PaintingTextStyle? textStyle = style.text;
          if (textStyle != null) {
            buffer.writeln('fontSize: ${textStyle.fontSize},');
            buffer.writeln('fontWeight: ${textStyle.fontWeight.toFlutterString()},');
            buffer.writeln('fontStyle: ${textStyle.fontStyle.toFlutterString()},');
            buffer.writeln("fontFamily: '${textStyle.fontFamily}',");
          }
        }, footer: '),');
      }

      if (span.children.isNotEmpty) {
        buffer.writeBlock('children: <InlineSpan>[', () {
          for (final PaintingTextSpan child in span.children) {
            _generateTextSpan(
              buffer,
              child,
              parentPaint,
              isStroke: isStroke,
              palette: palette,
              activeFillProperties: activeFillProperties,
              activeStrokeProperties: activeStrokeProperties,
              inheritedFills: inheritedFills,
              inheritedStrokes: inheritedStrokes,
            );
            buffer.writeln(',');
          }
        }, footer: '],');
      }
    }, footer: ')');
  }
}
