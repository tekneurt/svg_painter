import 'package:flutter/material.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';
import 'package:svg_painter_fixtures/svg_painter_fixtures.dart';

part 'german_flag_painter.g.dart';

@SvgCodePainter(
  wikimediaFlagOfGermany,
  exposureMode: SvgExposureMode.indexed,
  propertyMapping: <String, String>{
    'fill1': 'topColor',
    'fill2': 'middleColor',
    'fill3': 'bottomColor',
  },
)
class GermanFlagPainter extends _$GermanFlagPainter {
  const GermanFlagPainter({
    super.fit,
    super.topColor,
    super.middleColor,
    super.bottomColor,
  });
}
