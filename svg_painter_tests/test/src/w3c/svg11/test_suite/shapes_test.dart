import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../test_utils.dart';
import 'shapes/shapes_circle_01_t_painter.dart';
import 'shapes/shapes_circle_02_t_painter.dart';

final List<({CustomPainter painter, String name})> _fixtures =
    <({CustomPainter painter, String name})>[
      (painter: const ShapesCircle01TPainter(), name: 'shapes_circle_01_t'),
      (painter: const ShapesCircle02TPainter(), name: 'shapes_circle_02_t'),
    ];

void main() {
  setUpAll(() async {
    await loadTestFonts();
  });

  group('W3C SVG 1.1 Test Suite Shapes', () {
    for (final ({CustomPainter painter, String name}) fixture in _fixtures) {
      testWidgets(fixture.name, (WidgetTester tester) async {
        await testSvgPainterWithW3cDiff(
          tester: tester,
          painter: fixture.painter,
          testName: fixture.name,
        );
      });
    }
  });
}
