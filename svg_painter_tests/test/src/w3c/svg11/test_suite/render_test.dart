import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../test_utils.dart';
import 'render/render_elems_01_t_painter.dart';
import 'render/render_elems_02_t_painter.dart';
import 'render/render_elems_03_t_painter.dart';
import 'render/render_elems_06_t_painter.dart';
import 'render/render_elems_07_t_painter.dart';
import 'render/render_elems_08_t_painter.dart';
import 'render/render_groups_01_b_painter.dart';
import 'render/render_groups_03_t_painter.dart';

class _RenderFixture {
  const _RenderFixture({
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

final List<_RenderFixture> _fixtures = <_RenderFixture>[
  const _RenderFixture(
    painter: RenderElems01TPainter(),
    name: 'render_elems_01_t',
  ),
  const _RenderFixture(
    painter: RenderElems02TPainter(),
    name: 'render_elems_02_t',
  ),
  const _RenderFixture(
    painter: RenderElems03TPainter(),
    name: 'render_elems_03_t',
    maxDiffPercent: 0.08,
  ),
  const _RenderFixture(
    painter: RenderElems06TPainter(),
    name: 'render_elems_06_t',
  ),
  const _RenderFixture(
    painter: RenderElems07TPainter(),
    name: 'render_elems_07_t',
    maxDiffPercent: 0.08,
  ),
  const _RenderFixture(
    painter: RenderElems08TPainter(),
    name: 'render_elems_08_t',
    maxDiffPercent: 0.08,
  ),
  const _RenderFixture(
    painter: RenderGroups01BPainter(),
    widget: RenderGroups01BPainterWidget(),
    name: 'render_groups_01_b',
    maxDiffPercent: 0.40,
  ),
  const _RenderFixture(
    painter: RenderGroups03TPainter(),
    widget: RenderGroups03TPainterWidget(),
    name: 'render_groups_03_t',
    maxDiffPercent: 0.20,
  ),
];

void main() {
  setUpAll(() async {
    await loadTestFonts();
  });

  group('W3C SVG 1.1 Test Suite Render', () {
    for (final _RenderFixture fixture in _fixtures) {
      testWidgets(fixture.name, (WidgetTester tester) async {
        await testSvgPainterWithW3cDiff(
          tester: tester,
          painter: fixture.painter,
          widget: fixture.widget,
          testName: fixture.name,
          folder: 'render',
          maxDiffPercent: fixture.maxDiffPercent ?? 0.06,
        );
      });
    }
  });
}
