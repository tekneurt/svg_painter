import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../test_utils.dart';
import 'render/render_elems_01_t_painter.dart';
import 'render/render_elems_02_t_painter.dart';
import 'render/render_elems_03_t_painter.dart';
import 'render/render_elems_06_t_painter.dart';
import 'render/render_elems_07_t_painter.dart';
import 'render/render_elems_08_t_painter.dart';

final List<({CustomPainter painter, String name, double? maxDiffPercent})> _fixtures =
    <({CustomPainter painter, String name, double? maxDiffPercent})>[
      (
        painter: const RenderElems01TPainter(),
        name: 'render_elems_01_t',
        maxDiffPercent: null,
      ),
      (
        painter: const RenderElems02TPainter(),
        name: 'render_elems_02_t',
        maxDiffPercent: null,
      ),
      (
        painter: const RenderElems03TPainter(),
        name: 'render_elems_03_t',
        maxDiffPercent: 0.08,
      ),
      (
        painter: const RenderElems06TPainter(),
        name: 'render_elems_06_t',
        maxDiffPercent: null,
      ),
      (
        painter: const RenderElems07TPainter(),
        name: 'render_elems_07_t',
        maxDiffPercent: 0.08,
      ),
      (
        painter: const RenderElems08TPainter(),
        name: 'render_elems_08_t',
        maxDiffPercent: 0.08,
      ),
    ];

void main() {
  setUpAll(() async {
    await loadTestFonts();
  });

  group('W3C SVG 1.1 Test Suite Render', () {
    for (final ({CustomPainter painter, String name, double? maxDiffPercent}) fixture
        in _fixtures) {
      testWidgets(fixture.name, (WidgetTester tester) async {
        await testSvgPainterWithW3cDiff(
          tester: tester,
          painter: fixture.painter,
          testName: fixture.name,
          folder: 'render',
          maxDiffPercent: fixture.maxDiffPercent ?? 0.06,
        );
      });
    }
  });
}
