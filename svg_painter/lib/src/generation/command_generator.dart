import '../painting_model/_painting_model.dart';

/// Base class for all command-specific code generators.
abstract class CommandGenerator<T extends PaintCommand> {
  const CommandGenerator();

  /// Generates the Dart code for the given [command] and appends it to the [buffer].
  void generate(
    T command,
    StringBuffer buffer, {
    Map<Type, CommandGenerator<PaintCommand>>? generators,
  });
}

/// Base class for generators that produce drawing commands (shapes).
abstract class ShapeGenerator<T extends PaintCommand> extends CommandGenerator<T> {
  const ShapeGenerator();

  /// Helper to generate painting logic (Fill and Stroke) for a shape.
  void generatePaintingCode(
    StringBuffer buffer,
    PaintingStyle style,
    String boundsRect,
    void Function(String paintVar) drawCall,
  ) {
    // Fill
    if (style.fillShaderId != null) {
      buffer.writeln('      {');
      buffer.writeln('        final Paint paint = Paint();');
      buffer.writeln('        paint.shader = _grad_${style.fillShaderId}.createShader($boundsRect);');
      buffer.writeln('        paint.style = PaintingStyle.fill;');
      drawCall('paint');
      buffer.writeln('      }');
    } else if (style.fillColorArgb != null && style.fillColorArgb != 0) {
      buffer.writeln('      {');
      buffer.writeln('        final Paint paint = Paint();');
      buffer.writeln(
        '        paint.color = const Color(0x${style.fillColorArgb!.toRadixString(16).toUpperCase()});',
      );
      buffer.writeln('        paint.style = PaintingStyle.fill;');
      drawCall('paint');
      buffer.writeln('      }');
    }

    // Stroke
    if (style.strokeShaderId != null) {
      buffer.writeln('      {');
      buffer.writeln('        final Paint paint = Paint();');
      buffer.writeln('        paint.shader = _grad_${style.strokeShaderId}.createShader($boundsRect);');
      buffer.writeln('        paint.style = PaintingStyle.stroke;');
      buffer.writeln('        paint.strokeWidth = ${style.strokeWidth};');
      drawCall('paint');
      buffer.writeln('      }');
    } else if (style.strokeColorArgb != null && style.strokeColorArgb != 0) {
      buffer.writeln('      {');
      buffer.writeln('        final Paint paint = Paint();');
      buffer.writeln(
        '        paint.color = const Color(0x${style.strokeColorArgb!.toRadixString(16).toUpperCase()});',
      );
      buffer.writeln('        paint.style = PaintingStyle.stroke;');
      buffer.writeln('        paint.strokeWidth = ${style.strokeWidth};');
      drawCall('paint');
      buffer.writeln('      }');
    }
  }

  /// Helper to wrap a block of code with a transform if present.
  void wrapWithTransform(StringBuffer buffer, String? transformValue, void Function() body) {
    String? tBegin;
    String? tEnd;

    if (transformValue != null) {
      final RegExp reg = RegExp(r'translate(\s*([\d.-]+)\s*(?:[\s,]?\s*([\d.-]+))?)\s*');
      final Match? match = reg.firstMatch(transformValue);
      if (match != null) {
        final String tx = match.group(1)!;
        final String ty = match.group(2) ?? '0';
        tBegin = '      canvas.save();\n      canvas.translate($tx, $ty);';
        tEnd = '      canvas.restore();';
      }
    }

    buffer.writeln('    {');
    if (tBegin != null) {
      buffer.writeln(tBegin);
    }
    body();
    if (tEnd != null) {
      buffer.writeln(tEnd);
    }
    buffer.writeln('    }');
  }
}
