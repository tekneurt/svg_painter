import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';

/// Generator that produces CustomPainter code from SVG files.
///
/// This generator is triggered by the `@SvgPainter` annotation and produces
/// Flutter widget code that renders the SVG using a CustomPainter.
class SvgPainterGenerator extends GeneratorForAnnotation<SvgPainter> {
  @override
  Future<String> generateForAnnotatedElement(
    Element element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) async {
    // TODO(TN): Implement SVG parsing and code generation (placeholder for v0.0.1).
    return '// svg_painter code generation coming soon';
  }
}
