import 'package:svg_painter_annotation/svg_painter_annotation.dart';

import '../painting_model/_painting_model.dart';
import 'command_generator.dart';
import 'generation_analyzer.dart';
import 'generator_buffer.dart';
import 'image_preloader.dart';
import 'palette_analyzer.dart';
import 'svg_id_formatter.dart';
import 'widget_class_generator.dart';

/// Helper class to generate the CustomPainter class code.
class PainterClassGenerator {
  const PainterClassGenerator({
    this.analyzer = const GenerationAnalyzer(),
    this.widgetGenerator = const WidgetClassGenerator(),
    this.imagePreloader = const ImagePreloader(),
  });

  /// Analyzer for the paint command tree.
  final GenerationAnalyzer analyzer;

  /// Generator for the Widget class.
  final WidgetClassGenerator widgetGenerator;

  /// Preloader for images.
  final ImagePreloader imagePreloader;

  /// Generates the full CustomPainter class code.
  String generatePainterClass({
    required String className,
    required double viewBoxWidth,
    required double viewBoxHeight,
    required List<PaintCommand> commands,
    required Map<Type, CommandGenerator<PaintCommand>> generators,
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
      analyzer.collectIds(commands, fillIds, strokeIds);
    }

    final PaletteResult? palette =
        (exposureMode == SvgExposureMode.indexed || exposureMode == SvgExposureMode.mixed)
        ? const PaletteAnalyzer().analyze(commands, mode: exposureMode)
        : null;

    final Set<String> gradientsNeedingStretch = analyzer.findGradientsNeedingStretch(commands);

    final List<String> sortedFillIds = fillIds.toList()..sort();
    final List<String> sortedStrokeIds = strokeIds.toList()..sort();
    final List<String>? sortedFillIndexed = palette?.fillAssignments.values.toSet().toList()
      ?..sort();
    final List<String>? sortedStrokeIndexed = palette?.strokeAssignments.values.toSet().toList()
      ?..sort();

    String resolveName(String defaultName) => propertyMapping[defaultName] ?? defaultName;

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

    final bool hasCurrentColor = analyzer.hasCurrentColor(commands);

    final imageHrefs = <String>[];
    imagePreloader.collectImageHrefs(commands, imageHrefs);
    final List<String> uniqueImageHrefs = imageHrefs.toSet().toList();
    imagePreloader.populateImageIndices(commands, uniqueImageHrefs);

    // Generate the convenience Widget
    final String publicName = className.startsWith(r'_$') ? className.substring(2) : className;
    final widgetClassName = '${publicName}Widget';

    widgetGenerator.generateWidgetClass(
      buffer: buffer,
      widgetClassName: widgetClassName,
      painterClassName: className,
      activeFillProperties: activeFillProperties,
      activeStrokeProperties: activeStrokeProperties,
      viewBoxWidth: viewBoxWidth,
      viewBoxHeight: viewBoxHeight,
      hasCurrentColor: hasCurrentColor,
      imageHrefs: uniqueImageHrefs,
    );
    buffer.writeln();

    for (var i = 0; i < uniqueImageHrefs.length; i++) {
      final String href = uniqueImageHrefs[i];
      final List<int>? bytes = imagePreloader.findBytesForHref(commands, href);
      if (bytes == null) {
        throw StateError('Image bytes not found for $href');
      }
      buffer.writeln('const List<int> _imageBytes_${className}_$i = <int>[${bytes.join(', ')}];');
    }

    if (uniqueImageHrefs.isNotEmpty) {
      buffer.writeln();
    }

    buffer.writeBlock('class $className extends CustomPainter {', () {
      buffer.writeBlock('const $className({', () {
        buffer.writeln('this.fit = BoxFit.contain,');
        if (hasCurrentColor) {
          buffer.writeln('this.color,');
        }
        for (final id in sortedFillIds) {
          buffer.writeln('this.${resolveName('${SvgIdFormatter.format(id)}Fill')},');
        }
        if (sortedFillIndexed != null) {
          for (final String name in sortedFillIndexed) {
            buffer.writeln('this.${resolveName(name)},');
          }
        }
        for (final id in sortedStrokeIds) {
          buffer.writeln('this.${resolveName('${SvgIdFormatter.format(id)}Stroke')},');
        }
        if (sortedStrokeIndexed != null) {
          for (final String name in sortedStrokeIndexed) {
            buffer.writeln('this.${resolveName(name)},');
          }
        }
        for (var i = 0; i < uniqueImageHrefs.length; i++) {
          buffer.writeln('this.image$i,');
        }
      }, footer: '});');
      buffer.writeln();
      buffer.writeln('final BoxFit fit;');
      if (hasCurrentColor) {
        buffer.writeln('final Color? color;');
      }
      for (final id in sortedFillIds) {
        buffer.writeln('final Object? ${resolveName('${SvgIdFormatter.format(id)}Fill')};');
      }
      if (sortedFillIndexed != null) {
        for (final String name in sortedFillIndexed) {
          buffer.writeln('final Object? ${resolveName(name)};');
        }
      }
      for (final id in sortedStrokeIds) {
        buffer.writeln('final Object? ${resolveName('${SvgIdFormatter.format(id)}Stroke')};');
      }
      if (sortedStrokeIndexed != null) {
        for (final String name in sortedStrokeIndexed) {
          buffer.writeln('final Object? ${resolveName(name)};');
        }
      }
      for (var i = 0; i < uniqueImageHrefs.length; i++) {
        buffer.writeln('final ui.Image? image$i;');
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

        // Check if we need viewBoxRect for userSpaceOnUse shaders
        final bool needsViewBoxRect = analyzer.needsViewBoxRect(commands);
        if (needsViewBoxRect) {
          buffer.writeln(
            'final Rect viewBoxRect = Rect.fromLTWH(0, 0, $viewBoxWidth, $viewBoxHeight);',
          );
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
            generators[command.runtimeType]?.generate(
              command,
              buffer,
              generators: generators,
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
            generators[command.runtimeType]?.generate(
              command,
              buffer,
              generators: generators,
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

      buffer.writeBlock('void _applyOverride(Paint paint, Object? override) {', () {
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

      if (analyzer.hasDashes(commands)) {
        buffer.writeBlock(
          'Path _dashPath(Path source, List<double> dashArray, {double? pathLength}) {',
          () {
            buffer.writeln('if (dashArray.isEmpty) return source;');
            buffer.writeln('final Path dest = Path();');
            buffer.writeBlock('for (final metric in source.computeMetrics()) {', () {
              buffer.writeln('final double scale;');
              buffer.writeBlock('if (pathLength == null || pathLength <= 0) {', () {
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
        for (var i = 0; i < uniqueImageHrefs.length; i++) {
          checks.add('image$i == oldDelegate.image$i');
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

    if (analyzer.needsGradientTransform(commands, gradientsNeedingStretch)) {
      final String cleanName = publicName.replaceAll(r'$', '').replaceFirst(RegExp(r'^_+'), '');
      final helperClassName = '_SvgGradientTransform_$cleanName';

      buffer.writeln();
      buffer.writeln(
        '/// A private helper class to apply arbitrary transformations to SVG gradients.',
      );
      buffer.writeBlock('class $helperClassName extends GradientTransform {', () {
        buffer.writeln(
          'const $helperClassName({this.matrix, this.isElliptical = false, this.centerX = 0.5, this.centerY = 0.5});',
        );
        buffer.writeln();
        buffer.writeln('/// The 4x4 matrix storage.');
        buffer.writeln('final List<double>? matrix;');
        buffer.writeln();
        buffer.writeln('/// Whether to correct the aspect ratio for elliptical gradients.');
        buffer.writeln('final bool isElliptical;');
        buffer.writeln();
        buffer.writeln(
          '/// The normalized center X coordinate (0..1) for aspect ratio correction.',
        );
        buffer.writeln('final double centerX;');
        buffer.writeln();
        buffer.writeln(
          '/// The normalized center Y coordinate (0..1) for aspect ratio correction.',
        );
        buffer.writeln('final double centerY;');
        buffer.writeln();
        buffer.writeln('@override');
        buffer.writeBlock('Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {', () {
          buffer.writeln('Matrix4? m;');
          buffer.writeln('if (matrix != null) {');
          buffer.writeln('  m = Matrix4.fromList(matrix!);');
          buffer.writeln('}');
          buffer.writeln();
          buffer.writeBlock('if (isElliptical && bounds.width != bounds.height) {', () {
            buffer.writeln(
              'final double shortest = bounds.width < bounds.height ? bounds.width : bounds.height;',
            );
            buffer.writeln('final double sx = bounds.width / shortest;');
            buffer.writeln('final double sy = bounds.height / shortest;');
            buffer.writeln('final double px = bounds.left + (centerX * bounds.width);');
            buffer.writeln('final double py = bounds.top + (centerY * bounds.height);');
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
}
