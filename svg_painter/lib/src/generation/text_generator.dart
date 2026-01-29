import '../painting_model/_painting_model.dart';
import 'command_generator.dart';

import 'palette_analyzer.dart';

/// Generator for [DrawText] commands.
class TextGenerator extends ShapeGenerator<DrawText> {
  const TextGenerator();

  @override
  void generate(
    DrawText command,
    StringBuffer buffer, {
    Map<Type, CommandGenerator<PaintCommand>>? generators,
    PaletteResult? palette,
    Set<String>? activeFillProperties,
    Set<String>? activeStrokeProperties,
  }) {
    wrapWithTransform(buffer, command.transform, () {
      buffer.writeln('      {');
      buffer.writeln('        final TextSpan span = TextSpan(');
      buffer.writeln("          text: '''${command.text}''',");
      buffer.writeln('          style: TextStyle(');

      final PaintingFillStyle? fill = command.style.fill;
      if (fill != null && fill.colorArgb != null) {
        final double finalOpacity = ((fill.colorArgb! >> 24) & 0xFF) / 255.0 * fill.opacity;
        final int colorWithoutAlpha = fill.colorArgb! & 0x00FFFFFF;
        final String colorHex = colorWithoutAlpha.toRadixString(16).toUpperCase().padLeft(6, '0');
        buffer.writeln(
          '            color: const Color(0x${(finalOpacity * 255).round().toRadixString(16).toUpperCase().padLeft(2, '0')}$colorHex),',
        );
      }

      final PaintingTextStyle? textStyle = command.style.text;
      if (textStyle != null) {
        if (textStyle.fontSize != null) {
          buffer.writeln('            fontSize: ${textStyle.fontSize},');
        }

        if (textStyle.fontFamily != null) {
          buffer.writeln("            fontFamily: '${textStyle.fontFamily}',");
        }

        if (textStyle.fontWeight != null) {
          if (textStyle.fontWeight == 'bold') {
            buffer.writeln('            fontWeight: FontWeight.bold,');
          }
        }

        if (textStyle.fontStyle != null) {
          if (textStyle.fontStyle == 'italic') {
            buffer.writeln('            fontStyle: FontStyle.italic,');
          }
        }
      }

      buffer.writeln('          ),');
      buffer.writeln('        );');

      buffer.writeln('        final TextPainter tp = TextPainter(');
      buffer.writeln('          text: span,');
      buffer.writeln('          textDirection: TextDirection.ltr,');
      buffer.writeln('        );');
      buffer.writeln('        tp.layout();');
      buffer.writeln(
        '        tp.paint(canvas, Offset(${command.x}, ${command.y} - tp.computeDistanceToActualBaseline(TextBaseline.alphabetic)));',
      );
      buffer.writeln('      }');
    });
  }
}
