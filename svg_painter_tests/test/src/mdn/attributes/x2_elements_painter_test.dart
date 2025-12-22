import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'x2_elements_painter.dart';

void main() {
  testWidgets('X2ElementsPainter renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      Center(
        child: CustomPaint(
          size: const Size(10, 10),
          painter: X2ElementsPainter(),
        ),
      ),
    );

    await expectLater(
      find.byType(CustomPaint),
      matchesGoldenFile('goldens/x2_elements_painter.png'),
    );
  });
}
