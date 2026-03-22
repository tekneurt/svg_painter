import 'dart:async';

import 'package:analyzer/dart/constant/value.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:meta/meta.dart';
import 'package:source_gen/source_gen.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';
import 'package:xml/xml.dart';

import 'base/_base.dart';
import 'generation/_generation.dart';
import 'painting_model/_painting_model.dart';
import 'svg_conversion/_svg_conversion.dart';
import 'svg_model/_svg_model.dart';
import 'xml_conversion/_xml_conversion.dart';
import 'xml_model/_xml_model.dart';

/// Generator that produces CustomPainter code from SVG files.
class SvgPainterGenerator extends GeneratorForAnnotation<SvgPainter> {
  const SvgPainterGenerator();

  @visibleForTesting
  static const TypeChecker fileChecker = TypeChecker.fromUrl(
    'package:svg_painter_annotation/src/svg_painter.dart#SvgFilePainter',
  );
  @visibleForTesting
  static const TypeChecker codeChecker = TypeChecker.fromUrl(
    'package:svg_painter_annotation/src/svg_painter.dart#SvgCodePainter',
  );

  static const Map<Type, CommandGenerator<PaintCommand>> _generators =
      <Type, CommandGenerator<PaintCommand>>{
        DrawCircle: CircleGenerator(),
        DrawOval: OvalGenerator(),
        DrawRect: RectGenerator(),
        DrawText: TextGenerator(),
        DrawGroup: GroupGenerator(),
        DrawPath: PathGenerator(),
        DrawLine: LineGenerator(),
        DrawPolyline: PolyGenerator<DrawPolyline>(),
        DrawPolygon: PolyGenerator<DrawPolygon>(),
        DefineLinearGradient: LinearGradientGenerator(),
        DefineRadialGradient: RadialGradientGenerator(),
      };

  @override
  FutureOr<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async {
    final Result<String> contentResult = await loadSvgContent(annotation, buildStep);

    final String svgContent = contentResult.fold(
      (Failure<String> failure) => throw InvalidGenerationSourceError(
        'Failed to load SVG content for ${element.name}: ${failure.message}',
        element: element,
      ),
      (String content) => content,
    );

    final String? painterClassName = annotation.read('painterClassName').isNull
        ? null
        : annotation.read('painterClassName').stringValue;

    final ConstantReader exposureReader = annotation.read('exposureMode');
    SvgExposureMode exposureMode = SvgExposureMode.none;
    if (!exposureReader.isNull) {
      final int? index = exposureReader.objectValue.getField('index')?.toIntValue();
      if (index != null && index >= 0 && index < SvgExposureMode.values.length) {
        exposureMode = SvgExposureMode.values[index];
      }
    }

    final propertyMapping = <String, String>{};
    if (annotation.read('propertyMapping').isNull) {
      // No mapping provided
    } else {
      final Map<DartObject?, DartObject?> map = annotation.read('propertyMapping').mapValue;
      for (final MapEntry<DartObject?, DartObject?> entry in map.entries) {
        final String? key = entry.key?.toStringValue();
        final String? value = entry.value?.toStringValue();
        if (key == null || value == null) {
          // Invalid mapping entry
        } else {
          propertyMapping[key] = value;
        }
      }
    }

    return generateFromSvg(
      elementName: element.name ?? 'Unknown',
      svgContent: svgContent,
      painterClassName: painterClassName,
      exposureMode: exposureMode,
      propertyMapping: propertyMapping,
    );
  }

  /// Generates the painter class from SVG content string.
  @visibleForTesting
  String generateFromSvg({
    required String elementName,
    required String svgContent,
    String? painterClassName,
    SvgExposureMode exposureMode = SvgExposureMode.none,
    Map<String, String> propertyMapping = const <String, String>{},
  }) {
    final Result<XmlDocument> parseResult = svgContent.toXmlDocument();

    final XmlDocument document = parseResult.fold(
      (Failure<XmlDocument> failure) => throw InvalidGenerationSourceError(
        'Invalid SVG content for $elementName: ${failure.message}',
      ),
      (XmlDocument doc) => doc,
    );

    final Iterable<XmlElement> svgElements = document.findAllElements(XmlElementName.svg.tagName);
    if (svgElements.isEmpty) {
      throw InvalidGenerationSourceError(
        'Invalid SVG content for $elementName: Could not find <svg> root element.',
      );
    }
    final XmlElement svgXmlElement = svgElements.first;

    final Result<SvgElement> mapResult = svgXmlElement.toSvgElement();

    final SvgElement svgRoot = mapResult.fold(
      (Failure<SvgElement> failure) => throw InvalidGenerationSourceError(
        'Failed to map SVG content for $elementName: ${failure.message}',
      ),
      (SvgElement value) => value,
    );

    if (svgRoot is SvgSvg) {
      var viewBoxWidth = 100.0;
      var viewBoxHeight = 100.0;

      if (svgRoot is SvgRoot) {
        final SvgLengthPercentageAuto? w = svgRoot.width;
        final SvgLength? wLen = w is SvgLength ? w : null;
        final SvgLengthPercentageAuto? h = svgRoot.height;
        final SvgLength? hLen = h is SvgLength ? h : null;

        viewBoxWidth = wLen?.toDouble() ?? svgRoot.viewBox?.width ?? 100.0;
        viewBoxHeight = hLen?.toDouble() ?? svgRoot.viewBox?.height ?? 100.0;
      }

      final Result<List<PaintCommand>> paintingResult = svgRoot.toPaintCommands();
      final List<PaintCommand> commands = paintingResult.fold(
        (Failure<List<PaintCommand>> failure) => throw InvalidGenerationSourceError(
          'Failed to convert SVG to painting commands for $elementName: ${failure.message}',
        ),
        (List<PaintCommand> value) => value,
      );

      final String className = painterClassName ?? r'_$' + elementName;

      return generatePainterClass(
        className: className,
        viewBoxWidth: viewBoxWidth,
        viewBoxHeight: viewBoxHeight,
        commands: commands,
        exposureMode: exposureMode,
        propertyMapping: propertyMapping,
      );
    } else {
      // coverage:ignore-start
      throw InvalidGenerationSourceError(
        'Root element must be <svg>, but found ${svgRoot.runtimeType}',
      );
      // coverage:ignore-end
    }
  }

  /// Generates the full CustomPainter class code.
  @visibleForTesting
  String generatePainterClass({
    required String className,
    required double viewBoxWidth,
    required double viewBoxHeight,
    required List<PaintCommand> commands,
    SvgExposureMode exposureMode = SvgExposureMode.none,
    Map<String, String> propertyMapping = const <String, String>{},
  }) {
    final buffer = GeneratorBuffer();

    // Header to ignore lints in generated code
    buffer.writeln('// coverage:ignore-file');
    buffer.writeln('// ignore_for_file: type=lint');
    buffer.writeln(
      '// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package',
    );
    buffer.writeln();

    final fillIds = <String>{};
    final strokeIds = <String>{};
    if (exposureMode == SvgExposureMode.id || exposureMode == SvgExposureMode.mixed) {
      _collectIds(commands, fillIds, strokeIds);
    }

    final PaletteResult? palette =
        (exposureMode == SvgExposureMode.indexed ||
                exposureMode == SvgExposureMode.mixed)
            ? const PaletteAnalyzer().analyze(commands, mode: exposureMode)
            : null;

    final Set<String> gradientsNeedingStretch =
        _findGradientsNeedingStretch(commands);

    final List<String> sortedFillIds = fillIds.toList()..sort();
    final List<String> sortedStrokeIds = strokeIds.toList()..sort();
    final List<String>? sortedFillIndexed =
        palette?.fillAssignments.values.toSet().toList()?..sort();
    final List<String>? sortedStrokeIndexed =
        palette?.strokeAssignments.values.toSet().toList()?..sort();

    String resolveName(String defaultName) =>
        propertyMapping[defaultName] ?? defaultName;

    final activeFillProperties = <String, String>{};
    for (final id in sortedFillIds) {
      final original = '${SvgIdFormatter.format(id)}Fill';
      activeFillProperties[original] = resolveName(original);
    }
    if (sortedFillIndexed != null) {
      for (final String name in sortedFillIndexed) {
        activeFillProperties[name] = resolveName(name);
      }
    }

    final activeStrokeProperties = <String, String>{};
    for (final id in sortedStrokeIds) {
      final original = '${SvgIdFormatter.format(id)}Stroke';
      activeStrokeProperties[original] = resolveName(original);
    }
    if (sortedStrokeIndexed != null) {
      for (final String name in sortedStrokeIndexed) {
        activeStrokeProperties[name] = resolveName(name);
      }
    }

    final bool hasCurrentColor = _hasCurrentColor(commands);

    // Generate the convenience Widget
    final String publicName =
        className.startsWith(r'_$') ? className.substring(2) : className;
    final widgetClassName = '${publicName}Widget';

    generateWidgetClass(
      buffer: buffer,
      widgetClassName: widgetClassName,
      painterClassName: className,
      activeFillProperties: activeFillProperties,
      activeStrokeProperties: activeStrokeProperties,
      viewBoxWidth: viewBoxWidth,
      viewBoxHeight: viewBoxHeight,
      hasCurrentColor: hasCurrentColor,
    );
    buffer.writeln();

    buffer.writeBlock('class $className extends CustomPainter {', () {
      buffer.writeBlock('const $className({', () {
        buffer.writeln('this.fit = BoxFit.contain,');
        if (hasCurrentColor) {
          buffer.writeln('this.color,');
        }
        for (final id in sortedFillIds) {
          buffer.writeln(
              'this.${resolveName('${SvgIdFormatter.format(id)}Fill')},');
        }
        if (sortedFillIndexed != null) {
          for (final String name in sortedFillIndexed) {
            buffer.writeln('this.${resolveName(name)},');
          }
        }
        for (final id in sortedStrokeIds) {
          buffer.writeln(
              'this.${resolveName('${SvgIdFormatter.format(id)}Stroke')},');
        }
        if (sortedStrokeIndexed != null) {
          for (final String name in sortedStrokeIndexed) {
            buffer.writeln('this.${resolveName(name)},');
          }
        }
      }, footer: '});');
      buffer.writeln();
      buffer.writeln('final BoxFit fit;');
      if (hasCurrentColor) {
        buffer.writeln('final Color? color;');
      }
      for (final id in sortedFillIds) {
        buffer.writeln(
            'final Object? ${resolveName('${SvgIdFormatter.format(id)}Fill')};');
      }
      if (sortedFillIndexed != null) {
        for (final String name in sortedFillIndexed) {
          buffer.writeln('final Object? ${resolveName(name)};');
        }
      }
      for (final id in sortedStrokeIds) {
        buffer.writeln(
            'final Object? ${resolveName('${SvgIdFormatter.format(id)}Stroke')};');
      }
      if (sortedStrokeIndexed != null) {
        for (final String name in sortedStrokeIndexed) {
          buffer.writeln('final Object? ${resolveName(name)};');
        }
      }
      buffer.writeln();
      buffer.writeln(
          'Size get viewBox => const Size($viewBoxWidth, $viewBoxHeight);');
      buffer.writeln();
      buffer.writeln('@override');
      buffer.writeBlock('void paint(Canvas canvas, Size size) {', () {
        buffer.writeln(
          'final FittedSizes fittedSizes = applyBoxFit(fit, const Size($viewBoxWidth, $viewBoxHeight), size);',
        );
        buffer.writeln('final Size sourceSize = fittedSizes.source;');
        buffer.writeln(
          'final Rect destRect = Alignment.center.inscribe(fittedSizes.destination, Offset.zero & size);',
        );

        // Check if we need viewBoxRect for userSpaceOnUse shaders
        final bool needsViewBoxRect = _needsViewBoxRect(commands);
        if (needsViewBoxRect) {
          buffer.writeln(
              'final Rect viewBoxRect = Rect.fromLTWH(0, 0, $viewBoxWidth, $viewBoxHeight);');
        }
        buffer.writeln();

        buffer.writeln('canvas.save();');
        buffer.writeln('canvas.translate(destRect.left, destRect.top);');
        buffer.writeln(
          'canvas.scale(destRect.width / sourceSize.width, destRect.height / sourceSize.height);',
        );
        buffer.writeln();

        // 1st pass: Gradient definitions (DefineCommand)
        for (final command in commands) {
          if (command is DefineCommand) {
            _generators[command.runtimeType]?.generate(
              command,
              buffer,
              generators: _generators,
              palette: palette,
              activeFillProperties: activeFillProperties,
              activeStrokeProperties: activeStrokeProperties,
              painterClassName: className,
              gradientsNeedingStretch: gradientsNeedingStretch,
            );
          }
        }

        // 2nd pass: Drawing commands (DrawCommand)
        for (final command in commands) {
          if (command is DrawCommand) {
            _generators[command.runtimeType]?.generate(
              command,
              buffer,
              generators: _generators,
              palette: palette,
              activeFillProperties: activeFillProperties,
              activeStrokeProperties: activeStrokeProperties,
              painterClassName: className,
              gradientsNeedingStretch: gradientsNeedingStretch,
            );
          }
        }

        buffer.writeln('canvas.restore();');
      });
      buffer.writeln();

      buffer.writeBlock('void _applyOverride(Paint paint, Object? override) {',
          () {
        buffer.writeBlock('switch (override) {', () {
          buffer.writeBlock('case final Color color:', () {
            buffer.writeln('paint.color = color;');
            buffer.writeln('paint.shader = null;');
          }, footer: '');
          buffer.writeBlock('case final Shader shader:', () {
            buffer.writeln('paint.shader = shader;');
          }, footer: '');
          buffer.writeBlock('case null || _:', () {
            buffer.writeln('break;');
          }, footer: '');
        });
      });
      buffer.writeln();

      if (_hasDashes(commands)) {
        buffer.writeBlock(
          'Path _dashPath(Path source, List<double> dashArray, {double? pathLength}) {',
          () {
            buffer.writeln('if (dashArray.isEmpty) return source;');
            buffer.writeln('final Path dest = Path();');
            buffer.writeBlock('for (final metric in source.computeMetrics()) {',
                () {
              buffer.writeln('final double scale;');
              buffer.writeBlock('if (pathLength == null || pathLength <= 0) {',
                  () {
                buffer.writeln('scale = 1.0;');
              });
              buffer.writeBlock('else {', () {
                buffer.writeln('scale = metric.length / pathLength;');
              });
              buffer.writeln('double distance = 0.0;');
              buffer.writeln('int index = 0;');
              buffer.writeln('bool draw = true;');
              buffer.writeBlock('while (distance < metric.length) {', () {
                buffer.writeln('final double len = dashArray[index] * scale;');
                buffer.writeBlock('if (len > 0) {', () {
                  buffer.writeBlock('if (draw) {', () {
                    buffer.writeln(
                      'final double end = distance + len < metric.length ? distance + len : metric.length;',
                    );
                    buffer.writeln(
                        'dest.addPath(metric.extractPath(distance, end), Offset.zero);');
                  });
                  buffer.writeln('distance += len;');
                });
                buffer.writeln('draw = !draw;');
                buffer.writeln('index = (index + 1) % dashArray.length;');
              });
            });
            buffer.writeln('return dest;');
          },
        );
        buffer.writeln();
      }

      buffer.writeln('@override');
      buffer.writeBlock('bool shouldRepaint(covariant $className oldDelegate) {',
          () {
        final checks = <String>['fit == oldDelegate.fit'];
        if (hasCurrentColor) {
          checks.add('color == oldDelegate.color');
        }

        for (final id in sortedFillIds) {
          final String prop = resolveName('${SvgIdFormatter.format(id)}Fill');
          checks.add('$prop == oldDelegate.$prop');
        }
        if (sortedFillIndexed != null) {
          for (final String name in sortedFillIndexed) {
            final String prop = resolveName(name);
            checks.add('$prop == oldDelegate.$prop');
          }
        }
        for (final id in sortedStrokeIds) {
          final String prop = resolveName('${SvgIdFormatter.format(id)}Stroke');
          checks.add('$prop == oldDelegate.$prop');
        }
        if (sortedStrokeIndexed != null) {
          for (final String name in sortedStrokeIndexed) {
            final String prop = resolveName(name);
            checks.add('$prop == oldDelegate.$prop');
          }
        }

        buffer.writeBlock('if (${checks.join(' &&\n          ')}) {', () {
          buffer.writeln('return false;');
        }, footer: '} else {');
        buffer.indent();
        buffer.writeln('return true;');
        buffer.outdent();
        buffer.writeln('}');
      });
    });

    if (_needsGradientTransform(commands, gradientsNeedingStretch)) {
      final String cleanName =
          publicName.replaceAll(r'$', '').replaceFirst(RegExp(r'^_+'), '');
      final helperClassName = '_SvgGradientTransform_$cleanName';

      buffer.writeln();
      buffer.writeln(
          '/// A private helper class to apply arbitrary transformations to SVG gradients.');
      buffer.writeBlock('class $helperClassName extends GradientTransform {', () {
        buffer.writeln(
            'const $helperClassName({this.matrix, this.isElliptical = false, this.centerX = 0.5, this.centerY = 0.5});');
        buffer.writeln();
        buffer.writeln('/// The 4x4 matrix storage.');
        buffer.writeln('final List<double>? matrix;');
        buffer.writeln();
        buffer.writeln(
            '/// Whether to correct the aspect ratio for elliptical gradients.');
        buffer.writeln('final bool isElliptical;');
        buffer.writeln();
        buffer.writeln(
            '/// The normalized center X coordinate (0..1) for aspect ratio correction.');
        buffer.writeln('final double centerX;');
        buffer.writeln();
        buffer.writeln(
            '/// The normalized center Y coordinate (0..1) for aspect ratio correction.');
        buffer.writeln('final double centerY;');
        buffer.writeln();
        buffer.writeln('@override');
        buffer.writeBlock(
            'Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {',
            () {
          buffer.writeln('Matrix4? m;');
          buffer.writeln('if (matrix != null) {');
          buffer.writeln('  m = Matrix4.fromList(matrix!);');
          buffer.writeln('}');
          buffer.writeln();
          buffer.writeBlock('if (isElliptical && bounds.width != bounds.height) {',
              () {
            buffer.writeln(
                'final double shortest = bounds.width < bounds.height ? bounds.width : bounds.height;');
            buffer.writeln('final double sx = bounds.width / shortest;');
            buffer.writeln('final double sy = bounds.height / shortest;');
            buffer.writeln(
                'final double px = bounds.left + (centerX * bounds.width);');
            buffer.writeln(
                'final double py = bounds.top + (centerY * bounds.height);');
            buffer.writeln();
            buffer.writeln('final Matrix4 scale = Matrix4.identity()');
            buffer.writeln('  ..translateByDouble(px, py, 0.0, 1.0)');
            buffer.writeln('  ..scaleByDouble(sx, sy, 1.0, 1.0)');
            buffer.writeln('  ..translateByDouble(-px, -py, 0.0, 1.0);');
            buffer.writeln();
            buffer.writeln('if (m != null) {');
            buffer.writeln('  return scale..multiply(m);');
            buffer.writeln('}');
            buffer.writeln('return scale;');
          });
          buffer.writeln('return m;');
        });
      });
    }

    return buffer.toString();
  }

  bool _needsViewBoxRect(List<PaintCommand> commands) {
    for (final command in commands) {
      if (command is DefineGradient && command.units == PaintingGradientUnits.userSpaceOnUse) {
        return true;
      }
      if (command is DrawGroup && _needsViewBoxRect(command.commands)) {
        return true;
      }
    }
    return false;
  }

  Set<String> _findGradientsNeedingStretch(List<PaintCommand> commands) {
    final ids = <String>{};
    for (final command in commands) {
      if (command is DrawGroup) {
        ids.addAll(_findGradientsNeedingStretch(command.commands));
      } else if (command is DrawCommand) {
        final String? shaderId =
            command.style.fill?.shaderId ?? command.style.stroke?.shaderId;
        if (shaderId != null && _isNonSquare(command)) {
          ids.add(shaderId);
        }
      }
    }
    return ids;
  }

  bool _isNonSquare(DrawCommand command) {
    return switch (command) {
      DrawRect(:final double width, :final double height) => width != height,
      DrawOval(:final double rx, :final double ry) => rx != ry,
      DrawCircle() => false,
      DrawLine() => true,
      DrawPath() => true,
      DrawPolyline() => true,
      DrawPolygon() => true,
      DrawText() => true,
      _ => true,
    };
  }

  bool _needsGradientTransform(
    List<PaintCommand> commands,
    Set<String> gradientsNeedingStretch,
  ) {
    for (final command in commands) {
      if (command is DefineGradient) {
        if (command.transformAttributes != null) {
          return true;
        }
        if (command is DefineRadialGradient &&
            command.units == PaintingGradientUnits.objectBoundingBox &&
            gradientsNeedingStretch.contains(command.id)) {
          return true;
        }
      }
      if (command is DrawGroup &&
          _needsGradientTransform(command.commands, gradientsNeedingStretch)) {
        return true;
      }
    }
    return false;
  }

  void generateWidgetClass({
    required GeneratorBuffer buffer,
    required String widgetClassName,
    required String painterClassName,
    required Map<String, String> activeFillProperties,
    required Map<String, String> activeStrokeProperties,
    required double viewBoxWidth,
    required double viewBoxHeight,
    required bool hasCurrentColor,
  }) {
    buffer.writeBlock('class $widgetClassName extends StatelessWidget {', () {
      buffer.writeBlock('const $widgetClassName({', () {
        buffer.writeln('super.key,');
        buffer.writeln('this.width,');
        buffer.writeln('this.height,');
        buffer.writeln('this.fit = BoxFit.contain,');
        buffer.writeln('this.alignment = Alignment.center,');
        if (hasCurrentColor) {
          buffer.writeln('this.color,');
        }

        final allProps = <String>{
          ...activeFillProperties.values,
          ...activeStrokeProperties.values,
        };
        for (final prop in allProps) {
          buffer.writeln('this.$prop,');
        }
      }, footer: '});');
      buffer.writeln();
      buffer.writeln('final double? width;');
      buffer.writeln('final double? height;');
      buffer.writeln('final BoxFit fit;');
      buffer.writeln('final AlignmentGeometry alignment;');
      if (hasCurrentColor) {
        buffer.writeln('final Color? color;');
      }

      final allProps = <String>{
        ...activeFillProperties.values,
        ...activeStrokeProperties.values,
      };
      for (final prop in allProps) {
        buffer.writeln('final Object? $prop;');
      }

      buffer.writeln();
      buffer.writeln('@override');
      buffer.writeBlock('Widget build(BuildContext context) {', () {
        buffer.writeBlock('return CustomPaint(', () {
          buffer.writeln('size: Size(width ?? $viewBoxWidth, height ?? $viewBoxHeight),');
          buffer.writeBlock('painter: $painterClassName(', () {
            buffer.writeln('fit: fit,');
            if (hasCurrentColor) {
              buffer.writeln('color: color ?? IconTheme.of(context).color,');
            }
            for (final prop in allProps) {
              buffer.writeln('$prop: $prop,');
            }
          }, footer: '),');
        }, footer: ');');
      });
    });
  }

  bool _hasDashes(List<PaintCommand> commands) {
    for (final command in commands) {
      if (command is DrawCommand) {
        final PaintingStyle style = command.style;
        final List<double>? dashArray = style.stroke?.dashArray;

        if (dashArray != null) {
          return true;
        }
      }

      if (command is DrawGroup) {
        if (_hasDashes(command.commands)) {
          return true;
        }
      }
    }
    return false;
  }

  bool _hasCurrentColor(List<PaintCommand> commands) {
    for (final command in commands) {
      if (command is DrawCommand) {
        final PaintingStyle style = command.style;
        if ((style.fill?.isCurrentColor ?? false) || (style.stroke?.isCurrentColor ?? false)) {
          return true;
        }
      }

      if (command is DrawGroup) {
        if (_hasCurrentColor(command.commands)) {
          return true;
        }
      }
    }
    return false;
  }

  void _collectIds(List<PaintCommand> commands, Set<String> fillIds, Set<String> strokeIds) {
    for (final command in commands) {
      final String? cmdId = command.id;
      if (command is DrawCommand && cmdId != null) {
        final PaintingStyle style = command.style;
        if (style.fill?.isExplicit ?? false) {
          fillIds.add(cmdId);
        }
        if (style.stroke?.isExplicit ?? false) {
          strokeIds.add(cmdId);
        }
      }
      if (command is DrawGroup) {
        _collectIds(command.commands, fillIds, strokeIds);
      }
    }
  }

  @visibleForTesting
  Future<Result<String>> loadSvgContent(ConstantReader annotation, BuildStep buildStep) async {
    final DartType? type = annotation.objectValue.type;
    if (type == null) {
      return const Failure<String>('Annotation object has no type.');
    }

    // coverage:ignore-start
    if (fileChecker.isExactlyType(type)) {
      return loadFromFile(annotation, buildStep);
    } else if (codeChecker.isExactlyType(type)) {
      return Success<String>(annotation.read('code').stringValue);
    }
    // coverage:ignore-end

    return const Failure<String>(
      'Unknown SvgPainter type. Must be SvgFilePainter or SvgCodePainter.',
    );
  }

  @visibleForTesting
  Future<Result<String>> loadFromFile(ConstantReader annotation, BuildStep buildStep) async {
    final String path = annotation.read('path').stringValue;
    if (!path.startsWith('package:')) {
      return const Failure<String>('Only package: URIs are supported for file assets.');
    }

    final Uri uri = Uri.parse(path);
    final assetId = AssetId(
      uri.pathSegments.first,
      'lib/${uri.pathSegments.skip(1).join('/')}',
    );

    try {
      final String content = await buildStep.readAsString(assetId);
      return Success<String>(content);
    } catch (e) {
      return Failure<String>('Failed to read asset $path: $e');
    }
  }
}
