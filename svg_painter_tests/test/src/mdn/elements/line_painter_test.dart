import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'line_painter.dart';

void main() {
  testWidgets('LinePainter renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      Center(
        child: CustomPaint(
          size: const Size(100, 100),
          painter: LinePainter(),
        ),
      ),
    );

    await expectLater(
      find.byType(CustomPaint),
      matchesGoldenFile('goldens/line_painter.png'),
    );
  });
}
