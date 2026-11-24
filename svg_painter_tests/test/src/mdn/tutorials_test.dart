import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test_utils.dart';
import 'tutorials/gradients_painter.dart';

final List<({CustomPainter painter, String name, Map<GoldenTestType, Set<TargetPlatform>?> tests})>
_fixtures =
    <({CustomPainter painter, String name, Map<GoldenTestType, Set<TargetPlatform>?> tests})>[
      (
        painter: const GradientsPainter(),
        name: 'mdn_tutorial_linear_gradient',
        tests: defaultGoldenTests,
      ),
    ];

void main() {
  group('MDN Tutorials', () {
    for (final ({CustomPainter painter, String name, Map<GoldenTestType, Set<TargetPlatform>?> tests}) fixture in _fixtures) {
      testWidgets(fixture.name, (WidgetTester tester) async {
        await testDualResolutionPainter(
          tester: tester,
          painter: fixture.painter,
          name: fixture.name,
          type: SvgTestType.mdn,
          folder: 'tutorials',
          tests: fixture.tests,
        );
      });
    }
  });
}
