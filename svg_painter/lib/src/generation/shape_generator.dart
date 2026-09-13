
import '../painting_model/_painting_model.dart';
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
    void Function(String paintVar, {String? dashArray, String? pathLength, String? dashOffset}) drawCall, {
    void Function(String paintVar, {String? dashArray, String? pathLength, String? dashOffset})? drawStrokeCall,
    PaletteResult? palette,
    Map<String, String>? activeFillProperties,
    Map<String, String>? activeStrokeProperties,
    List<InheritedProperty>? inheritedFills,
    List<InheritedProperty>? inheritedStrokes,
  }) {
    void drawFill() {
      final PaintingFillStyle? fill = style.fill;
      if (fill != null) {
        // Logic to skip implicit fills for non-closed shapes.
        // SVG spec says they default to black, but in practice, users rarely want
        // an implicit black fill on a single straight line.
        // NOTE: We DO NOT skip for Polyline, as it is treated like a Path.
        final bool shouldDrawFill = fill.isExplicit || command is! DrawLine;

        if (shouldDrawFill) {
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
      }
    }

    void drawStroke() {
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
          drawCall: drawStrokeCall ?? drawCall,
        );
      }
    }

    if (style.paintOrder.isStrokeFirst) {
      drawStroke();
      drawFill();
    } else {
      drawFill();
      drawStroke();
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
    required void Function(String paintVar, {String? dashArray, String? pathLength, String? dashOffset}) drawCall,
  }) {
    buffer.writeBlock('{', () {
      buffer.writeln('final Paint paint = Paint();');

      final suffix = isFill ? 'Fill' : 'Stroke';
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
        final stroke = style as PaintingStrokeStyle;
        buffer.writeln('paint.strokeWidth = ${stroke.width};');
        if (stroke.miterLimit != 4.0) {
          buffer.writeln('paint.strokeMiterLimit = ${stroke.miterLimit};');
        }
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
          final pathLength = stroke.pathLength?.toString();
          final dashOffset = stroke.dashOffset?.toString();
          drawCall('paint', dashArray: 'dashArray', pathLength: pathLength, dashOffset: dashOffset);
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
    final suffix = isFill ? 'Fill' : 'Stroke';
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
          'paint.color = (color ?? const Color(0xFF000000)).withValues(alpha: ${style.opacity});',
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
      final shaderRect = style.shaderUnits == PaintingGradientUnits.userSpaceOnUse
          ? 'viewBoxRect'
          : boundsRect;
      buffer.writeln('paint.shader = _grad_${style.shaderId}.createShader($shaderRect);');
      if (style.opacity != 1.0) {
        buffer.writeln('paint.color = paint.color.withValues(alpha: ${style.opacity});');
      }
    }
  }

  /// Emits code to draw [pathVar] with stroke [paintVar], taking into account [PaintingStyle.vectorEffect].
  void emitDrawStrokePath(
    GeneratorBuffer buffer,
    String pathVar,
    String paintVar, {
    required PaintingStyle style,
  }) {
    if (style.vectorEffect == .nonScalingStroke) {
      buffer.writeln('final Matrix4 ctm = Matrix4.fromFloat64List(canvas.getTransform());');
      buffer.writeln('final Path nonScalingPath = $pathVar.transform(ctm.storage);');
      buffer.writeln('canvas.save();');
      buffer.writeln('canvas.transform(Matrix4.inverted(ctm).storage);');
      buffer.writeln('canvas.drawPath(nonScalingPath, $paintVar);');
      buffer.writeln('canvas.restore();');
    } else {
      buffer.writeln('canvas.drawPath($pathVar, $paintVar);');
    }
  }
}

class StyleResolution {
  const StyleResolution({this.localActiveProperty, this.inheritedPropertyName});

  final String? localActiveProperty;
  final String? inheritedPropertyName;
}
