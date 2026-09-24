import 'package:flutter/material.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';
import 'package:svg_painter_fixtures/svg_painter_fixtures.dart';

part 'dy_painter.g.dart';

@SvgCodePainter(mdnDyExample1)
class DyPainter extends _$DyPainter {
  const DyPainter({super.fit});
}

@SvgCodePainter(mdnDyExample2)
class Dy2Painter extends _$Dy2Painter {
  const Dy2Painter({super.fit});
}
