import 'package:flutter/material.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';
import 'package:svg_painter_fixtures/svg_painter_fixtures.dart';

part 'hex_color_mapping_painter.g.dart';

@SvgCodePainter(customTokenColorsExample, colorMapping: SvgColorMapping.hex)
class HexColorMappingPainter extends _$HexColorMappingPainter {
  const HexColorMappingPainter({super.fit});
}
