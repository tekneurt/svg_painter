import 'package:flutter/material.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';
import 'package:svg_painter_fixtures/svg_painter_fixtures.dart';

part 'daphnia_mixed_painter.g.dart';

@SvgFilePainter(daphniaSvgPath, exposureMode: SvgExposureMode.mixed)
class DaphniaMixedPainter extends _$DaphniaMixedPainter {
  const DaphniaMixedPainter({super.fit, super.fill1, super.fill2, super.fill3});
}
