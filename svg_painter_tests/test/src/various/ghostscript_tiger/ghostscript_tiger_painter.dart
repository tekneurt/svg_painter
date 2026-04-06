import 'package:flutter/material.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';
import 'package:svg_painter_fixtures/svg_painter_fixtures.dart';

part 'ghostscript_tiger_painter.g.dart';

@SvgPainter.code(variousGhostscriptTiger)
class GhostscriptTigerPainter extends _$GhostscriptTigerPainter {
  const GhostscriptTigerPainter({super.fit});
}

@SvgPainter.code(variousGhostscriptTigerTransformed)
class GhostscriptTigerTransformedPainter extends _$GhostscriptTigerTransformedPainter {
  const GhostscriptTigerTransformedPainter({super.fit});
}

@SvgPainter.code(variousGhostscriptTigerDataUri)
class GhostscriptTigerDataUriPainter extends _$GhostscriptTigerDataUriPainter {
  const GhostscriptTigerDataUriPainter({super.fit});
}
