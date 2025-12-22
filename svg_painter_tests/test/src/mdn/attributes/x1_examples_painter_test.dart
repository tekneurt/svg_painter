import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'x1_examples_painter.dart';

void main() {
  testWidgets('X1ExamplesPainter renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      Center(
        child: CustomPaint(
          size: const Size(25, 25),
          painter: X1ExamplesPainter(),
        ),
      ),
    );

    await expectLater(
      find.byType(CustomPaint),
      matchesGoldenFile('goldens/x1_examples_painter.png'),
    );
  });
}
