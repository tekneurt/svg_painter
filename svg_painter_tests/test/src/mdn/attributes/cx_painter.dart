import 'package:flutter/material.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';
import 'package:svg_painter_fixtures/svg_painter_fixtures.dart';

part 'cx_painter.g.dart';

@SvgCodePainter(mdnCxExample)
class CxPainter extends _$CxPainter {
  const CxPainter({super.fit});
}

@SvgCodePainter(mdnCxRadialGradientExample)
class CxRadialGradientPainter extends _$CxRadialGradientPainter {
  const CxRadialGradientPainter({super.fit});
}
