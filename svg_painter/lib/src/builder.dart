import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import 'svg_painter_generator.dart';

/// Builder factory for the SvgPainter generator.
///
/// This is the entry point for build_runner.
Builder svgPainterBuilder(BuilderOptions options) => SharedPartBuilder(
      <Generator>[SvgPainterGenerator()],
      'svg_painter',
    );
