import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../test_utils.dart';
import 'daphnia_indexed_painter.dart';
import 'daphnia_mixed_painter.dart';

void main() {
  setUpAll(() async {
    await loadTestFonts();
  });

  group('Daphnia Exposure Modes', () {
    testWidgets('Indexed mode should match original SVG by default', (WidgetTester tester) async {
      // No overrides. Should match daphnia.svg visual.
      const painter = DaphniaIndexedPainter();

      await testSvgPainter(
        tester: tester,
        painter: painter,
        goldenName: 'daphnia_indexed_default.png',
        size: const Size(480, 480),
      );
    });

    testWidgets('Indexed mode should support full recoloring', (WidgetTester tester) async {
      // fill1 (Dark Grey) -> Green
      // fill2 (Orange)    -> Blue
      // fill3 (White)     -> Red
      const painter = DaphniaIndexedPainter(
        fill1: Colors.green,
        fill2: Colors.blue,
        fill3: Colors.red,
      );

      await testSvgPainter(
        tester: tester,
        painter: painter,
        goldenName: 'daphnia_indexed_recolored.png',
        size: const Size(480, 480),
      );
    });

    testWidgets('Mixed mode should match Indexed mode (since no IDs)', (WidgetTester tester) async {
      // Just verifying mixed mode generates the same properties
      const painter = DaphniaMixedPainter(
        fill1: Colors.green,
        fill2: Colors.blue,
        fill3: Colors.red,
      );

      await testSvgPainter(
        tester: tester,
        painter: painter,
        goldenName: 'daphnia_mixed_recolored.png',
        size: const Size(480, 480),
      );
    });
  });
}
