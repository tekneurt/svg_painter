import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';
import 'package:xml/xml.dart';

import 'base/_base.dart';
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

  @override
  FutureOr<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async {
    final Result<String> contentResult = await _loadSvgContent(annotation, buildStep);

    final String svgContent = contentResult.fold(
      (Failure<String> failure) => throw InvalidGenerationSourceError(
        'Failed to load SVG content for ${element.name}: ${failure.message}',
        element: element,
      ),
      (String content) => content,
    );

    final Result<XmlDocument> parseResult = svgContent.toXmlDocument();

    final XmlDocument document = parseResult.fold(
      (Failure<XmlDocument> failure) => throw InvalidGenerationSourceError(
        'Invalid SVG content for ${element.name}: ${failure.message}',
        element: element,
      ),
      (XmlDocument doc) => doc,
    );

    final XmlElement svgXmlElement = document.findAllElements(XmlElementName.svg.tagName).first;

    final Result<SvgElement> mapResult = svgXmlElement.toSvgElement();

    final SvgElement svgRoot = mapResult.fold(
      (Failure<SvgElement> failure) => throw InvalidGenerationSourceError(
        'Failed to map SVG content for ${element.name}: ${failure.message}',
        element: element,
      ),
      (SvgElement value) => value,
    );

    if (svgRoot is! SvgSvg) {
      throw InvalidGenerationSourceError(
        'Root element must be <svg>, but found ${svgRoot.runtimeType}',
        element: element,
      );
    }

    final Result<List<PaintCommand>> paintingResult = svgRoot.toPaintCommands();
    final List<PaintCommand> commands = paintingResult.fold(
      (Failure<List<PaintCommand>> failure) => throw InvalidGenerationSourceError(
        'Failed to convert SVG to painting commands for ${element.name}: ${failure.message}',
        element: element,
      ),
      (List<PaintCommand> value) => value,
    );

    final StringBuffer buffer = StringBuffer();
    final String className = annotation.read('painterClassName').isNull
        ? '_\$${element.name}'
        : annotation.read('painterClassName').stringValue;

    buffer.writeln('class $className extends CustomPainter {');
    buffer.writeln('  @override');
    buffer.writeln('  void paint(Canvas canvas, Size size) {');

    for (final PaintCommand command in commands) {
      if (command is DrawCircle) {
        final String colorString =
            '0x${command.colorHex.toRadixString(16).toUpperCase().padLeft(8, '0')}';
        buffer.writeln(
          '    canvas.drawCircle(const Offset(${command.cx}, ${command.cy}), ${command.radius}, Paint()..color = const Color($colorString));',
        );
      }
    }

    buffer.writeln('  }');
    buffer.writeln('  @override');
    buffer.writeln('  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;');
    buffer.writeln('}');

    return buffer.toString();
  }

  Future<Result<String>> _loadSvgContent(ConstantReader annotation, BuildStep buildStep) async {
    if (_fileChecker.isExactlyType(annotation.objectValue.type!)) {
      return _loadFromFile(annotation, buildStep);
    } else if (_codeChecker.isExactlyType(annotation.objectValue.type!)) {
      return Success<String>(annotation.read('code').stringValue);
    }
    return const Failure<String>(
      'Unknown SvgPainter type. Must be SvgFilePainter or SvgCodePainter.',
    );
  }

  Future<Result<String>> _loadFromFile(ConstantReader annotation, BuildStep buildStep) async {
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
