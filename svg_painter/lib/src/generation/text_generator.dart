import '../painting_model/_painting_model.dart';
import 'command_generator.dart';

/// Generator for [DrawText] commands.
class TextGenerator extends ShapeGenerator<DrawText> {
  const TextGenerator();

  @override
  void generate(
    DrawText command,
    StringBuffer buffer, {
    Map<Type, CommandGenerator<PaintCommand>>? generators,
  }) {
    wrapWithTransform(buffer, command.transform, () {
      buffer.writeln('      {');
      buffer.writeln('        final TextSpan span = TextSpan(');
      buffer.writeln("          text: '''${command.text}''',");
      buffer.writeln('          style: TextStyle(');

      if (command.style.fillColorArgb != null) {
        final double finalOpacity =
            ((command.style.fillColorArgb! >> 24) & 0xFF) / 255.0 * command.style.opacity;
        final int colorWithoutAlpha = command.style.fillColorArgb! & 0x00FFFFFF;
        final String colorHex = colorWithoutAlpha.toRadixString(16).toUpperCase().padLeft(6, '0');
        buffer.writeln(
          '            color: const Color(0x${(finalOpacity * 255).round().toRadixString(16).toUpperCase().padLeft(2, '0')}$colorHex),',
        );
      }

      if (command.style.fontSize != null) {
        buffer.writeln('            fontSize: ${command.style.fontSize},');
      }

      if (command.style.fontFamily != null) {
        buffer.writeln("            fontFamily: '${command.style.fontFamily}',");
      }

      if (command.style.fontWeight != null) {
        // Simple mapping for now
        if (command.style.fontWeight == 'bold') {
          buffer.writeln('            fontWeight: FontWeight.bold,');
        } else {
          // TODO(Gemini): Handle numeric weights
        }
      }

      if (command.style.fontStyle != null) {
        if (command.style.fontStyle == 'italic') {
          buffer.writeln('            fontStyle: FontStyle.italic,');
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
