import 'package:flutter/material.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';
import 'package:svg_painter_fixtures/svg_painter_fixtures.dart';

part 'd_painter.g.dart';

@SvgCodePainter(mdnDExample)
class DExamplePainter extends _$DExamplePainter {
  const DExamplePainter({super.fit});
}

@SvgCodePainter(mdnDMoveToExample)
class DMoveToPainter extends _$DMoveToPainter {
  const DMoveToPainter({super.fit});
}

@SvgCodePainter(mdnDLineToExample)
class DLineToPainter extends _$DLineToPainter {
  const DLineToPainter({super.fit});
}

@SvgCodePainter(mdnDCubicBezierExample)
class DCubicBezierPainter extends _$DCubicBezierPainter {
  const DCubicBezierPainter({super.fit});
}

@SvgCodePainter(mdnDQuadraticBezierExample)
class DQuadraticBezierPainter extends _$DQuadraticBezierPainter {
  const DQuadraticBezierPainter({super.fit});
}

@SvgCodePainter(mdnDEllipticalArcExample)
class DEllipticalArcPainter extends _$DEllipticalArcPainter {
  const DEllipticalArcPainter({super.fit});
}

@SvgCodePainter(mdnDClosePathExample)
class DClosePathPainter extends _$DClosePathPainter {
  const DClosePathPainter({super.fit});
}
