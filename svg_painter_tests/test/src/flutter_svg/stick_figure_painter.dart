import 'package:flutter/material.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';
import 'package:svg_painter_fixtures/svg_painter_fixtures.dart';

part 'stick_figure_painter.g.dart';

@SvgCodePainter(flutterSvgStickFigureSvg)
class StickFigurePainter extends _$StickFigurePainter {
  const StickFigurePainter({super.fit});
}
