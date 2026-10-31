import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils.dart';
import 'pservers/example_lingrad01_painter.dart';

final List<({CustomPainter painter, String name})> _fixtures =
    <({CustomPainter painter, String name})>[
      (painter: const ExampleLingrad01Painter(), name: 'w3c_svg11_example_lingrad01'),
    ];

void main() {
  group('W3C SVG 1.1 Gradients & Patterns (pservers)', () {
    for (final ({CustomPainter painter, String name}) fixture in _fixtures) {
      testWidgets(fixture.name, (WidgetTester tester) async {
        await testDualResolutionPainter(
          tester: tester,
          painter: fixture.painter,
          name: fixture.name,
          type: SvgTestType.w3c,
          folder: 'pservers',
          tests: defaultGoldenTests,
        );
      });
    }
  });
}
