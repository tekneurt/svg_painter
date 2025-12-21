import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'radial_gradient_painter.dart';

void main() {
  testWidgets('RadialGradientPainter renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      Center(
        child: CustomPaint(
          size: const Size(100, 100),
          painter: RadialGradientPainter(),
        ),
      ),
    );

    await expectLater(
      find.byType(CustomPaint),
      matchesGoldenFile('goldens/radial_gradient_painter.png'),
    );
  });
}
