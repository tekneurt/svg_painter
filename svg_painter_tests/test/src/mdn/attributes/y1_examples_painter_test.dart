import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'y1_examples_painter.dart';

void main() {
  testWidgets('Y1ExamplesPainter renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      Center(
        child: CustomPaint(
          size: const Size(25, 25),
          painter: Y1ExamplesPainter(),
        ),
      ),
    );

    await expectLater(
      find.byType(CustomPaint),
      matchesGoldenFile('goldens/y1_examples_painter.png'),
    );
  });
}
