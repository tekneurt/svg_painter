import 'package:flutter/material.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';
import 'package:svg_painter_fixtures/svg_painter_fixtures.dart';

part 'dx_painter.g.dart';

@SvgCodePainter(mdnDxExample1)
class DxPainter extends _$DxPainter {
  const DxPainter({super.fit});
}

@SvgCodePainter(mdnDxExample2)
class Dx2Painter extends _$Dx2Painter {
  const Dx2Painter({super.fit});
}
