import 'package:flutter/material.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';
import 'package:svg_painter_fixtures/svg_painter_fixtures.dart';

part 'rect_em_ex_painter.g.dart';

@SvgCodePainter(
  flutterSvgRectEmExSvg,
  theme: SvgTheme(fontSize: 100.0),
)
class RectEmExPainter extends _$RectEmExPainter {
  const RectEmExPainter({super.fit});
}
