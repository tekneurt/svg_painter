import 'package:flutter/material.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';
import 'package:svg_painter_fixtures/svg_painter_fixtures.dart';

part 'cy_painter.g.dart';

@SvgCodePainter(mdnCyExample)
class CyPainter extends _$CyPainter {
  const CyPainter({super.fit});
}
