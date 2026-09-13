import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'src/generation/svg_painter_generator.dart';

/// Builder factory for SvgPainterGenerator.
Builder svgPainterBuilder(BuilderOptions options) =>
    SharedPartBuilder(<Generator>[const SvgPainterGenerator()], 'svg_painter');
