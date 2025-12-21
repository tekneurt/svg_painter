import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'rect_painter.dart';

void main() {
  testWidgets('RectPainter renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      Center(
        child: CustomPaint(
          size: const Size(220, 100),
          painter: RectPainter(),
        ),
      ),
    );

    await expectLater(
      find.byType(CustomPaint),
      matchesGoldenFile('goldens/rect_painter.png'),
    );
  });
}
