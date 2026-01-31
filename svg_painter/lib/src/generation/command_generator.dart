import '../painting_model/_painting_model.dart';
import 'flutter_color_map.dart';
import 'generation_extensions.dart';
import 'palette_analyzer.dart';
import 'svg_id_formatter.dart';

class InheritedProperty {
  const InheritedProperty(this.propertyName, this.value);
  final String propertyName;
  final int value;
}

/// Base class for all command-specific code generators.
abstract class CommandGenerator<T extends PaintCommand> {
  const CommandGenerator();

  /// Generates the Dart code for the given [command] and appends it to the [buffer].
  void generate(
    T command,
    StringBuffer buffer, {
    Map<Type, CommandGenerator<PaintCommand>>? generators,
    PaletteResult? palette,
    Map<String, String>? activeFillProperties,
    Map<String, String>? activeStrokeProperties,
    List<InheritedProperty>? inheritedFills,
    List<InheritedProperty>? inheritedStrokes,
  });
}

/// Base class for generators that produce drawing commands (shapes).
abstract class ShapeGenerator<T extends PaintCommand> extends CommandGenerator<T> {
  const ShapeGenerator();

  /// Helper to generate painting logic (Fill and Stroke) for a shape.
  void generatePaintingCode(
    StringBuffer buffer,
    T command,
    PaintingStyle style,
    String boundsRect,
    void Function(String paintVar, {String? dashArray, String? pathLength}) drawCall, {
    PaletteResult? palette,
    Map<String, String>? activeFillProperties,
    Map<String, String>? activeStrokeProperties,
    List<InheritedProperty>? inheritedFills,
    List<InheritedProperty>? inheritedStrokes,
  }) {
    // 1. Fill
    final PaintingFillStyle? fill = style.fill;
    if (fill == null) {
      // No fill
    } else {
      buffer.writeln('      {');
      buffer.writeln('        final Paint paint = Paint();');

      final String? id = command.id;
      final String? propName = id == null ? null : '${SvgIdFormatter.format(id)}Fill';
      final String? assignedFill = palette?.fillAssignments[command];

      String? activeProperty;
      if (propName != null &&
          fill.isExplicit &&
          activeFillProperties != null &&
          activeFillProperties.containsKey(propName)) {
        activeProperty = activeFillProperties[propName];
      } else if (assignedFill != null &&
          activeFillProperties != null &&
          activeFillProperties.containsKey(assignedFill)) {
        activeProperty = activeFillProperties[assignedFill];
      }

      if (activeProperty == null) {
        String? inheritedOverride;
        if (!fill.isExplicit && inheritedFills != null) {
          for (final InheritedProperty prop in inheritedFills.reversed) {
            if (prop.value == fill.colorArgb) {
              inheritedOverride = prop.propertyName;
              break;
            }
          }
        }

        if (inheritedOverride == null) {
          _generateOriginalFill(buffer, fill, boundsRect, indent: '        ');
        } else {
          buffer.writeln('        final Color? inheritedFill = $inheritedOverride;');
          buffer.writeln('        if (inheritedFill == null) {');
          _generateOriginalFill(buffer, fill, boundsRect, indent: '          ');
          buffer.writeln('        } else {');
          buffer.writeln('          paint.color = inheritedFill;');
          buffer.writeln('        }');
        }
      } else {
        // TODO(Gemini): Support both single color and gradient overrides.
        buffer.writeln('        final Color? localFill = $activeProperty;');
        buffer.writeln('        if (localFill == null) {');
        _generateOriginalFill(buffer, fill, boundsRect, indent: '          ');
        buffer.writeln('        } else {');
        buffer.writeln('          paint.color = localFill;');
        buffer.writeln('        }');
      }

      buffer.writeln('        paint.style = PaintingStyle.fill;');
      drawCall('paint');
      buffer.writeln('      }');
    }

    // 2. Stroke
    final PaintingStrokeStyle? stroke = style.stroke;
    if (stroke == null) {
      // No stroke
    } else {
      buffer.writeln('      {');
      buffer.writeln('        final Paint paint = Paint();');

      final String? id = command.id;
      final String? propName = id == null ? null : '${SvgIdFormatter.format(id)}Stroke';
      final String? assignedStroke = palette?.strokeAssignments[command];

      String? activeProperty;
      if (propName != null &&
          stroke.isExplicit &&
          activeStrokeProperties != null &&
          activeStrokeProperties.containsKey(propName)) {
        activeProperty = activeStrokeProperties[propName];
      } else if (assignedStroke != null &&
          activeStrokeProperties != null &&
          activeStrokeProperties.containsKey(assignedStroke)) {
        activeProperty = activeStrokeProperties[assignedStroke];
      }

      if (activeProperty == null) {
        String? inheritedOverride;
        if (!stroke.isExplicit && inheritedStrokes != null) {
          for (final InheritedProperty prop in inheritedStrokes.reversed) {
            if (prop.value == stroke.colorArgb) {
              inheritedOverride = prop.propertyName;
              break;
            }
          }
        }

        if (inheritedOverride == null) {
          _generateOriginalStroke(buffer, stroke, boundsRect, indent: '        ');
        } else {
          buffer.writeln('        final Color? inheritedStroke = $inheritedOverride;');
          buffer.writeln('        if (inheritedStroke == null) {');
          _generateOriginalStroke(buffer, stroke, boundsRect, indent: '          ');
          buffer.writeln('        } else {');
          buffer.writeln('          paint.color = inheritedStroke;');
          buffer.writeln('        }');
        }
      } else {
        // TODO(Gemini): Support both single color and gradient overrides.
        buffer.writeln('        final Color? localStroke = $activeProperty;');
        buffer.writeln('        if (localStroke == null) {');
        _generateOriginalStroke(buffer, stroke, boundsRect, indent: '          ');
        buffer.writeln('        } else {');
        buffer.writeln('          paint.color = localStroke;');
        buffer.writeln('        }');
      }

      buffer.writeln('        paint.style = PaintingStyle.stroke;');
      buffer.writeln('        paint.strokeWidth = ${stroke.width};');
      if (stroke.cap == PaintingStrokeCap.butt) {
        // Default cap
      } else {
        buffer.writeln('        paint.strokeCap = ${stroke.cap.toFlutterString()};');
      }
      if (stroke.join == PaintingStrokeJoin.miter) {
        // Default join
      } else {
        buffer.writeln('        paint.strokeJoin = ${stroke.join.toFlutterString()};');
      }

      if (stroke.dashArray == null) {
        drawCall('paint');
      } else {
        buffer.writeln('        final List<double> dashArray = [${stroke.dashArray!.join(', ')}];');
        final String? pl = stroke.pathLength?.toString();
        drawCall('paint', dashArray: 'dashArray', pathLength: pl);
      }
      buffer.writeln('      }');
    }
  }

  void _generateOriginalStroke(
    StringBuffer buffer,
    PaintingStrokeStyle stroke,
    String boundsRect, {
    required String indent,
  }) {
    if (stroke.isCurrentColor) {
      if (stroke.opacity == 1.0) {
        buffer.writeln('$indent paint.color = color ?? const Color(0xFF000000);');
      } else {
        buffer.writeln(
          '$indent paint.color = (color ?? const Color(0xFF000000)).withOpacity(${stroke.opacity});',
        );
      }
    } else if (stroke.shaderId == null) {
      if (stroke.colorArgb == null) {
        // No color or shader
      } else {
        final double finalOpacity = ((stroke.colorArgb! >> 24) & 0xFF) / 255.0 * stroke.opacity;
        final int alpha = (finalOpacity * 255).round().clamp(0, 255);
        final int colorWithOpacity = (stroke.colorArgb! & 0x00FFFFFF) | (alpha << 24);
        final String colorCode = FlutterColorMap.getColorCode(colorWithOpacity);
        buffer.writeln('$indent paint.color = $colorCode;');
      }
    } else {
      buffer.writeln('$indent paint.shader = _grad_${stroke.shaderId}.createShader($boundsRect);');
      if (stroke.opacity == 1.0) {
        // Full opacity
      } else {
        buffer.writeln('$indent paint.color = paint.color.withOpacity(${stroke.opacity});');
      }
    }
  }

  void _generateOriginalFill(
    StringBuffer buffer,
    PaintingFillStyle fill,
    String boundsRect, {
    required String indent,
  }) {
    if (fill.isCurrentColor) {
      if (fill.opacity == 1.0) {
        buffer.writeln('$indent paint.color = color ?? const Color(0xFF000000);');
      } else {
        buffer.writeln(
          '$indent paint.color = (color ?? const Color(0xFF000000)).withOpacity(${fill.opacity});',
        );
      }
    } else if (fill.shaderId == null) {
      if (fill.colorArgb == null) {
        // No color or shader
      } else {
        final double finalOpacity = ((fill.colorArgb! >> 24) & 0xFF) / 255.0 * fill.opacity;
        final int alpha = (finalOpacity * 255).round().clamp(0, 255);
        final int colorWithOpacity = (fill.colorArgb! & 0x00FFFFFF) | (alpha << 24);
        final String colorCode = FlutterColorMap.getColorCode(colorWithOpacity);
        buffer.writeln('$indent paint.color = $colorCode;');
      }
    } else {
      buffer.writeln('$indent paint.shader = _grad_${fill.shaderId}.createShader($boundsRect);');
      if (fill.opacity == 1.0) {
        // Full opacity
      } else {
        buffer.writeln('$indent paint.color = paint.color.withOpacity(${fill.opacity});');
      }
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
