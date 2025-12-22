import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'x2_linear_gradient_painter.dart';

void main() {
  testWidgets('X2LinearGradientPainter renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      Center(
        child: CustomPaint(
          size: const Size(20, 10),
          painter: X2LinearGradientPainter(),
        ),
      ),
    );

    await expectLater(
      find.byType(CustomPaint),
      matchesGoldenFile('goldens/x2_linear_gradient_painter.png'),
    );
  });
}
