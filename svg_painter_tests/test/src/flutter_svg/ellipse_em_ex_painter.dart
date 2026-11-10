import 'package:flutter/material.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';
import 'package:svg_painter_fixtures/svg_painter_fixtures.dart';

part 'ellipse_em_ex_painter.g.dart';

@SvgCodePainter(
  flutterSvgEllipseEmExSvg,
  theme: SvgTheme(fontSize: 100.0),
)
class EllipseEmExPainter extends _$EllipseEmExPainter {
  const EllipseEmExPainter({super.fit});
}
