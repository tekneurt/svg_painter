import 'dart:math' as math;

import '../painting_model/_painting_model.dart';
import '../svg_model/_svg_model.dart';
import 'command_generator.dart';
import 'flutter_color_map.dart';
import 'generation_extensions.dart';
import 'generator_buffer.dart';
import 'models.dart';
import 'palette_analyzer.dart';
import 'svg_id_formatter.dart';

/// Base class for generators that produce drawing commands (shapes).
abstract class ShapeGenerator<T extends PaintCommand> extends CommandGenerator<T> {
  const ShapeGenerator();

  /// Helper to generate painting logic (Fill and Stroke) for a shape.
  void generatePaintingCode(
    GeneratorBuffer buffer,
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
    if (fill != null) {
      _generateStyleBlock(
        buffer: buffer,
        command: command,
        style: fill,
        boundsRect: boundsRect,
        isFill: true,
        palette: palette,
        activeProperties: activeFillProperties,
        inheritedProperties: inheritedFills,
        drawCall: drawCall,
      );
    }

    // 2. Stroke
    final PaintingStrokeStyle? stroke = style.stroke;
    if (stroke != null) {
      _generateStyleBlock(
        buffer: buffer,
        command: command,
        style: stroke,
        boundsRect: boundsRect,
        isFill: false,
        palette: palette,
        activeProperties: activeStrokeProperties,
        inheritedProperties: inheritedStrokes,
        drawCall: drawCall,
      );
    }
  }

  void _generateStyleBlock({
    required GeneratorBuffer buffer,
    required T command,
    required PaintingPaintStyle style,
    required String boundsRect,
    required bool isFill,
    required PaletteResult? palette,
    required Map<String, String>? activeProperties,
    required List<InheritedProperty>? inheritedProperties,
    required void Function(String paintVar, {String? dashArray, String? pathLength}) drawCall,
  }) {
    buffer.writeBlock('{', () {
      buffer.writeln('final Paint paint = Paint();');

      final String suffix = isFill ? 'Fill' : 'Stroke';
      final StyleResolution resolution = _resolveStyle(
        command: command,
        style: style,
        isFill: isFill,
        palette: palette,
        activeProperties: activeProperties,
        inheritedProperties: inheritedProperties,
      );

      _emitStyleEmission(
        buffer: buffer,
        style: style,
        resolution: resolution,
        boundsRect: boundsRect,
        suffix: suffix,
      );

      buffer.writeln('paint.style = PaintingStyle.${isFill ? 'fill' : 'stroke'};');

      if (!isFill) {
        final PaintingStrokeStyle stroke = style as PaintingStrokeStyle;
        buffer.writeln('paint.strokeWidth = ${stroke.width};');
        if (stroke.cap != PaintingStrokeCap.butt) {
          buffer.writeln('paint.strokeCap = ${stroke.cap.toFlutterString()};');
        }
        if (stroke.join != PaintingStrokeJoin.miter) {
          buffer.writeln('paint.strokeJoin = ${stroke.join.toFlutterString()};');
        }

        final List<double>? dashArray = stroke.dashArray;
        if (dashArray == null) {
          drawCall('paint');
        } else {
          buffer.writeln('final List<double> dashArray = [${dashArray.join(', ')}];');
          final String? pathLength = stroke.pathLength?.toString();
          drawCall('paint', dashArray: 'dashArray', pathLength: pathLength);
        }
      } else {
        drawCall('paint');
      }
    });
  }

  StyleResolution _resolveStyle({
    required T command,
    required PaintingPaintStyle style,
    required bool isFill,
    required PaletteResult? palette,
    required Map<String, String>? activeProperties,
    required List<InheritedProperty>? inheritedProperties,
  }) {
    final String suffix = isFill ? 'Fill' : 'Stroke';
    final String? id = command.id;
    final String? propName = id == null ? null : '${SvgIdFormatter.format(id)}$suffix';
    final String? assignedProp = isFill
        ? palette?.fillAssignments[command]
        : palette?.strokeAssignments[command];

    String? localActiveProperty;
    if (propName != null &&
        style.isExplicit &&
        activeProperties != null &&
        activeProperties.containsKey(propName)) {
      localActiveProperty = activeProperties[propName];
    } else if (assignedProp != null &&
        activeProperties != null &&
        activeProperties.containsKey(assignedProp)) {
      localActiveProperty = activeProperties[assignedProp];
    }

    String? inheritedPropertyName;
    if (!style.isExplicit && inheritedProperties != null) {
      for (final InheritedProperty prop in inheritedProperties.reversed) {
        if (style.shaderId != null && prop.shaderId == style.shaderId) {
          inheritedPropertyName = prop.propertyName;
          break;
        } else if (style.colorArgb != null && prop.colorArgb == style.colorArgb) {
          inheritedPropertyName = prop.propertyName;
          break;
        }
      }
    }

    return StyleResolution(
      localActiveProperty: localActiveProperty,
      inheritedPropertyName: inheritedPropertyName,
    );
  }

  void _emitStyleEmission({
    required GeneratorBuffer buffer,
    required PaintingPaintStyle style,
    required StyleResolution resolution,
    required String boundsRect,
    required String suffix,
  }) {
    if (resolution.localActiveProperty != null) {
      buffer.writeln('final Object? local$suffix = ${resolution.localActiveProperty};');
      buffer.writeBlock('if (local$suffix == null) {', () {
        _emitInheritedOrOriginal(
          buffer: buffer,
          style: style,
          resolution: resolution,
          boundsRect: boundsRect,
          suffix: suffix,
        );
      });
      buffer.writeBlock('else {', () {
        buffer.writeln('_applyOverride(paint, local$suffix);');
      });
    } else {
      _emitInheritedOrOriginal(
        buffer: buffer,
        style: style,
        resolution: resolution,
        boundsRect: boundsRect,
        suffix: suffix,
      );
    }
  }

  void _emitInheritedOrOriginal({
    required GeneratorBuffer buffer,
    required PaintingPaintStyle style,
    required StyleResolution resolution,
    required String boundsRect,
    required String suffix,
  }) {
    if (resolution.inheritedPropertyName != null) {
      buffer.writeln('final Object? inherited$suffix = ${resolution.inheritedPropertyName};');
      buffer.writeBlock('if (inherited$suffix == null) {', () {
        _generateOriginalStyle(buffer, style, boundsRect);
      });
      buffer.writeBlock('else {', () {
        buffer.writeln('_applyOverride(paint, inherited$suffix);');
      });
    } else {
      _generateOriginalStyle(buffer, style, boundsRect);
    }
  }

  void _generateOriginalStyle(GeneratorBuffer buffer, PaintingPaintStyle style, String boundsRect) {
    if (style.isCurrentColor) {
      if (style.opacity == 1.0) {
        buffer.writeln('paint.color = color ?? const Color(0xFF000000);');
      } else {
        buffer.writeln(
          'paint.color = (color ?? const Color(0xFF000000)).withOpacity(${style.opacity});',
        );
      }
    } else if (style.shaderId == null) {
      final int? argb = style.colorArgb;
      if (argb != null) {
        final double finalOpacity = ((argb >> 24) & 0xFF) / 255.0 * style.opacity;
        final int alpha = (finalOpacity * 255).round().clamp(0, 255);
        final int colorWithOpacity = (argb & 0x00FFFFFF) | (alpha << 24);
        final String colorCode = FlutterColorMap.getColorCode(colorWithOpacity);
        buffer.writeln('paint.color = $colorCode;');
      }
    } else {
      buffer.writeln('paint.shader = _grad_${style.shaderId}.createShader($boundsRect);');
      if (style.opacity != 1.0) {
        buffer.writeln('paint.color = paint.color.withOpacity(${style.opacity});');
      }
    }
  }

  /// Helper to wrap a block of code with a transform if present.
  void wrapWithTransform(
    GeneratorBuffer buffer,
    SvgTransformAttributes? transformAttributes,
    void Function() body,
  ) {
    if (transformAttributes == null || transformAttributes.operations.isEmpty) {
      body();
      return;
    }

    buffer.writeln('canvas.save();');

    for (final SvgTransformOperation op in transformAttributes.operations) {
      switch (op) {
        case SvgTranslate(:final double x, :final double y):
          buffer.writeln('canvas.translate($x, $y);');
        case SvgRotate(:final double angle, :final double? cx, :final double? cy):
          final double radians = angle * 0.017453292519943295;
          if (cx != null && cy != null) {
            buffer.writeln('canvas.translate($cx, $cy);');
            buffer.writeln('canvas.rotate($radians);');
            buffer.writeln('canvas.translate(${-cx}, ${-cy});');
          } else {
            buffer.writeln('canvas.rotate($radians);');
          }
        case SvgScale(:final double x, :final double y):
          buffer.writeln('canvas.scale($x, $y);');
        case SvgMatrix(
          :final double a,
          :final double b,
          :final double c,
          :final double d,
          :final double e,
          :final double f,
        ):
          // Matrix4.fromList takes column-major order (Flutter/OpenGL style).
          // SVG matrix(a, b, c, d, e, f) corresponds to:
          // | a c e |
          // | b d f |
          // | 0 0 1 |
          //
          // Flutter Matrix4 is 4x4 column-major:
          // | 0 4 8  12 |   | a c 0 e |
          // | 1 5 9  13 | = | b d 0 f |
          // | 2 6 10 14 |   | 0 0 1 0 |
          // | 3 7 11 15 |   | 0 0 0 1 |
          buffer.writeln(
            'canvas.transform(Matrix4.fromList(<double>[$a, $b, 0, 0, $c, $d, 0, 0, 0, 0, 1, 0, $e, $f, 0, 1]).storage);',
          );
        case SvgSkewX(:final double angle):
          final double tan = angle == 0.0 ? 0.0 : math.tan(angle * (math.pi / 180.0));
          buffer.writeln('canvas.skew($tan, 0.0);');
        case SvgSkewY(:final double angle):
          final double tan = angle == 0.0 ? 0.0 : math.tan(angle * (math.pi / 180.0));
          buffer.writeln('canvas.skew(0.0, $tan);');
      }
    }

    body();
    buffer.writeln('canvas.restore();');
  }
}

class StyleResolution {
  const StyleResolution({this.localActiveProperty, this.inheritedPropertyName});

  final String? localActiveProperty;
  final String? inheritedPropertyName;
}
