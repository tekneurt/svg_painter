import 'package:flutter/material.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';
import 'package:svg_painter_fixtures/svg_painter_fixtures.dart';

part 'daphnia_painter.g.dart';

@SvgFilePainter(daphniaSvgPath)
class DaphniaPainter extends _$DaphniaPainter {
  const DaphniaPainter({super.fit});
}
