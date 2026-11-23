import 'package:flutter/material.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';
import 'package:svg_painter_fixtures/svg_painter_fixtures.dart';

part 'simple_painter.g.dart';

@SvgCodePainter(flutterSvgSimpleSvg)
class SimplePainter extends _$SimplePainter {
  const SimplePainter({super.fit});
}
