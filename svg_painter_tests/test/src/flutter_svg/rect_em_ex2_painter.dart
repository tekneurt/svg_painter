import 'package:flutter/material.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';
import 'package:svg_painter_fixtures/svg_painter_fixtures.dart';

part 'rect_em_ex2_painter.g.dart';

@SvgCodePainter(
  flutterSvgRectEmEx2Svg,
  theme: SvgTheme(fontSize: 300.0, xHeight: 100.0),
)
class RectEmEx2Painter extends _$RectEmEx2Painter {
  const RectEmEx2Painter({super.fit});
}
