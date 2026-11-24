import 'package:flutter/material.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';
import 'package:svg_painter_fixtures/svg_painter_fixtures.dart';

part 'flutter_logo_painter.g.dart';

@SvgCodePainter(flutterSvgLogoSvg)
class FlutterLogoPainter extends _$FlutterLogoPainter {
  const FlutterLogoPainter({super.fit});
}
