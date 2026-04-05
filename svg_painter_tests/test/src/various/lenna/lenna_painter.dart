import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';
import 'package:svg_painter_fixtures/svg_painter_fixtures.dart';

part 'lenna_painter.g.dart';

@SvgPainter.code(variousLennaJpg)
class LennaPainter extends _$LennaPainter {
  const LennaPainter({super.fit});
}

@SvgPainter.code(variousLennaJpgTransformed)
class LennaTransformedPainter extends _$LennaTransformedPainter {
  const LennaTransformedPainter({super.fit});
}

@SvgPainter.code(variousLennaJpgDataUri)
class LennaDataUriPainter extends _$LennaDataUriPainter {
  const LennaDataUriPainter({super.fit});
}
