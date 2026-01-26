// ignore_for_file: unused_element

import 'package:svg_painter_annotation/svg_painter_annotation.dart';

part 'example.g.dart';

/// Generate a CustomPainter from an SVG file:
@SvgPainter.file('assets/icons/star.svg')
class _StarPainter {}

/// Or generate from inline SVG code:
@SvgPainter.code('''
<svg viewBox="0 0 24 24">
  <circle cx="12" cy="12" r="10" fill="red"/>
</svg>
''')
class _DotPainter {}

// Run `dart run build_runner build` to generate the painters.
// The generated StarPainter and DotPainter extend CustomPainter.
