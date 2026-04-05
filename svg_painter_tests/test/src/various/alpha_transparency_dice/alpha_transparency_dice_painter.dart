import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';
import 'package:svg_painter_fixtures/svg_painter_fixtures.dart';

part 'alpha_transparency_dice_painter.g.dart';

@SvgPainter.code(variousAlphaTransparencyDice)
class AlphaTransparencyDicePainter extends _$AlphaTransparencyDicePainter {
  const AlphaTransparencyDicePainter({super.fit});
}

@SvgPainter.code(variousAlphaTransparencyDiceTransformed)
class AlphaTransparencyDiceTransformedPainter extends _$AlphaTransparencyDiceTransformedPainter {
  const AlphaTransparencyDiceTransformedPainter({super.fit});
}

@SvgPainter.code(variousAlphaTransparencyDiceDataUri)
class AlphaTransparencyDiceDataUriPainter extends _$AlphaTransparencyDiceDataUriPainter {
  const AlphaTransparencyDiceDataUriPainter({super.fit});
}
