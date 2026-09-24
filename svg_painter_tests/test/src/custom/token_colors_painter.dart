import 'package:flutter/material.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';
import 'package:svg_painter_fixtures/svg_painter_fixtures.dart';

part 'token_colors_painter.g.dart';

@SvgCodePainter(customTokenColorsExample, tokenColors: true)
class TokenColorsPainter extends _$TokenColorsPainter {
  const TokenColorsPainter({super.fit, super.black, super.red});
}
