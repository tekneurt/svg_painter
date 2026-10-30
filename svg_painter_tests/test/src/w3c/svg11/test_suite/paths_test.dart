import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../test_utils.dart';
import 'paths/paths_data_01_t_painter.dart';
import 'paths/paths_data_02_t_painter.dart';
import 'paths/paths_data_03_f_painter.dart';
import 'paths/paths_data_04_t_painter.dart';
import 'paths/paths_data_05_t_painter.dart';
import 'paths/paths_data_06_t_painter.dart';
import 'paths/paths_data_07_t_painter.dart';
import 'paths/paths_data_08_t_painter.dart';
import 'paths/paths_data_09_t_painter.dart';
import 'paths/paths_data_10_t_painter.dart';
import 'paths/paths_data_12_t_painter.dart';
import 'paths/paths_data_13_t_painter.dart';
import 'paths/paths_data_14_t_painter.dart';
import 'paths/paths_data_15_t_painter.dart';
import 'paths/paths_data_16_t_painter.dart';
import 'paths/paths_data_17_f_painter.dart';
import 'paths/paths_data_18_f_painter.dart';
import 'paths/paths_data_19_f_painter.dart';
import 'paths/paths_data_20_f_painter.dart';

final List<({CustomPainter painter, String name, double? maxDiffPercent})> _fixtures =
    <({CustomPainter painter, String name, double? maxDiffPercent})>[
      (painter: const PathsData01TPainter(), name: 'paths_data_01_t', maxDiffPercent: 0.09),
      (painter: const PathsData02TPainter(), name: 'paths_data_02_t', maxDiffPercent: 0.11),
      (painter: const PathsData03FPainter(), name: 'paths_data_03_f', maxDiffPercent: 0.09),
      (painter: const PathsData04TPainter(), name: 'paths_data_04_t', maxDiffPercent: 0.08),
      (painter: const PathsData05TPainter(), name: 'paths_data_05_t', maxDiffPercent: 0.07),
      (painter: const PathsData06TPainter(), name: 'paths_data_06_t', maxDiffPercent: null),
      (painter: const PathsData07TPainter(), name: 'paths_data_07_t', maxDiffPercent: null),
      (painter: const PathsData08TPainter(), name: 'paths_data_08_t', maxDiffPercent: 0.09),
      (painter: const PathsData09TPainter(), name: 'paths_data_09_t', maxDiffPercent: 0.08),
      (painter: const PathsData10TPainter(), name: 'paths_data_10_t', maxDiffPercent: 0.13),
      (painter: const PathsData12TPainter(), name: 'paths_data_12_t', maxDiffPercent: null),
      (painter: const PathsData13TPainter(), name: 'paths_data_13_t', maxDiffPercent: null),
      (painter: const PathsData14TPainter(), name: 'paths_data_14_t', maxDiffPercent: null),
      (painter: const PathsData15TPainter(), name: 'paths_data_15_t', maxDiffPercent: null),
      (painter: const PathsData16TPainter(), name: 'paths_data_16_t', maxDiffPercent: null),
      (painter: const PathsData17FPainter(), name: 'paths_data_17_f', maxDiffPercent: null),
      (painter: const PathsData18FPainter(), name: 'paths_data_18_f', maxDiffPercent: null),
      (painter: const PathsData19FPainter(), name: 'paths_data_19_f', maxDiffPercent: 0.09),
      (painter: const PathsData20FPainter(), name: 'paths_data_20_f', maxDiffPercent: null),
    ];

void main() {
  setUpAll(() async {
    await loadTestFonts();
  });

  group('W3C SVG 1.1 Test Suite Paths', () {
    for (final ({CustomPainter painter, String name, double? maxDiffPercent}) fixture
        in _fixtures) {
      testWidgets(fixture.name, (WidgetTester tester) async {
        await testSvgPainterWithW3cDiff(
          tester: tester,
          painter: fixture.painter,
          testName: fixture.name,
          folder: 'paths',
          maxDiffPercent: fixture.maxDiffPercent ?? 0.06,
        );
      });
    }
  });
}
