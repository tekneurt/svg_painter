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
      if (style.opacity < 1.0) {
        buffer.writeln('        paint.color = paint.color.withOpacity(${style.opacity});');
      }
      buffer.writeln('        paint.style = PaintingStyle.fill;');
      drawCall('paint');
      buffer.writeln('      }');
    } else if (style.fillColorArgb != null && style.fillColorArgb != 0) {
      buffer.writeln('      {');
      buffer.writeln('        final Paint paint = Paint();');
      final double finalOpacity =
          ((style.fillColorArgb! >> 24) & 0xFF) / 255.0 * style.opacity;
      final int colorWithoutAlpha = style.fillColorArgb! & 0x00FFFFFF;
      final String colorHex = colorWithoutAlpha.toRadixString(16).toUpperCase().padLeft(6, '0');
      buffer.writeln(
        '        paint.color = const Color(0x${(finalOpacity * 255).round().toRadixString(16).toUpperCase().padLeft(2, '0')}$colorHex);',
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
      if (style.opacity < 1.0) {
        buffer.writeln('        paint.color = paint.color.withOpacity(${style.opacity});');
      }
      buffer.writeln('        paint.style = PaintingStyle.stroke;');
      buffer.writeln('        paint.strokeWidth = ${style.strokeWidth};');
      if (style.strokeCap != StrokeCap.butt) {
        buffer.writeln('        paint.strokeCap = ${style.strokeCap.toFlutterString()};');
      }
      if (style.strokeJoin != StrokeJoin.miter) {
        buffer.writeln('        paint.strokeJoin = ${style.strokeJoin.toFlutterString()};');
      }
      drawCall('paint');
      buffer.writeln('      }');
    } else if (style.strokeColorArgb != null && style.strokeColorArgb != 0) {
      buffer.writeln('      {');
      buffer.writeln('        final Paint paint = Paint();');
      final double finalOpacity =
          ((style.strokeColorArgb! >> 24) & 0xFF) / 255.0 * style.opacity;
      final int colorWithoutAlpha = style.strokeColorArgb! & 0x00FFFFFF;
      final String colorHex = colorWithoutAlpha.toRadixString(16).toUpperCase().padLeft(6, '0');
      buffer.writeln(
        '        paint.color = const Color(0x${(finalOpacity * 255).round().toRadixString(16).toUpperCase().padLeft(2, '0')}$colorHex);',
      );
      buffer.writeln('        paint.style = PaintingStyle.stroke;');
      buffer.writeln('        paint.strokeWidth = ${style.strokeWidth};');
      if (style.strokeCap != StrokeCap.butt) {
        buffer.writeln('        paint.strokeCap = ${style.strokeCap.toFlutterString()};');
      }
      if (style.strokeJoin != StrokeJoin.miter) {
        buffer.writeln('        paint.strokeJoin = ${style.strokeJoin.toFlutterString()};');
      }
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

extension on StrokeCap {
  String toFlutterString() {
    return switch (this) {
      StrokeCap.butt => 'StrokeCap.butt',
      StrokeCap.round => 'StrokeCap.round',
      StrokeCap.square => 'StrokeCap.square',
    };
  }
}

extension on StrokeJoin {
  String toFlutterString() {
    return switch (this) {
      StrokeJoin.miter => 'StrokeJoin.miter',
      StrokeJoin.round => 'StrokeJoin.round',
      StrokeJoin.bevel => 'StrokeJoin.bevel',
    };
  }
}
