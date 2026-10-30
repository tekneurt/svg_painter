import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test_utils.dart';
import 'token_colors_painter.dart';

void main() {
  setUpAll(() async {
    await loadTestFonts();
  });

  group('Token Colors', () {
    testWidgets('should render default colors when no overrides provided', (WidgetTester tester) async {
      await testDualResolutionPainter(
        tester: tester,
        painter: const TokenColorsPainter(),
        name: 'token_colors_default',
        type: SvgTestType.custom,
        tests: defaultGoldenTests,
      );
    });

    testWidgets('should globally recolor fills, strokes, and gradients when tokens provided', (WidgetTester tester) async {
      await testDualResolutionPainter(
        tester: tester,
        painter: const TokenColorsPainter(
          black: Colors.blue,
          red: Colors.amber,
        ),
        name: 'token_colors_recolored',
        type: SvgTestType.custom,
        tests: defaultGoldenTests,
      );
    });

    testWidgets('should support token recoloring via generated widget', (WidgetTester tester) async {
      await testDualResolutionWidget(
        tester: tester,
        widget: const TokenColorsPainterWidget(
          black: Colors.purple,
          red: Colors.teal,
        ),
        name: 'token_colors_widget',
        type: SvgTestType.custom,
        tests: defaultGoldenTests,
        nativeSize: const Size(120, 60),
      );
    });
  });
}
