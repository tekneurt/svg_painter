import 'package:flutter/material.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';
import 'package:svg_painter_fixtures/svg_painter_fixtures.dart';

part 'svg_painter.g.dart';

@SvgCodePainter(mdnSvg1Example)
class Svg1Painter extends _$Svg1Painter {
  const Svg1Painter({super.fit});
}

@SvgCodePainter(mdnSvg2Example)
class Svg2Painter extends _$Svg2Painter {
  const Svg2Painter({super.fit});
}