import '../../painting_model/_painting_model.dart';
import '../command_generator.dart';
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
  }) {
    wrapWithTransform(buffer, command.style.transformAttributes, () {
      final String bounds = 'Rect.fromLTWH(${command.x}, ${command.y}, 100, 100)'; // Approximation
      generatePaintingCode(
        buffer,
        command,
        command.style,
        bounds,
        (String p, {String? dashArray, String? pathLength}) {
          final PaintingTextStyle? textStyle = command.style.text;
          buffer.writeBlock('{', () {
            buffer.writeln('final TextPainter tp = TextPainter(');
            buffer.indent();
            buffer.writeBlock('text: TextSpan(', () {
              buffer.writeln("text: '${command.text.replaceAll("'", r"\'")}',");
              buffer.writeBlock('style: TextStyle(', () {
                buffer.writeln('foreground: $p,');
                if (textStyle != null) {
                  buffer.writeln('fontSize: ${textStyle.fontSize},');
                  buffer.writeln(
                    "fontWeight: ${textStyle.fontWeight == 'bold' ? 'FontWeight.bold' : 'FontWeight.normal'},",
                  );
                  buffer.writeln(
                    "fontStyle: ${textStyle.fontStyle == 'italic' ? 'FontStyle.italic' : 'FontStyle.normal'},",
                  );
                  buffer.writeln("fontFamily: '${textStyle.fontFamily}',");
                }
              }, footer: '),');
            }, footer: '),');
            buffer.writeln('textDirection: TextDirection.ltr,');
            buffer.outdent();
            buffer.writeln(')..layout();');
            buffer.writeln(
              'tp.paint(canvas, const Offset(${command.x}, ${command.y} - tp.ascent));',
            );
          });
        },
        palette: palette,
        activeFillProperties: activeFillProperties,
        activeStrokeProperties: activeStrokeProperties,
        inheritedFills: inheritedFills,
        inheritedStrokes: inheritedStrokes,
      );
    });
  }
}
