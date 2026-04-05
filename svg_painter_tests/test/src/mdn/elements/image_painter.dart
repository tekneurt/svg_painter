import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';
import 'package:svg_painter_fixtures/svg_painter_fixtures.dart';

part 'image_painter.g.dart';

@SvgPainter.code(mdnImageExample)
class MdnImagePainter extends _$MdnImagePainter {
  const MdnImagePainter({super.fit});
}
