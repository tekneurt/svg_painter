
import 'package:flutter/material.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';
import 'package:svg_painter_fixtures/svg_painter_fixtures.dart';

part 'mask_painter.g.dart';

@SvgCodePainter(maskExample)
class MaskPainter extends _$MaskPainter {
  const MaskPainter();
}

@SvgCodePainter(maskUnitsExample)
class MaskUnitsPainter extends _$MaskUnitsPainter {
  const MaskUnitsPainter();
}

@SvgCodePainter(maskContentUnitsExample)
class MaskContentUnitsPainter extends _$MaskContentUnitsPainter {
  const MaskContentUnitsPainter();
}
