import 'package:svg_painter_annotation/svg_painter_annotation.dart';

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
    SvgColorMapping colorMapping = SvgColorMapping.material,
  }) {
    final bounds = 'Rect.fromLTWH(${command.x}, ${command.y}, 100, 100)'; // Approximation
    wrapWithStyle(buffer, command.style, 'Offset.zero & viewBox', () {
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
            colorMapping: colorMapping,
          );
        },
        drawStrokeCall: (String p, {String? dashArray, String? pathLength, String? dashOffset}) {
          _generateTextPainter(
            buffer,
            command,
            p,
            isStroke: true,
            palette: palette,
            colorMapping: colorMapping,
          );
        },
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
    SvgColorMapping colorMapping = SvgColorMapping.material,
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
          colorMapping: colorMapping,
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
    SvgColorMapping colorMapping = SvgColorMapping.material,
  }) {
    buffer.writeBlock('TextSpan(', () {
      final String? spanText = span.text;
      if (spanText != null) {
        final String escapedText = escapeDartStringLiteral(spanText);
        buffer.writeln("text: '$escapedText',");
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
                final String colorCode = FlutterColorMap.getColorCode(
                  fill.colorArgb!,
                  colorMapping: colorMapping,
                );
                final String? tokenName = palette?.colorTokens[fill.colorArgb!];
                if (tokenName != null) {
                  buffer.writeln('color: $tokenName ?? $colorCode,');
                } else {
                  buffer.writeln('color: $colorCode,');
                }
              }
            }
          }

          final PaintingTextStyle? textStyle = style.text;
          if (textStyle != null) {
            buffer.writeln('fontSize: ${textStyle.fontSize},');
            buffer.writeln('fontWeight: ${textStyle.fontWeight.toFlutterString()},');
            buffer.writeln('fontStyle: ${textStyle.fontStyle.toFlutterString()},');
            buffer.writeln("fontFamily: '${textStyle.fontFamily}',");
            if (textStyle.fontPackage != null) {
              buffer.writeln("package: '${textStyle.fontPackage}',");
            }
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
              colorMapping: colorMapping,
            );
            buffer.writeln(',');
          }
        }, footer: '],');
      }
    }, footer: ')');
  }
}

/// Escapes raw text so it can be safely emitted inside a single-quoted Dart string literal.
String escapeDartStringLiteral(String text) {
  final buffer = StringBuffer();
  for (var i = 0; i < text.length; i++) {
    final String char = text[i];
    switch (char) {
      case r'\':
        buffer.write(r'\\');
      case "'":
        buffer.write(r"\'");
      case r'$':
        buffer.write(r'\$');
      case '\n':
        buffer.write(r'\n');
      case '\r':
        buffer.write(r'\r');
      default:
        buffer.write(char);
    }
  }
  return buffer.toString();
}
