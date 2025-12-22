import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'x1_elements_painter.dart';

void main() {
  testWidgets('X1ElementsPainter renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      Center(
        child: CustomPaint(
          size: const Size(10, 10),
          painter: X1ElementsPainter(),
        ),
      ),
    );

    await expectLater(
      find.byType(CustomPaint),
      matchesGoldenFile('goldens/x1_elements_painter.png'),
    );
  });
}
