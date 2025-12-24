import 'package:flutter/material.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';

part 'stroke_width_painter.g.dart';

@SvgPainter.code('''
<svg viewBox="0 0 30 10" xmlns="http://www.w3.org/2000/svg">
  <!-- Default stroke width: 1 -->
  <circle cx="5" cy="5" r="3" stroke="green" />

  <!-- Stroke width as a number -->
  <circle cx="15" cy="5" r="3" stroke="green" stroke-width="3" />

  <!-- Stroke width as a percentage -->
  <circle cx="25" cy="5" r="3" stroke="green" stroke-width="2%" />
</svg>
''')
class StrokeWidthPainter extends _$StrokeWidthPainter {}
