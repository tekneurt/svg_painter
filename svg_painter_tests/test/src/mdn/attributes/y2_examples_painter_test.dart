import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'y2_examples_painter.dart';

void main() {
  testWidgets('Y2ExamplesPainter renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      Center(
        child: CustomPaint(
          size: const Size(25, 25),
          painter: Y2ExamplesPainter(),
        ),
      ),
    );

    await expectLater(
      find.byType(CustomPaint),
      matchesGoldenFile('goldens/y2_examples_painter.png'),
    );
  });
}
