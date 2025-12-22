import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'y1_linear_gradient_painter.dart';

void main() {
  testWidgets('Y1LinearGradientPainter renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      Center(
        child: CustomPaint(
          size: const Size(20, 10),
          painter: Y1LinearGradientPainter(),
        ),
      ),
    );

    await expectLater(
      find.byType(CustomPaint),
      matchesGoldenFile('goldens/y1_linear_gradient_painter.png'),
    );
  });
}
