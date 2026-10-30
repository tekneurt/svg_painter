import 'package:flutter/material.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';
import 'package:svg_painter_fixtures/svg_painter_fixtures.dart';

part 'fr_painter.g.dart';

@SvgCodePainter(mdnFrExample1)
class Fr1Painter extends _$Fr1Painter {
  const Fr1Painter({super.fit});
}

@SvgCodePainter(mdnFrExample2)
class Fr2Painter extends _$Fr2Painter {
  const Fr2Painter({super.fit});
}
