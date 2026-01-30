import 'package:flutter/material.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';
import 'package:svg_painter_fixtures/svg_painter_fixtures.dart';

part 'french_flag_painter.g.dart';

@SvgCodePainter(
  wikimediaFlagOfFrance,
  exposureMode: SvgExposureMode.indexed,
  propertyMapping: {
    'fill1': 'leftColor',
    'fill3': 'middleColor',
    'fill2': 'rightColor',
  },
)
class FrenchFlagPainter extends _$FrenchFlagPainter {
  const FrenchFlagPainter({
    super.fit,
    super.leftColor,
    super.middleColor,
    super.rightColor,
  });
}
