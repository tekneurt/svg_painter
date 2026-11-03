import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../test_utils.dart';
import 'coords/coords_trans_01_b_painter.dart';
import 'coords/coords_trans_02_t_painter.dart';
import 'coords/coords_trans_03_t_painter.dart';
import 'coords/coords_trans_04_t_painter.dart';
import 'coords/coords_trans_05_t_painter.dart';
import 'coords/coords_trans_06_t_painter.dart';
import 'coords/coords_trans_07_t_painter.dart';
import 'coords/coords_trans_08_t_painter.dart';
import 'coords/coords_trans_09_t_painter.dart';
import 'coords/coords_transformattr_01_f_painter.dart';
import 'coords/coords_units_01_b_painter.dart';
import 'coords/coords_viewattr_01_b_painter.dart';

final List<({CustomPainter painter, String name, double? maxDiffPercent})> _fixtures =
    <({CustomPainter painter, String name, double? maxDiffPercent})>[
      (painter: const CoordsTrans01BPainter(), name: 'coords_trans_01_b', maxDiffPercent: 0.08),
      (painter: const CoordsTrans02TPainter(), name: 'coords_trans_02_t', maxDiffPercent: null),
      (painter: const CoordsTrans03TPainter(), name: 'coords_trans_03_t', maxDiffPercent: null),
      (painter: const CoordsTrans04TPainter(), name: 'coords_trans_04_t', maxDiffPercent: null),
      (painter: const CoordsTrans05TPainter(), name: 'coords_trans_05_t', maxDiffPercent: 0.07),
      (painter: const CoordsTrans06TPainter(), name: 'coords_trans_06_t', maxDiffPercent: 0.07),
      (painter: const CoordsTrans07TPainter(), name: 'coords_trans_07_t', maxDiffPercent: null),
      (painter: const CoordsTrans08TPainter(), name: 'coords_trans_08_t', maxDiffPercent: null),
      (painter: const CoordsTrans09TPainter(), name: 'coords_trans_09_t', maxDiffPercent: 0.12),
      (
        painter: const CoordsTransformattr01FPainter(),
        name: 'coords_transformattr_01_f',
        maxDiffPercent: null,
      ),
      (painter: const CoordsUnits01BPainter(), name: 'coords_units_01_b', maxDiffPercent: 0.16),
      (
        painter: const CoordsViewattr01BPainter(),
        name: 'coords_viewattr_01_b',
        maxDiffPercent: 0.18,
      ),
    ];

void main() {
  setUpAll(() async {
    await loadTestFonts();
  });

  group('W3C SVG 1.1 Test Suite Coords', () {
    for (final ({CustomPainter painter, String name, double? maxDiffPercent}) fixture
        in _fixtures) {
      testWidgets(fixture.name, (WidgetTester tester) async {
        await testSvgPainterWithW3cDiff(
          tester: tester,
          painter: fixture.painter,
          testName: fixture.name,
          folder: 'coords',
          maxDiffPercent: fixture.maxDiffPercent ?? 0.06,
        );
      });
    }
  });
}
