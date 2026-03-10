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

    final Map<String, String> propertyMapping = <String, String>{};
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
      double viewBoxWidth = 100.0;
      double viewBoxHeight = 100.0;

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
    final GeneratorBuffer buffer = GeneratorBuffer();

    // Header to ignore lints in generated code
    buffer.writeln('// coverage:ignore-file');
    buffer.writeln('// ignore_for_file: type=lint');
    buffer.writeln(
      '// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package',
    );
    buffer.writeln();

    final Set<String> fillIds = <String>{};
    final Set<String> strokeIds = <String>{};
    if (exposureMode == SvgExposureMode.id || exposureMode == SvgExposureMode.mixed) {
      _collectIds(commands, fillIds, strokeIds);
    }

    PaletteResult? palette;
    if (exposureMode == SvgExposureMode.indexed || exposureMode == SvgExposureMode.mixed) {
      palette = const PaletteAnalyzer().analyze(commands);
    }

    final List<String> sortedFillIds = fillIds.toList()..sort();
    final List<String> sortedStrokeIds = strokeIds.toList()..sort();
    final List<String>? sortedFillIndexed = palette?.fillAssignments.values.toSet().toList()
      ?..sort();
    final List<String>? sortedStrokeIndexed = palette?.strokeAssignments.values.toSet().toList()
      ?..sort();

    String resolveName(String defaultName) => propertyMapping[defaultName] ?? defaultName;

    final Map<String, String> activeFillProperties = <String, String>{};
    for (final String id in sortedFillIds) {
      final String original = '${SvgIdFormatter.format(id)}Fill';
      activeFillProperties[original] = resolveName(original);
    }
    if (sortedFillIndexed != null) {
      for (final String name in sortedFillIndexed) {
        activeFillProperties[name] = resolveName(name);
      }
    }

    final Map<String, String> activeStrokeProperties = <String, String>{};
    for (final String id in sortedStrokeIds) {
      final String original = '${SvgIdFormatter.format(id)}Stroke';
      activeStrokeProperties[original] = resolveName(original);
    }
    if (sortedStrokeIndexed != null) {
      for (final String name in sortedStrokeIndexed) {
        activeStrokeProperties[name] = resolveName(name);
      }
    }

    final bool hasCurrentColor = _hasCurrentColor(commands);

    // Generate the convenience Widget
    final String publicName = className.startsWith(r'_$') ? className.substring(2) : className;
    final String widgetClassName = '${publicName}Widget';

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
        for (final String id in sortedFillIds) {
          buffer.writeln('this.${resolveName('${SvgIdFormatter.format(id)}Fill')},');
        }
        if (sortedFillIndexed != null) {
          for (final String name in sortedFillIndexed) {
            buffer.writeln('this.${resolveName(name)},');
          }
        }
        for (final String id in sortedStrokeIds) {
          buffer.writeln('this.${resolveName('${SvgIdFormatter.format(id)}Stroke')},');
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
      for (final String id in sortedFillIds) {
        buffer.writeln('final Object? ${resolveName('${SvgIdFormatter.format(id)}Fill')};');
      }
      if (sortedFillIndexed != null) {
        for (final String name in sortedFillIndexed) {
          buffer.writeln('final Object? ${resolveName(name)};');
        }
      }
      for (final String id in sortedStrokeIds) {
        buffer.writeln('final Object? ${resolveName('${SvgIdFormatter.format(id)}Stroke')};');
      }
      if (sortedStrokeIndexed != null) {
        for (final String name in sortedStrokeIndexed) {
          buffer.writeln('final Object? ${resolveName(name)};');
        }
      }
      buffer.writeln();
      buffer.writeln('Size get viewBox => const Size($viewBoxWidth, $viewBoxHeight);');
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
        buffer.writeln();
        buffer.writeln('canvas.save();');
        buffer.writeln('canvas.translate(destRect.left, destRect.top);');
        buffer.writeln(
          'canvas.scale(destRect.width / sourceSize.width, destRect.height / sourceSize.height);',
        );
        buffer.writeln('canvas.clipRect(Rect.fromLTWH(0, 0, $viewBoxWidth, $viewBoxHeight));');
        buffer.writeln();

        // 1st pass: Gradient definitions (DefineCommand)
        for (final PaintCommand command in commands) {
          if (command is DefineCommand) {
            _generators[command.runtimeType]?.generate(
              command,
              buffer,
              generators: _generators,
              palette: palette,
              activeFillProperties: activeFillProperties,
              activeStrokeProperties: activeStrokeProperties,
            );
          }
        }

        // 2nd pass: Drawing commands (DrawCommand)
        for (final PaintCommand command in commands) {
          if (command is DrawCommand) {
            _generators[command.runtimeType]?.generate(
              command,
              buffer,
              generators: _generators,
              palette: palette,
              activeFillProperties: activeFillProperties,
              activeStrokeProperties: activeStrokeProperties,
            );
          }
        }

        buffer.writeln('canvas.restore();');
      });
      buffer.writeln();

      buffer.writeBlock('void _applyOverride(Paint paint, Object? override) {', () {
        buffer.writeln('if (override == null) return;');
        buffer.writeBlock('if (override is Color) {', () {
          buffer.writeln('paint.color = override;');
          buffer.writeln('paint.shader = null;');
        }, footer: '} else if (override is Shader) {');
        buffer.indent();
        buffer.writeln('paint.shader = override;');
        buffer.outdent();
      });
      buffer.writeln();

      if (_hasDashes(commands)) {
        buffer.writeBlock(
          'Path _dashPath(Path source, List<double> dashArray, {double? pathLength}) {',
          () {
            buffer.writeln('if (dashArray.isEmpty) return source;');
            buffer.writeln('final Path dest = Path();');
            buffer.writeBlock('for (final metric in source.computeMetrics()) {', () {
              buffer.writeln('final double scale;');
              buffer.writeBlock('if (pathLength == null || pathLength <= 0) {', () {
                buffer.writeln('scale = 1.0;');
              }, footer: '} else {');
              buffer.indent();
              buffer.writeln('scale = metric.length / pathLength;');
              buffer.outdent();
              buffer.writeln('}');
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
                    buffer.writeln('dest.addPath(metric.extractPath(distance, end), Offset.zero);');
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
      buffer.writeBlock('bool shouldRepaint(covariant $className oldDelegate) {', () {
        final List<String> checks = <String>['fit == oldDelegate.fit'];
        if (hasCurrentColor) {
          checks.add('color == oldDelegate.color');
        }

        for (final String id in sortedFillIds) {
          final String prop = resolveName('${SvgIdFormatter.format(id)}Fill');
          checks.add('$prop == oldDelegate.$prop');
        }
        if (sortedFillIndexed != null) {
          for (final String name in sortedFillIndexed) {
            final String prop = resolveName(name);
            checks.add('$prop == oldDelegate.$prop');
          }
        }
        for (final String id in sortedStrokeIds) {
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
      });
    });

    return buffer.toString();
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

        final Set<String> allProps = <String>{
          ...activeFillProperties.values,
          ...activeStrokeProperties.values,
        };
        for (final String prop in allProps) {
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

      final Set<String> allProps = <String>{
        ...activeFillProperties.values,
        ...activeStrokeProperties.values,
      };
      for (final String prop in allProps) {
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
            for (final String prop in allProps) {
              buffer.writeln('$prop: $prop,');
            }
          }, footer: '),');
        }, footer: ');');
      });
    });
  }

  bool _hasDashes(List<PaintCommand> commands) {
    for (final PaintCommand command in commands) {
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
    for (final PaintCommand command in commands) {
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
    for (final PaintCommand command in commands) {
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
    final AssetId assetId = AssetId(
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
