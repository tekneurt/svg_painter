import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../test_utils.dart';
import 'color/color_prop_02_f_painter.dart';
import 'color/color_prop_03_t_painter.dart';

final List<({CustomPainter painter, String name, double? maxDiffPercent})> _fixtures =
    <({CustomPainter painter, String name, double? maxDiffPercent})>[
      (painter: const ColorProp02FPainter(), name: 'color_prop_02_f', maxDiffPercent: 0.07),
      (painter: const ColorProp03TPainter(), name: 'color_prop_03_t', maxDiffPercent: null),
    ];

void main() {
  setUpAll(() async {
    await loadTestFonts();
  });

  group('W3C SVG 1.1 Test Suite Color', () {
    for (final ({CustomPainter painter, String name, double? maxDiffPercent}) fixture
        in _fixtures) {
      testWidgets(fixture.name, (WidgetTester tester) async {
        await testSvgPainterWithW3cDiff(
          tester: tester,
          painter: fixture.painter,
          testName: fixture.name,
          folder: 'color',
          maxDiffPercent: fixture.maxDiffPercent ?? 0.06,
        );
      });
    }
  });
}
