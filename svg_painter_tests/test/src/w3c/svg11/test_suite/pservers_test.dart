import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../test_utils.dart';
import 'pservers/pservers_grad_01_b_painter.dart';
import 'pservers/pservers_grad_02_b_painter.dart';
import 'pservers/pservers_grad_03_b_painter.dart';

final List<({CustomPainter painter, String name, double? maxDiffPercent})> _fixtures =
    <({CustomPainter painter, String name, double? maxDiffPercent})>[
      (painter: const PserversGrad01BPainter(), name: 'pservers_grad_01_b', maxDiffPercent: 0.35),
      (painter: const PserversGrad02BPainter(), name: 'pservers_grad_02_b', maxDiffPercent: 0.30),
      (painter: const PserversGrad03BPainter(), name: 'pservers_grad_03_b', maxDiffPercent: 0.30),
    ];

void main() {
  setUpAll(() async {
    await loadTestFonts();
  });

  group('W3C SVG 1.1 Test Suite Pservers', () {
    for (final ({CustomPainter painter, String name, double? maxDiffPercent}) fixture
        in _fixtures) {
      testWidgets(fixture.name, (WidgetTester tester) async {
        await testSvgPainterWithW3cDiff(
          tester: tester,
          painter: fixture.painter,
          testName: fixture.name,
          folder: 'pservers',
          maxDiffPercent: fixture.maxDiffPercent ?? 0.06,
        );
      });
    }
  });
}
