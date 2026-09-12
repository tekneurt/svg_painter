import 'package:flutter/material.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';
import 'package:svg_painter_fixtures/svg_painter_fixtures.dart';

part 'paint_order_painter.g.dart';

@SvgCodePainter(mdnPaintOrderExample)
class PaintOrderPainter extends _$PaintOrderPainter {
  const PaintOrderPainter({super.fit});
}
