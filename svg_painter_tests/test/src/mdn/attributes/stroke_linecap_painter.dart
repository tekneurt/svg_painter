import 'package:flutter/material.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';
import 'package:svg_painter_fixtures/svg_painter_fixtures.dart';

part 'stroke_linecap_painter.g.dart';

@SvgCodePainter(mdnStrokeLinecapExample)
class StrokeLinecapPainter extends _$StrokeLinecapPainter {
  const StrokeLinecapPainter({super.fit});
}

@SvgCodePainter(mdnStrokeLinecapButtExample)
class StrokeLinecapButtPainter extends _$StrokeLinecapButtPainter {
  const StrokeLinecapButtPainter({super.fit});
}

@SvgCodePainter(mdnStrokeLinecapRoundExample)
class StrokeLinecapRoundPainter extends _$StrokeLinecapRoundPainter {
  const StrokeLinecapRoundPainter({super.fit});
}

@SvgCodePainter(mdnStrokeLinecapSquareExample)
class StrokeLinecapSquarePainter extends _$StrokeLinecapSquarePainter {
  const StrokeLinecapSquarePainter({super.fit});
}