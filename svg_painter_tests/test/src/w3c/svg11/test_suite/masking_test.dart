import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../test_utils.dart';
import 'masking/masking_opacity_01_b_painter.dart';
import 'masking/masking_path_01_b_painter.dart';
import 'masking/masking_path_02_b_painter.dart';
import 'masking/masking_path_03_b_painter.dart';
import 'masking/masking_path_05_f_painter.dart';

class _MaskingFixture {
  const _MaskingFixture({
    required this.painter,
    required this.name,
    this.maxDiffPercent,
  });

  final CustomPainter painter;
  final String name;
  final double? maxDiffPercent;
}

final List<_MaskingFixture> _fixtures = <_MaskingFixture>[
  const _MaskingFixture(
    painter: MaskingPath01BPainter(),
    name: 'masking_path_01_b',
    maxDiffPercent: 0.20,
  ),
  const _MaskingFixture(
    painter: MaskingPath02BPainter(),
    name: 'masking_path_02_b',
    maxDiffPercent: 0.18,
  ),
  const _MaskingFixture(
    painter: MaskingPath03BPainter(),
    name: 'masking_path_03_b',
    maxDiffPercent: 0.15,
  ),
  const _MaskingFixture(
    painter: MaskingPath05FPainter(),
    name: 'masking_path_05_f',
    maxDiffPercent: 0.10,
  ),
  const _MaskingFixture(
    painter: MaskingOpacity01BPainter(),
    name: 'masking_opacity_01_b',
    maxDiffPercent: 0.25,
  ),
];

void main() {
  setUpAll(() async {
    await loadTestFonts();
  });

  group('W3C SVG 1.1 Test Suite Masking', () {
    for (final _MaskingFixture fixture in _fixtures) {
      testWidgets(fixture.name, (WidgetTester tester) async {
        await testSvgPainterWithW3cDiff(
          tester: tester,
          painter: fixture.painter,
          testName: fixture.name,
          folder: 'masking',
          maxDiffPercent: fixture.maxDiffPercent ?? 0.06,
        );
      });
    }
  });
}
