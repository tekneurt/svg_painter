import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';
import 'package:svg_painter_fixtures/svg_painter_fixtures.dart';

part 'std_deviation_painter.g.dart';

@SvgCodePainter(mdnStdDeviationExample)
class StdDeviationPainter extends _$StdDeviationPainter {
  const StdDeviationPainter({super.fit});
}
