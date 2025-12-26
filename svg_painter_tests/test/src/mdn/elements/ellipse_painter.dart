import 'package:flutter/material.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';
import 'package:svg_painter_fixtures/svg_painter_fixtures.dart';

part 'ellipse_painter.g.dart';

@SvgCodePainter(mdnEllipseExample)
class EllipsePainter extends _$EllipsePainter {
  const EllipsePainter({super.fit});
}
