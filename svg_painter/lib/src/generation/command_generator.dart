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
    void Function(String paintVar, {String? dashArray, String? pathLength}) drawCall,
  ) {
    // Fill
    if (style.fillShaderId != null) {
      buffer.writeln('      {');
      buffer.writeln('        final Paint paint = Paint();');
      buffer.writeln(
        '        paint.shader = _grad_${style.fillShaderId}.createShader($boundsRect);',
      );
      if (style.opacity < 1.0) {
        buffer.writeln('        paint.color = paint.color.withOpacity(${style.opacity});');
      }
      buffer.writeln('        paint.style = PaintingStyle.fill;');
      drawCall('paint');
      buffer.writeln('      }');
    } else if (style.fillColorArgb != null && style.fillColorArgb != 0) {
      buffer.writeln('      {');
      buffer.writeln('        final Paint paint = Paint();');
      final double finalOpacity = ((style.fillColorArgb! >> 24) & 0xFF) / 255.0 * style.opacity;
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
      buffer.writeln(
        '        paint.shader = _grad_${style.strokeShaderId}.createShader($boundsRect);',
      );
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
      if (style.strokeDashArray != null) {
        buffer.writeln(
          '        final List<double> dashArray = [${style.strokeDashArray!.join(', ')}];',
        );
        final String? pl = style.pathLength?.toString();
        drawCall('paint', dashArray: 'dashArray', pathLength: pl);
      } else {
        drawCall('paint');
      }
      buffer.writeln('      }');
    } else if (style.strokeColorArgb != null && style.strokeColorArgb != 0) {
      buffer.writeln('      {');
      buffer.writeln('        final Paint paint = Paint();');
      final double finalOpacity = ((style.strokeColorArgb! >> 24) & 0xFF) / 255.0 * style.opacity;
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
      if (style.strokeDashArray != null) {
        buffer.writeln(
          '        final List<double> dashArray = [${style.strokeDashArray!.join(', ')}];',
        );
        final String? pl = style.pathLength?.toString();
        drawCall('paint', dashArray: 'dashArray', pathLength: pl);
      } else {
        drawCall('paint');
      }
      buffer.writeln('      }');
    }
  }

  /// Helper to wrap a block of code with a transform if present.
  void wrapWithTransform(StringBuffer buffer, String? transformValue, void Function() body) {
    if (transformValue == null || transformValue.trim().isEmpty) {
      buffer.writeln('    {');
      body();
      buffer.writeln('    }');
      return;
    }

    final List<String> transforms = <String>[];

    // Simple parser for functional notation: type(params)
    final RegExp transformReg = RegExp(r'(\w+)\s*\(([^)]+)\)');
    final Iterable<Match> matches = transformReg.allMatches(transformValue);

    for (final Match match in matches) {
      final String type = match.group(1)!;
      final String paramsStr = match.group(2)!;
      final List<double> params = paramsStr
          .split(RegExp(r'[\s,]+'))
          .where((String s) => s.isNotEmpty)
          .map((String s) => double.tryParse(s) ?? 0.0)
          .toList();

      if (params.isEmpty) {
        continue;
      }

      switch (type) {
        case 'translate':
          final double tx = params[0];
          final double ty = params.length > 1 ? params[1] : 0.0;
          transforms.add('canvas.translate($tx, $ty);');
        case 'rotate':
          final double angle = params[0];
          final double radians = angle * 0.017453292519943295;
          if (params.length == 3) {
            final double cx = params[1];
            final double cy = params[2];
            transforms.add('canvas.translate($cx, $cy);');
            transforms.add('canvas.rotate($radians);');
            transforms.add('canvas.translate(${-cx}, ${-cy});');
          } else {
            transforms.add('canvas.rotate($radians);');
          }
        case 'scale':
          final double sx = params[0];
          final double sy = params.length > 1 ? params[1] : sx;
          transforms.add('canvas.scale($sx, $sy);');
        // TODO(Gemini): Support 'matrix', 'skewX', 'skewY'.
      }
    }

    if (transforms.isNotEmpty) {
      buffer.writeln('    canvas.save();');
      for (final String t in transforms) {
        buffer.writeln('    $t');
      }
    } else {
      buffer.writeln('    {');
    }

    body();

    if (transforms.isNotEmpty) {
      buffer.writeln('    canvas.restore();');
    } else {
      buffer.writeln('    }');
    }
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
