import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../test_utils.dart';
import 'shapes/shapes_circle_01_t_painter.dart';
import 'shapes/shapes_circle_02_t_painter.dart';
import 'shapes/shapes_ellipse_01_t_painter.dart';
import 'shapes/shapes_ellipse_02_t_painter.dart';
import 'shapes/shapes_ellipse_03_f_painter.dart';
import 'shapes/shapes_grammar_01_f_painter.dart';
import 'shapes/shapes_intro_01_t_painter.dart';
import 'shapes/shapes_intro_02_f_painter.dart';

final List<({CustomPainter painter, String name, double? maxDiffPercent})> _fixtures =
    <({CustomPainter painter, String name, double? maxDiffPercent})>[
      (painter: const ShapesCircle01TPainter(), name: 'shapes_circle_01_t', maxDiffPercent: null),
      (painter: const ShapesCircle02TPainter(), name: 'shapes_circle_02_t', maxDiffPercent: null),
      (painter: const ShapesEllipse01TPainter(), name: 'shapes_ellipse_01_t', maxDiffPercent: null),
      (painter: const ShapesEllipse02TPainter(), name: 'shapes_ellipse_02_t', maxDiffPercent: null),
      (painter: const ShapesEllipse03FPainter(), name: 'shapes_ellipse_03_f', maxDiffPercent: null),
      (painter: const ShapesGrammar01FPainter(), name: 'shapes_grammar_01_f', maxDiffPercent: null),
      (painter: const ShapesIntro01TPainter(), name: 'shapes_intro_01_t', maxDiffPercent: 0.08),
      (painter: const ShapesIntro02FPainter(), name: 'shapes_intro_02_f', maxDiffPercent: null),
    ];

void main() {
  setUpAll(() async {
    await loadTestFonts();
  });

  group('W3C SVG 1.1 Test Suite Shapes', () {
    for (final ({CustomPainter painter, String name, double? maxDiffPercent}) fixture in _fixtures) {
      testWidgets(fixture.name, (WidgetTester tester) async {
        await testSvgPainterWithW3cDiff(
          tester: tester,
          painter: fixture.painter,
          testName: fixture.name,
          maxDiffPercent: fixture.maxDiffPercent ?? 0.06,
        );
      });
    }
  });
}
