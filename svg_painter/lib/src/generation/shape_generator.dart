import 'package:svg_painter_annotation/svg_painter_annotation.dart';

import '../painting_model/_painting_model.dart';
import '../svg_model/svg_value.dart';
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
    void Function(String paintVar, {String? dashArray, String? pathLength, String? dashOffset})
    drawCall, {
    void Function(String paintVar, {String? dashArray, String? pathLength, String? dashOffset})?
    drawStrokeCall,
    void Function(String? fillPaintVar, String? strokePaintVar)? drawMarkersCall,
    PaletteResult? palette,
    Map<String, String>? activeFillProperties,
    Map<String, String>? activeStrokeProperties,
    List<InheritedProperty>? inheritedFills,
    List<InheritedProperty>? inheritedStrokes,
    SvgColorMapping colorMapping = SvgColorMapping.material,
    bool isInsideMarker = false,
  }) {
    if (style.hasMarkers) {
      buffer.writeBlock('{', () {
        final PaintingFillStyle? fill = style.fill;
        final bool hasFill = fill != null && (fill.isExplicit || command is! DrawLine);
        if (hasFill) {
          buffer.writeln('final Paint fillPaint = Paint();');
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
            colorMapping: colorMapping,
            paintVar: 'fillPaint',
            emitDeclaration: false,
            emitDrawCall: false,
            isInsideMarker: isInsideMarker,
          );
        }

        final PaintingStrokeStyle? stroke = style.stroke;
        final hasStroke = stroke != null;
        if (hasStroke) {
          buffer.writeln('final Paint strokePaint = Paint();');
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
            colorMapping: colorMapping,
            paintVar: 'strokePaint',
            emitDeclaration: false,
            emitDrawCall: false,
            isInsideMarker: isInsideMarker,
          );
        }

        for (final SvgPaintOrderComponent component in style.paintOrder.components) {
          switch (component) {
            case .fill:
              if (hasFill) {
                drawCall('fillPaint');
              }
            case .stroke:
              if (hasStroke) {
                final List<double>? dashArray = stroke.dashArray;
                if (dashArray == null) {
                  (drawStrokeCall ?? drawCall)('strokePaint');
                } else {
                  buffer.writeln('final List<double> dashArray = [${dashArray.join(', ')}];');
                  final pathLength = stroke.pathLength?.toString();
                  final dashOffset = stroke.dashOffset?.toString();
                  (drawStrokeCall ?? drawCall)(
                    'strokePaint',
                    dashArray: 'dashArray',
                    pathLength: pathLength,
                    dashOffset: dashOffset,
                  );
                }
              }
            case .markers:
              drawMarkersCall?.call(
                hasFill ? 'fillPaint' : null,
                hasStroke ? 'strokePaint' : null,
              );
          }
        }
      });
      return;
    }

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
            colorMapping: colorMapping,
            isInsideMarker: isInsideMarker,
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
          colorMapping: colorMapping,
          isInsideMarker: isInsideMarker,
        );
      }
    }

    for (final SvgPaintOrderComponent component in style.paintOrder.components) {
      switch (component) {
        case .fill:
          drawFill();
        case .stroke:
          drawStroke();
        case .markers:
          drawMarkersCall?.call(null, null);
      }
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
    required void Function(
      String paintVar, {
      String? dashArray,
      String? pathLength,
      String? dashOffset,
    })
    drawCall,
    required SvgColorMapping colorMapping,
    String paintVar = 'paint',
    bool emitDeclaration = true,
    bool emitDrawCall = true,
    bool isInsideMarker = false,
  }) {
    buffer.writeBlock('{', () {
      if (emitDeclaration) {
        buffer.writeln('final Paint $paintVar = Paint();');
      }

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
        palette: palette,
        colorMapping: colorMapping,
        paintVar: paintVar,
        isInsideMarker: isInsideMarker,
      );

      buffer.writeln('$paintVar.style = PaintingStyle.${isFill ? 'fill' : 'stroke'};');

      if (!isFill) {
        final stroke = style as PaintingStrokeStyle;
        buffer.writeln('$paintVar.strokeWidth = ${stroke.width};');
        if (stroke.miterLimit != 4.0) {
          buffer.writeln('$paintVar.strokeMiterLimit = ${stroke.miterLimit};');
        }
        if (stroke.cap != PaintingStrokeCap.butt) {
          buffer.writeln('$paintVar.strokeCap = ${stroke.cap.toFlutterString()};');
        }
        if (stroke.join != PaintingStrokeJoin.miter) {
          buffer.writeln('$paintVar.strokeJoin = ${stroke.join.toFlutterString()};');
        }

        if (emitDrawCall) {
          final List<double>? dashArray = stroke.dashArray;
          if (dashArray == null) {
            drawCall(paintVar);
          } else {
            buffer.writeln('final List<double> dashArray = [${dashArray.join(', ')}];');
            final pathLength = stroke.pathLength?.toString();
            final dashOffset = stroke.dashOffset?.toString();
            drawCall(
              paintVar,
              dashArray: 'dashArray',
              pathLength: pathLength,
              dashOffset: dashOffset,
            );
          }
        }
      } else if (emitDrawCall) {
        drawCall(paintVar);
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
    required PaletteResult? palette,
    required SvgColorMapping colorMapping,
    String paintVar = 'paint',
    bool isInsideMarker = false,
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
          palette: palette,
          colorMapping: colorMapping,
          paintVar: paintVar,
          isInsideMarker: isInsideMarker,
        );
      });
      buffer.writeBlock('else {', () {
        buffer.writeln('_applyOverride($paintVar, local$suffix);');
      });
    } else {
      _emitInheritedOrOriginal(
        buffer: buffer,
        style: style,
        resolution: resolution,
        boundsRect: boundsRect,
        suffix: suffix,
        palette: palette,
        colorMapping: colorMapping,
        paintVar: paintVar,
        isInsideMarker: isInsideMarker,
      );
    }
  }

  void _emitInheritedOrOriginal({
    required GeneratorBuffer buffer,
    required PaintingPaintStyle style,
    required StyleResolution resolution,
    required String boundsRect,
    required String suffix,
    required PaletteResult? palette,
    required SvgColorMapping colorMapping,
    String paintVar = 'paint',
    bool isInsideMarker = false,
  }) {
    if (resolution.inheritedPropertyName != null) {
      buffer.writeln('final Object? inherited$suffix = ${resolution.inheritedPropertyName};');
      buffer.writeBlock('if (inherited$suffix == null) {', () {
        _generateOriginalStyle(
          buffer,
          style,
          boundsRect,
          palette: palette,
          colorMapping: colorMapping,
          paintVar: paintVar,
          isInsideMarker: isInsideMarker,
        );
      });
      buffer.writeBlock('else {', () {
        buffer.writeln('_applyOverride($paintVar, inherited$suffix);');
      });
    } else {
      _generateOriginalStyle(
        buffer,
        style,
        boundsRect,
        palette: palette,
        colorMapping: colorMapping,
        paintVar: paintVar,
        isInsideMarker: isInsideMarker,
      );
    }
  }

  void _generateOriginalStyle(
    GeneratorBuffer buffer,
    PaintingPaintStyle style,
    String boundsRect, {
    PaletteResult? palette,
    SvgColorMapping colorMapping = SvgColorMapping.material,
    String paintVar = 'paint',
    bool isInsideMarker = false,
  }) {
    if (style.isContextFill) {
      if (isInsideMarker) {
        buffer.writeBlock('if (contextFill != null) {', () {
          buffer.writeln('$paintVar.color = contextFill.color;');
          buffer.writeln('$paintVar.shader = contextFill.shader;');
          if (style.opacity != 1.0) {
            buffer.writeln(
              '$paintVar.color = $paintVar.color.withValues(alpha: $paintVar.color.a * ${style.opacity});',
            );
          }
        });
        buffer.writeBlock('else {', () {
          buffer.writeln('$paintVar.color = const Color(0x00000000);');
        });
      } else {
        buffer.writeln('$paintVar.color = const Color(0x00000000);');
      }
    } else if (style.isContextStroke) {
      if (isInsideMarker) {
        buffer.writeBlock('if (contextStroke != null) {', () {
          buffer.writeln('$paintVar.color = contextStroke.color;');
          buffer.writeln('$paintVar.shader = contextStroke.shader;');
          if (style.opacity != 1.0) {
            buffer.writeln(
              '$paintVar.color = $paintVar.color.withValues(alpha: $paintVar.color.a * ${style.opacity});',
            );
          }
        });
        buffer.writeBlock('else {', () {
          buffer.writeln('$paintVar.color = const Color(0x00000000);');
        });
      } else {
        buffer.writeln('$paintVar.color = const Color(0x00000000);');
      }
    } else if (style.isCurrentColor) {
      if (style.opacity == 1.0) {
        buffer.writeln('$paintVar.color = color ?? const Color(0xFF000000);');
      } else {
        buffer.writeln(
          '$paintVar.color = (color ?? const Color(0xFF000000)).withValues(alpha: ${style.opacity});',
        );
      }
    } else if (style.patternId != null) {
      buffer.writeln('$paintVar.shader = _createPattern_${style.patternId}($boundsRect);');
      if (style.opacity != 1.0) {
        buffer.writeln('$paintVar.color = $paintVar.color.withValues(alpha: ${style.opacity});');
      }
    } else if (style.shaderId == null) {
      final int? argb = style.colorArgb;
      if (argb != null) {
        final double finalOpacity = ((argb >> 24) & 0xFF) / 255.0 * style.opacity;
        final int alpha = (finalOpacity * 255).round().clamp(0, 255);
        final int colorWithOpacity = (argb & 0x00FFFFFF) | (alpha << 24);
        final String colorCode = FlutterColorMap.getColorCode(
          colorWithOpacity,
          colorMapping: colorMapping,
        );

        final String? tokenName = palette?.colorTokens[argb];
        if (tokenName != null) {
          final localToken = 'local${tokenName[0].toUpperCase()}${tokenName.substring(1)}';
          buffer.writeln('final Color? $localToken = $tokenName;');
          buffer.writeBlock('if ($localToken == null) {', () {
            buffer.writeln('$paintVar.color = $colorCode;');
          });
          buffer.writeBlock('else {', () {
            if (style.opacity == 1.0) {
              buffer.writeln('$paintVar.color = $localToken;');
            } else {
              buffer.writeln('$paintVar.color = $localToken.withValues(alpha: ${style.opacity});');
            }
          });
        } else {
          buffer.writeln('$paintVar.color = $colorCode;');
        }
      }
    } else {
      final shaderRect = style.shaderUnits == PaintingGradientUnits.userSpaceOnUse
          ? 'viewBoxRect'
          : boundsRect;
      buffer.writeln('$paintVar.shader = _grad_${style.shaderId}.createShader($shaderRect);');
      if (style.opacity != 1.0) {
        buffer.writeln('$paintVar.color = $paintVar.color.withValues(alpha: ${style.opacity});');
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
