import 'package:flutter/material.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';

part 'view_box_1_painter.g.dart';

@SvgPainter.code('''
<svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
  <rect x="0" y="0" width="100%" height="100%" />
  <circle cx="50%" cy="50%" r="4" fill="white" />
</svg>
''')
class ViewBox1Painter extends _$ViewBox1Painter {}
