import 'package:flutter/material.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';
import 'package:svg_painter_fixtures/svg_painter_fixtures.dart';

part 'title_painter.g.dart';

@SvgCodePainter(mdnTitleExample)
class TitlePainter extends _$TitlePainter {
  const TitlePainter({super.fit});
}
