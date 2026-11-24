import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test_utils.dart';
import '../mdn/attributes/dx_painter.dart';
import '../mdn/attributes/text_anchor_painter.dart';
import '../mdn/elements/text_painter.dart';
import '../mdn/elements/tspan_painter.dart';

void main() {
  setUpAll(() async {
    await loadTestFonts();
  });

  group('SVG Text and Font Widget Tests', () {
    testWidgets(
      'should render and match goldens for MdnTextExamplePainterWidget with bundled fonts',
      (WidgetTester tester) async {
        // Arrange
        const widget = MdnTextExamplePainterWidget();

        // Act & Assert
        await testDualResolutionWidget(
          tester: tester,
          widget: widget,
          name: 'text_font_mdn_text_example',
          type: SvgTestType.various,
          tests: macOsOverrideGoldenTests,
          nativeSize: const Size(240, 80),
        );
      },
    );

    testWidgets(
      'should render and match goldens for TspanPainterWidget with mixed font families and styles',
      (WidgetTester tester) async {
        // Arrange
        const widget = TspanPainterWidget();

        // Act & Assert
        await testDualResolutionWidget(
          tester: tester,
          widget: widget,
          name: 'text_font_tspan',
          type: SvgTestType.various,
          tests: macOsOverrideGoldenTests,
          nativeSize: const Size(240, 40),
        );
      },
    );

    testWidgets('should render and match goldens for DxPainterWidget with positioned text', (
      WidgetTester tester,
    ) async {
      // Arrange
      const widget = DxPainterWidget();

      // Act & Assert
      await testDualResolutionWidget(
        tester: tester,
        widget: widget,
        name: 'text_font_dx',
        type: SvgTestType.various,
        tests: macOsOverrideGoldenTests,
        nativeSize: const Size(100, 100),
      );
    });

    testWidgets(
      'should render and match goldens for TextAnchorPainterWidget with explicit font families',
      (WidgetTester tester) async {
        // Arrange
        const widget = TextAnchorPainterWidget();

        // Act & Assert
        await testDualResolutionWidget(
          tester: tester,
          widget: widget,
          name: 'text_font_text_anchor',
          type: SvgTestType.various,
          tests: macOsOverrideGoldenTests,
          nativeSize: const Size(120, 120),
        );
      },
    );
  });
}
