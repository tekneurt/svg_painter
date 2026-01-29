import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
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
  static const TypeChecker _fileChecker = TypeChecker.fromUrl(
    'package:svg_painter_annotation/src/svg_painter.dart#SvgFilePainter',
  );
  static const TypeChecker _codeChecker = TypeChecker.fromUrl(
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
        DrawPolyline: PolyGenerator(),
        DrawPolygon: PolyGenerator(),
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

    return generateFromSvg(
      elementName: element.name ?? 'Unknown',
      svgContent: svgContent,
      painterClassName: painterClassName,
    );
  }

  /// Generates the painter class from SVG content string.
  @visibleForTesting
  String generateFromSvg({
    required String elementName,
    required String svgContent,
    String? painterClassName,
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

    if (svgRoot is! SvgSvg) {
      throw InvalidGenerationSourceError(
        'Root element must be <svg>, but found ${svgRoot.runtimeType}',
      );
    }

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
    );
  }

  /// Generates the full CustomPainter class code.
  @visibleForTesting
  String generatePainterClass({
    required String className,
    required double viewBoxWidth,
    required double viewBoxHeight,
    required List<PaintCommand> commands,
  }) {
    final StringBuffer buffer = StringBuffer();

    // Header to ignore lints in generated code
    buffer.writeln('// coverage:ignore-file');
    buffer.writeln('// ignore_for_file: type=lint');
    buffer.writeln(
      '// ignore_for_file: unused_element, unused_field, unused_element_parameter, deprecated_member_use_from_same_package',
    );
    buffer.writeln();

    buffer.writeln('class $className extends CustomPainter {');
    final Set<String> fillIds = <String>{};
    final Set<String> strokeIds = <String>{};
    _collectIds(commands, fillIds, strokeIds);
    
    final List<String> sortedFillIds = fillIds.toList()..sort();
    final List<String> sortedStrokeIds = strokeIds.toList()..sort();

    buffer.writeln('  const $className({');
    buffer.writeln('    this.fit = BoxFit.contain,');
    for (final String id in sortedFillIds) {
      buffer.writeln('    this.${SvgIdFormatter.format(id)}Fill,');
    }
    for (final String id in sortedStrokeIds) {
      buffer.writeln('    this.${SvgIdFormatter.format(id)}Stroke,');
    }
    buffer.writeln('  });');
    buffer.writeln();
    buffer.writeln('  final BoxFit fit;');
    for (final String id in sortedFillIds) {
      buffer.writeln('  final Color? ${SvgIdFormatter.format(id)}Fill;');
    }
    for (final String id in sortedStrokeIds) {
      buffer.writeln('  final Color? ${SvgIdFormatter.format(id)}Stroke;');
    }
    buffer.writeln();
    buffer.writeln('  Size get viewBox => const Size($viewBoxWidth, $viewBoxHeight);');
    buffer.writeln();
    buffer.writeln('  @override');
    buffer.writeln('  void paint(Canvas canvas, Size size) {');
    buffer.writeln(
      '    final FittedSizes fittedSizes = applyBoxFit(fit, const Size($viewBoxWidth, $viewBoxHeight), size);',
    );
    buffer.writeln('    final Size sourceSize = fittedSizes.source;');
    buffer.writeln(
      '    final Rect destRect = Alignment.center.inscribe(fittedSizes.destination, Offset.zero & size);',
    );
    buffer.writeln();
    buffer.writeln('    canvas.save();');
    buffer.writeln('    canvas.translate(destRect.left, destRect.top);');
    buffer.writeln(
      '    canvas.scale(destRect.width / sourceSize.width, destRect.height / sourceSize.height);',
    );
    buffer.writeln('    canvas.clipRect(Rect.fromLTWH(0, 0, $viewBoxWidth, $viewBoxHeight));');
    buffer.writeln();

    // 1st pass: Gradient definitions
    for (final PaintCommand command in commands) {
      if (command is DefineGradient) {
        _generators[command.runtimeType]?.generate(command, buffer, generators: _generators);
      }
    }

    // 2nd pass: Drawing commands
    for (final PaintCommand command in commands) {
      if (command is! DefineGradient) {
        _generators[command.runtimeType]?.generate(command, buffer, generators: _generators);
      }
    }

    buffer.writeln('    canvas.restore();');
    buffer.writeln('  }');
    buffer.writeln();

    if (_hasDashes(commands)) {
      buffer.writeln(
        '  Path _dashPath(Path source, List<double> dashArray, {double? pathLength}) {',
      );
      buffer.writeln('    if (dashArray.isEmpty) return source;');
      buffer.writeln('    final Path dest = Path();');
      buffer.writeln('    for (final metric in source.computeMetrics()) {');
      buffer.writeln(
        '      final double scale = (pathLength != null && pathLength > 0) ? (metric.length / pathLength) : 1.0;',
      );
      buffer.writeln('      double distance = 0.0;');
      buffer.writeln('      int index = 0;');
      buffer.writeln('      bool draw = true;');
      buffer.writeln('      while (distance < metric.length) {');
      buffer.writeln('        final double len = dashArray[index] * scale;');
      buffer.writeln('        if (draw) {');
      buffer.writeln(
        '          final double end = distance + len < metric.length ? distance + len : metric.length;',
      );
      buffer.writeln('          dest.addPath(metric.extractPath(distance, end), Offset.zero);');
      buffer.writeln('        }');
      buffer.writeln('        distance += len;');
      buffer.writeln('        draw = !draw;');
      buffer.writeln('        index = (index + 1) % dashArray.length;');
      buffer.writeln('      }');
      buffer.writeln('    }');
      buffer.writeln('    return dest;');
      buffer.writeln('  }');
      buffer.writeln();
    }

    buffer.writeln('  @override');
    buffer.writeln('  bool shouldRepaint(covariant $className oldDelegate) {');
    buffer.writeln('    if (fit == oldDelegate.fit) {');
    for (final String id in sortedFillIds) {
      final String prop = '${SvgIdFormatter.format(id)}Fill';
      buffer.writeln('      if ($prop != oldDelegate.$prop) return true;');
    }
    for (final String id in sortedStrokeIds) {
      final String prop = '${SvgIdFormatter.format(id)}Stroke';
      buffer.writeln('      if ($prop != oldDelegate.$prop) return true;');
    }
    buffer.writeln('      return false;');
    buffer.writeln('    } else {');
    buffer.writeln('      return true;');
    buffer.writeln('    }');
    buffer.writeln('  }');
    buffer.writeln('}');

    return buffer.toString();
  }

  bool _hasDashes(List<PaintCommand> commands) {
    for (final PaintCommand command in commands) {
      if (command is DrawCircle && command.style.stroke?.dashArray != null) {
        return true;
      }
      if (command is DrawOval && command.style.stroke?.dashArray != null) {
        return true;
      }
      if (command is DrawRect && command.style.stroke?.dashArray != null) {
        return true;
      }
      if (command is DrawText && command.style.stroke?.dashArray != null) {
        return true;
      }
      if (command is DrawPath && command.style.stroke?.dashArray != null) {
        return true;
      }
      if (command is DrawLine && command.style.stroke?.dashArray != null) {
        return true;
      }
      if (command is DrawPolyline && command.style.stroke?.dashArray != null) {
        return true;
      }
      if (command is DrawPolygon && command.style.stroke?.dashArray != null) {
        return true;
      }

      if (command is DrawGroup) {
        if (_hasDashes(command.commands)) {
          return true;
        }
      }
    }
    return false;
  }

  void _collectIds(
    List<PaintCommand> commands,
    Set<String> fillIds,
    Set<String> strokeIds,
  ) {
    for (final PaintCommand command in commands) {
      if (command is! DefineGradient && command.id != null) {
        final PaintingStyle? style = command.style;
        if (style?.fill?.isExplicit == true) {
          fillIds.add(command.id!);
        }
        if (style?.stroke?.isExplicit == true) {
          strokeIds.add(command.id!);
        }
      }
      if (command is DrawGroup) {
        _collectIds(command.commands, fillIds, strokeIds);
      }
    }
  }

  @visibleForTesting
  Future<Result<String>> loadSvgContent(ConstantReader annotation, BuildStep buildStep) async {
    if (_fileChecker.isExactlyType(annotation.objectValue.type!)) {
      return loadFromFile(annotation, buildStep);
    } else if (_codeChecker.isExactlyType(annotation.objectValue.type!)) {
      return Success<String>(annotation.read('code').stringValue);
    }
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