import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../test_utils.dart';
import 'coords/coords_coord_01_t_painter.dart';
import 'coords/coords_coord_02_t_painter.dart';
import 'coords/coords_trans_01_b_painter.dart';
import 'coords/coords_trans_02_t_painter.dart';
import 'coords/coords_trans_03_t_painter.dart';
import 'coords/coords_trans_04_t_painter.dart';
import 'coords/coords_trans_05_t_painter.dart';
import 'coords/coords_trans_06_t_painter.dart';
import 'coords/coords_trans_07_t_painter.dart';
import 'coords/coords_trans_08_t_painter.dart';
import 'coords/coords_trans_09_t_painter.dart';
import 'coords/coords_trans_10_f_painter.dart';
import 'coords/coords_trans_11_f_painter.dart';
import 'coords/coords_trans_12_f_painter.dart';
import 'coords/coords_trans_13_f_painter.dart';
import 'coords/coords_trans_14_f_painter.dart';
import 'coords/coords_transformattr_01_f_painter.dart';
import 'coords/coords_transformattr_02_f_painter.dart';
import 'coords/coords_transformattr_03_f_painter.dart';
import 'coords/coords_transformattr_04_f_painter.dart';
import 'coords/coords_transformattr_05_f_painter.dart';
import 'coords/coords_units_01_b_painter.dart';
import 'coords/coords_units_02_b_painter.dart';
import 'coords/coords_units_03_b_painter.dart';
import 'coords/coords_viewattr_01_b_painter.dart';
import 'coords/coords_viewattr_02_b_painter.dart';

class _CoordsFixture {
  const _CoordsFixture({
    required this.painter,
    required this.name,
    this.maxDiffPercent,
    this.widget,
  });

  final CustomPainter painter;
  final String name;
  final double? maxDiffPercent;
  final Widget? widget;
}

final List<_CoordsFixture> _fixtures = <_CoordsFixture>[
  const _CoordsFixture(painter: CoordsCoord01TPainter(), name: 'coords_coord_01_t'),
  const _CoordsFixture(painter: CoordsCoord02TPainter(), name: 'coords_coord_02_t'),
  const _CoordsFixture(painter: CoordsTrans01BPainter(), name: 'coords_trans_01_b', maxDiffPercent: 0.08),
  const _CoordsFixture(painter: CoordsTrans02TPainter(), name: 'coords_trans_02_t'),
  const _CoordsFixture(painter: CoordsTrans03TPainter(), name: 'coords_trans_03_t'),
  const _CoordsFixture(painter: CoordsTrans04TPainter(), name: 'coords_trans_04_t'),
  const _CoordsFixture(painter: CoordsTrans05TPainter(), name: 'coords_trans_05_t', maxDiffPercent: 0.07),
  const _CoordsFixture(painter: CoordsTrans06TPainter(), name: 'coords_trans_06_t', maxDiffPercent: 0.07),
  const _CoordsFixture(painter: CoordsTrans07TPainter(), name: 'coords_trans_07_t'),
  const _CoordsFixture(painter: CoordsTrans08TPainter(), name: 'coords_trans_08_t'),
  const _CoordsFixture(painter: CoordsTrans09TPainter(), name: 'coords_trans_09_t', maxDiffPercent: 0.12),
  const _CoordsFixture(painter: CoordsTrans10FPainter(), name: 'coords_trans_10_f'),
  const _CoordsFixture(painter: CoordsTrans11FPainter(), name: 'coords_trans_11_f', maxDiffPercent: 0.08),
  const _CoordsFixture(painter: CoordsTrans12FPainter(), name: 'coords_trans_12_f'),
  const _CoordsFixture(painter: CoordsTrans13FPainter(), name: 'coords_trans_13_f'),
  const _CoordsFixture(painter: CoordsTrans14FPainter(), name: 'coords_trans_14_f'),
  const _CoordsFixture(
    painter: CoordsTransformattr01FPainter(),
    name: 'coords_transformattr_01_f',
  ),
  const _CoordsFixture(
    painter: CoordsTransformattr02FPainter(),
    name: 'coords_transformattr_02_f',
  ),
  const _CoordsFixture(
    painter: CoordsTransformattr03FPainter(),
    name: 'coords_transformattr_03_f',
  ),
  const _CoordsFixture(
    painter: CoordsTransformattr04FPainter(),
    name: 'coords_transformattr_04_f',
  ),
  const _CoordsFixture(
    painter: CoordsTransformattr05FPainter(),
    name: 'coords_transformattr_05_f',
  ),
  const _CoordsFixture(painter: CoordsUnits01BPainter(), name: 'coords_units_01_b', maxDiffPercent: 0.16),
  const _CoordsFixture(painter: CoordsUnits02BPainter(), name: 'coords_units_02_b', maxDiffPercent: 0.14),
  const _CoordsFixture(painter: CoordsUnits03BPainter(), name: 'coords_units_03_b', maxDiffPercent: 0.12),
  const _CoordsFixture(
    painter: CoordsViewattr01BPainter(),
    name: 'coords_viewattr_01_b',
    maxDiffPercent: 0.18,
  ),
  const _CoordsFixture(
    painter: CoordsViewattr02BPainter(),
    widget: CoordsViewattr02BPainterWidget(),
    name: 'coords_viewattr_02_b',
    maxDiffPercent: 0.16,
  ),
];

void main() {
  setUpAll(() async {
    await loadTestFonts();
  });

  group('W3C SVG 1.1 Test Suite Coords', () {
    for (final _CoordsFixture fixture in _fixtures) {
      testWidgets(fixture.name, (WidgetTester tester) async {
        await testSvgPainterWithW3cDiff(
          tester: tester,
          painter: fixture.painter,
          widget: fixture.widget,
          testName: fixture.name,
          folder: 'coords',
          maxDiffPercent: fixture.maxDiffPercent ?? 0.06,
        );
      });
    }
  });
}
