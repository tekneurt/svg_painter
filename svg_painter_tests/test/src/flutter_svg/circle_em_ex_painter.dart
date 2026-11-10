import 'package:flutter/material.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';
import 'package:svg_painter_fixtures/svg_painter_fixtures.dart';

part 'circle_em_ex_painter.g.dart';

@SvgCodePainter(
  flutterSvgCircleEmExSvg,
  theme: SvgTheme(fontSize: 600.0),
)
class CircleEmExPainter extends _$CircleEmExPainter {
  const CircleEmExPainter({super.fit});
}
