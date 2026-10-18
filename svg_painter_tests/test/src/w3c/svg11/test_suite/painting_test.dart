import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../test_utils.dart';
import 'painting/painting_control_01_f_painter.dart';
import 'painting/painting_control_02_f_painter.dart';
import 'painting/painting_control_03_f_painter.dart';
import 'painting/painting_control_04_f_painter.dart';
import 'painting/painting_control_05_f_painter.dart';
import 'painting/painting_control_06_f_painter.dart';
import 'painting/painting_fill_01_t_painter.dart';
import 'painting/painting_fill_02_t_painter.dart';
import 'painting/painting_fill_03_t_painter.dart';
import 'painting/painting_fill_04_t_painter.dart';
import 'painting/painting_fill_05_b_painter.dart';
import 'painting/painting_marker_01_f_painter.dart';
import 'painting/painting_marker_02_f_painter.dart';
import 'painting/painting_marker_03_f_painter.dart';
import 'painting/painting_marker_04_f_painter.dart';
import 'painting/painting_marker_05_f_painter.dart';
import 'painting/painting_marker_06_f_painter.dart';
import 'painting/painting_marker_07_f_painter.dart';
import 'painting/painting_stroke_01_t_painter.dart';
import 'painting/painting_stroke_02_t_painter.dart';
import 'painting/painting_stroke_03_t_painter.dart';
import 'painting/painting_stroke_04_t_painter.dart';
import 'painting/painting_stroke_05_t_painter.dart';
import 'painting/painting_stroke_06_t_painter.dart';
import 'painting/painting_stroke_07_t_painter.dart';
import 'painting/painting_stroke_08_t_painter.dart';
import 'painting/painting_stroke_09_t_painter.dart';
import 'painting/painting_stroke_10_t_painter.dart';

final List<({CustomPainter painter, String name, double? maxDiffPercent})>
_fixtures = <({CustomPainter painter, String name, double? maxDiffPercent})>[
  (painter: const PaintingControl01FPainter(), name: 'painting_control_01_f', maxDiffPercent: null),
  (painter: const PaintingControl02FPainter(), name: 'painting_control_02_f', maxDiffPercent: null),
  (painter: const PaintingControl03FPainter(), name: 'painting_control_03_f', maxDiffPercent: null),
  (painter: const PaintingControl04FPainter(), name: 'painting_control_04_f', maxDiffPercent: null),
  (painter: const PaintingControl05FPainter(), name: 'painting_control_05_f', maxDiffPercent: 0.07),
  (painter: const PaintingControl06FPainter(), name: 'painting_control_06_f', maxDiffPercent: null),
  (painter: const PaintingFill01TPainter(), name: 'painting_fill_01_t', maxDiffPercent: 0.11),
  (painter: const PaintingFill02TPainter(), name: 'painting_fill_02_t', maxDiffPercent: 0.10),
  (painter: const PaintingFill03TPainter(), name: 'painting_fill_03_t', maxDiffPercent: 0.10),
  (painter: const PaintingFill04TPainter(), name: 'painting_fill_04_t', maxDiffPercent: null),
  (painter: const PaintingFill05BPainter(), name: 'painting_fill_05_b', maxDiffPercent: 0.08),
  (painter: const PaintingMarker01FPainter(), name: 'painting_marker_01_f', maxDiffPercent: 0.08),
  (painter: const PaintingMarker02FPainter(), name: 'painting_marker_02_f', maxDiffPercent: 0.12),
  (painter: const PaintingMarker03FPainter(), name: 'painting_marker_03_f', maxDiffPercent: 0.12),
  (painter: const PaintingMarker04FPainter(), name: 'painting_marker_04_f', maxDiffPercent: 0.12),
  (painter: const PaintingMarker05FPainter(), name: 'painting_marker_05_f', maxDiffPercent: 0.12),
  (painter: const PaintingMarker06FPainter(), name: 'painting_marker_06_f', maxDiffPercent: 0.08),
  (painter: const PaintingMarker07FPainter(), name: 'painting_marker_07_f', maxDiffPercent: 0.10),
  (painter: const PaintingStroke01TPainter(), name: 'painting_stroke_01_t', maxDiffPercent: 0.10),
  (painter: const PaintingStroke02TPainter(), name: 'painting_stroke_02_t', maxDiffPercent: 0.13),
  (painter: const PaintingStroke03TPainter(), name: 'painting_stroke_03_t', maxDiffPercent: 0.13),
  (painter: const PaintingStroke04TPainter(), name: 'painting_stroke_04_t', maxDiffPercent: 0.12),
  (painter: const PaintingStroke05TPainter(), name: 'painting_stroke_05_t', maxDiffPercent: 0.11),
  (painter: const PaintingStroke06TPainter(), name: 'painting_stroke_06_t', maxDiffPercent: 0.09),
  (painter: const PaintingStroke07TPainter(), name: 'painting_stroke_07_t', maxDiffPercent: 0.08),
  (painter: const PaintingStroke08TPainter(), name: 'painting_stroke_08_t', maxDiffPercent: 0.07),
  (painter: const PaintingStroke09TPainter(), name: 'painting_stroke_09_t', maxDiffPercent: null),
  (painter: const PaintingStroke10TPainter(), name: 'painting_stroke_10_t', maxDiffPercent: 0.07),
];

void main() {
  setUpAll(() async {
    await loadTestFonts();
  });

  group('W3C SVG 1.1 Test Suite Painting', () {
    for (final ({CustomPainter painter, String name, double? maxDiffPercent}) fixture
        in _fixtures) {
      testWidgets(fixture.name, (WidgetTester tester) async {
        await testSvgPainterWithW3cDiff(
          tester: tester,
          painter: fixture.painter,
          testName: fixture.name,
          folder: 'painting',
          maxDiffPercent: fixture.maxDiffPercent ?? 0.06,
        );
      });
    }
  });
}
