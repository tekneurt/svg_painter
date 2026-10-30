import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';
import 'package:svg_painter_fixtures/svg_painter_fixtures.dart';

part 'filter_painter.g.dart';

@SvgCodePainter(mdnFilterExample)
class FilterPainter extends _$FilterPainter {
  const FilterPainter({super.fit});
}
