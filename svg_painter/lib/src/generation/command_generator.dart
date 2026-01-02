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
    // 1. Fill
    final PaintingFillStyle? fill = style.fill;
    if (fill != null) {
      buffer.writeln('      {');
      buffer.writeln('        final Paint paint = Paint();');
      if (fill.shaderId != null) {
        buffer.writeln(
          '        paint.shader = _grad_${fill.shaderId}.createShader($boundsRect);',
        );
        if (fill.opacity < 1.0) {
          buffer.writeln('        paint.color = paint.color.withOpacity(${fill.opacity});');
        }
      } else if (fill.colorArgb != null) {
        final double finalOpacity = ((fill.colorArgb! >> 24) & 0xFF) / 255.0 * fill.opacity;
        final int colorWithoutAlpha = fill.colorArgb! & 0x00FFFFFF;
        final String colorHex = colorWithoutAlpha.toRadixString(16).toUpperCase().padLeft(6, '0');
        buffer.writeln(
          '        paint.color = const Color(0x${(finalOpacity * 255).round().toRadixString(16).toUpperCase().padLeft(2, '0')}$colorHex);',
        );
      }
      buffer.writeln('        paint.style = PaintingStyle.fill;');
      drawCall('paint');
      buffer.writeln('      }');
    }

    // 2. Stroke
    final PaintingStrokeStyle? stroke = style.stroke;
    if (stroke != null) {
      buffer.writeln('      {');
      buffer.writeln('        final Paint paint = Paint();');
      if (stroke.shaderId != null) {
        buffer.writeln(
          '        paint.shader = _grad_${stroke.shaderId}.createShader($boundsRect);',
        );
        if (stroke.opacity < 1.0) {
          buffer.writeln('        paint.color = paint.color.withOpacity(${stroke.opacity});');
        }
      } else if (stroke.colorArgb != null) {
        final double finalOpacity = ((stroke.colorArgb! >> 24) & 0xFF) / 255.0 * stroke.opacity;
        final int colorWithoutAlpha = stroke.colorArgb! & 0x00FFFFFF;
        final String colorHex = colorWithoutAlpha.toRadixString(16).toUpperCase().padLeft(6, '0');
        buffer.writeln(
          '        paint.color = const Color(0x${(finalOpacity * 255).round().toRadixString(16).toUpperCase().padLeft(2, '0')}$colorHex);',
        );
      }

      buffer.writeln('        paint.style = PaintingStyle.stroke;');
      buffer.writeln('        paint.strokeWidth = ${stroke.width};');
      if (stroke.cap != PaintingStrokeCap.butt) {
        buffer.writeln('        paint.strokeCap = ${stroke.cap.toFlutterString()};');
      }
      if (stroke.join != PaintingStrokeJoin.miter) {
        buffer.writeln('        paint.strokeJoin = ${stroke.join.toFlutterString()};');
      }

      if (stroke.dashArray != null) {
        buffer.writeln(
          '        final List<double> dashArray = [${stroke.dashArray!.join(', ')}];',
        );
        final String? pl = stroke.pathLength?.toString();
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

extension on PaintingStrokeCap {
  String toFlutterString() {
    return switch (this) {
      .butt => 'StrokeCap.butt',
      .round => 'StrokeCap.round',
      .square => 'StrokeCap.square',
    };
  }
}

extension on PaintingStrokeJoin {
  String toFlutterString() {
    return switch (this) {
      .miter => 'StrokeJoin.miter',
      .round => 'StrokeJoin.round',
      .bevel => 'StrokeJoin.bevel',
    };
  }
}
