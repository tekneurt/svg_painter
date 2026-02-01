import 'package:flutter/material.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';
import 'package:svg_painter_fixtures/svg_painter_fixtures.dart';

part 'daphnia_id_painter.g.dart';

@SvgFilePainter(daphniaSvgPath, exposureMode: SvgExposureMode.id)
class DaphniaIdPainter extends _$DaphniaIdPainter {
  const DaphniaIdPainter({super.fit});
}
