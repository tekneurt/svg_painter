import 'package:flutter/widgets.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';
import 'package:svg_painter_fixtures/svg_painter_fixtures.dart';

part 'circle_painter.g.dart';

@SvgCodePainter(mdnCircleExample)
class CirclePainter extends _$CirclePainter {
  const CirclePainter({super.fit});
}
