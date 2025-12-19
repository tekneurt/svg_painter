import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'src/svg_painter_generator.dart';

/// Builder factory for SvgPainterGenerator.
Builder svgPainterBuilder(BuilderOptions options) =>
    SharedPartBuilder(<Generator>[SvgPainterGenerator()], 'svg_painter');
