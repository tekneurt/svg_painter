import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'linear_gradient_painter.dart';

void main() {
  testWidgets('LinearGradientPainter renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      Center(
        child: CustomPaint(
          size: const Size(100, 100),
          painter: LinearGradientPainter(),
        ),
      ),
    );

    await expectLater(
      find.byType(CustomPaint),
      matchesGoldenFile('goldens/linear_gradient_painter.png'),
    );
  });
}
