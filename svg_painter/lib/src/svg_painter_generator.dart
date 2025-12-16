import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';
import 'package:xml/xml.dart';

/// Generator that produces CustomPainter code from SVG files.
class SvgPainterGenerator extends GeneratorForAnnotation<SvgPainter> {
  @override
  FutureOr<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async {
    const fileChecker = TypeChecker.fromUrl(
      'package:svg_painter_annotation/src/svg_painter.dart#SvgFilePainter',
    );
    const codeChecker = TypeChecker.fromUrl(
      'package:svg_painter_annotation/src/svg_painter.dart#SvgCodePainter',
    );

    final bool isFile = fileChecker.isExactlyType(annotation.objectValue.type!);
    final bool isCode = codeChecker.isExactlyType(annotation.objectValue.type!);

    String? svgContent;

    if (isFile) {
      final String path = annotation.read('path').stringValue;
      AssetId assetId;

      if (path.startsWith('package:')) {
        final Uri uri = Uri.parse(path);
        // package:pkg/path/to/file.svg -> pkg, lib/path/to/file.svg
        assetId = AssetId(
          uri.pathSegments.first,
          'lib/${uri.pathSegments.skip(1).join('/')}',
        );
      } else {
        // Relative path handling
        // For now, only package: URIs are supported for fixtures
        throw UnsupportedError('Only package: URIs are supported for now');
      }
      svgContent = await buildStep.readAsString(assetId);
    } else if (isCode) {
      svgContent = annotation.read('code').stringValue;
    } else {
      throw InvalidGenerationSourceError(
        'Unknown SvgPainter type. Must be SvgFilePainter or SvgCodePainter.',
        element: element,
      );
    }

    final document = XmlDocument.parse(svgContent);
    final XmlElement svgElement = document.findAllElements('svg').first;

    final buffer = StringBuffer();
    // Default class name generation
    final String className =
        annotation.read('painterClassName').isNull
            ? '_\$${element.name}'
            : annotation.read('painterClassName').stringValue;

    buffer.writeln('class $className extends CustomPainter {');
    buffer.writeln('  @override');
    buffer.writeln('  void paint(Canvas canvas, Size size) {');

    // Simple traversal for Milestone 1: Circle
    for (final XmlNode child in svgElement.children) {
      if (child is XmlElement) {
        if (child.name.local == 'circle') {
          final double cx = double.parse(child.getAttribute('cx') ?? '0');
          final double cy = double.parse(child.getAttribute('cy') ?? '0');
          final double r = double.parse(child.getAttribute('r') ?? '0');

          // Default fill is black
          buffer.writeln(
            '    canvas.drawCircle(const Offset($cx, $cy), $r, Paint()..color = const Color(0xFF000000));',
          );
        }
      }
    }

    buffer.writeln('  }');
    buffer.writeln('  @override');
    buffer.writeln(
      '  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;',
    );
    buffer.writeln('}');

    return buffer.toString();
  }
}
