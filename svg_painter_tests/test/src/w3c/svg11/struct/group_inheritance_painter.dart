import 'package:flutter/material.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';
import 'package:svg_painter_fixtures/svg_painter_fixtures.dart';

part 'group_inheritance_painter.g.dart';

@SvgCodePainter(
  w3cSvg11GroupInheritance,
  exposureMode: SvgExposureMode.id,
)
class GroupInheritancePainter extends _$GroupInheritancePainter {
  const GroupInheritancePainter({
    super.fit,
    super.group1Fill,
    super.group2Fill,
  });
}
