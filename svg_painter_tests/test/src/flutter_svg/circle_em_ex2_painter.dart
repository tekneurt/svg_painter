import 'package:flutter/material.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';
import 'package:svg_painter_fixtures/svg_painter_fixtures.dart';

part 'circle_em_ex2_painter.g.dart';

@SvgCodePainter(
  flutterSvgCircleEmEx2Svg,
  theme: SvgTheme(fontSize: 1500.0, xHeight: 600.0),
)
class CircleEmEx2Painter extends _$CircleEmEx2Painter {
  const CircleEmEx2Painter({super.fit});
}
