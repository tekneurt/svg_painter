import 'package:flutter/material.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';
import 'package:svg_painter_fixtures/svg_painter_fixtures.dart';

part 'daphnia_indexed_painter.g.dart';

@SvgFilePainter(daphniaSvgPath, exposureMode: SvgExposureMode.indexed)
class DaphniaIndexedPainter extends _$DaphniaIndexedPainter {
  const DaphniaIndexedPainter({super.fit, super.fill1, super.fill2, super.fill3});
}
