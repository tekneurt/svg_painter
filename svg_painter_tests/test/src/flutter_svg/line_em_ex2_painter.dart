import 'package:flutter/material.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';
import 'package:svg_painter_fixtures/svg_painter_fixtures.dart';

part 'line_em_ex2_painter.g.dart';

@SvgCodePainter(
  flutterSvgLineEmEx2Svg,
  theme: SvgTheme(fontSize: 300.0, xHeight: 100.0),
)
class LineEmEx2Painter extends _$LineEmEx2Painter {
  const LineEmEx2Painter({super.fit});
}
