import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'stroke_width_painter.dart';

void main() {
  testWidgets('StrokeWidthPainter renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      Center(
        child: CustomPaint(
          size: const Size(30, 10),
          painter: StrokeWidthPainter(),
        ),
      ),
    );

    await expectLater(
      find.byType(CustomPaint),
      matchesGoldenFile('goldens/stroke_width_painter.png'),
    );
  });
}
