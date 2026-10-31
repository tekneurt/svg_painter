import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../test_utils.dart';
import 'pservers/pservers_grad_01_b_painter.dart';
import 'pservers/pservers_grad_02_b_painter.dart';
import 'pservers/pservers_grad_03_b_painter.dart';
import 'pservers/pservers_grad_04_b_painter.dart';
import 'pservers/pservers_grad_05_b_painter.dart';
import 'pservers/pservers_grad_06_b_painter.dart';
import 'pservers/pservers_grad_07_b_painter.dart';
import 'pservers/pservers_grad_08_b_painter.dart';
import 'pservers/pservers_grad_09_b_painter.dart';
import 'pservers/pservers_grad_10_b_painter.dart';
import 'pservers/pservers_grad_11_b_painter.dart';
import 'pservers/pservers_grad_12_b_painter.dart';
import 'pservers/pservers_grad_13_b_painter.dart';
import 'pservers/pservers_grad_14_b_painter.dart';

final List<({CustomPainter painter, String name, double? maxDiffPercent})> _fixtures =
    <({CustomPainter painter, String name, double? maxDiffPercent})>[
      (painter: const PserversGrad01BPainter(), name: 'pservers_grad_01_b', maxDiffPercent: 0.35),
      (painter: const PserversGrad02BPainter(), name: 'pservers_grad_02_b', maxDiffPercent: 0.30),
      (painter: const PserversGrad03BPainter(), name: 'pservers_grad_03_b', maxDiffPercent: 0.30),
      (painter: const PserversGrad04BPainter(), name: 'pservers_grad_04_b', maxDiffPercent: 0.50),
      (painter: const PserversGrad05BPainter(), name: 'pservers_grad_05_b', maxDiffPercent: 0.50),
      (painter: const PserversGrad06BPainter(), name: 'pservers_grad_06_b', maxDiffPercent: 0.35),
      (painter: const PserversGrad07BPainter(), name: 'pservers_grad_07_b', maxDiffPercent: 0.35),
      (painter: const PserversGrad08BPainter(), name: 'pservers_grad_08_b', maxDiffPercent: 0.30),
      (painter: const PserversGrad09BPainter(), name: 'pservers_grad_09_b', maxDiffPercent: 0.35),
      (painter: const PserversGrad10BPainter(), name: 'pservers_grad_10_b', maxDiffPercent: 0.40),
      (painter: const PserversGrad11BPainter(), name: 'pservers_grad_11_b', maxDiffPercent: 0.70),
      (painter: const PserversGrad12BPainter(), name: 'pservers_grad_12_b', maxDiffPercent: 0.50),
      (painter: const PserversGrad13BPainter(), name: 'pservers_grad_13_b', maxDiffPercent: 0.50),
      (painter: const PserversGrad14BPainter(), name: 'pservers_grad_14_b', maxDiffPercent: 0.50),
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
