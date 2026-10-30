import 'package:flutter/material.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';
import 'package:svg_painter_fixtures/svg_painter_fixtures.dart';

part 'transform_painter.g.dart';

@SvgCodePainter(mdnTransformExample)
class TransformPainter extends _$TransformPainter {
  const TransformPainter({super.fit});
}
