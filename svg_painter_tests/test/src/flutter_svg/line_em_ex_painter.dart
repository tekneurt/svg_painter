import 'package:flutter/material.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';
import 'package:svg_painter_fixtures/svg_painter_fixtures.dart';

part 'line_em_ex_painter.g.dart';

@SvgCodePainter(
  flutterSvgLineEmExSvg,
  theme: SvgTheme(fontSize: 100.0),
)
class LineEmExPainter extends _$LineEmExPainter {
  const LineEmExPainter({super.fit});
}
