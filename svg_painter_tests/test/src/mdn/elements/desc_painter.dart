import 'package:flutter/material.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';
import 'package:svg_painter_fixtures/svg_painter_fixtures.dart';

part 'desc_painter.g.dart';

@SvgCodePainter(mdnDescExample)
class DescPainter extends _$DescPainter {
  const DescPainter({super.fit});
}
