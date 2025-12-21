import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'cy_painter.dart';

void main() {
  testWidgets('CyPainter renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      Center(
        child: CustomPaint(
          size: const Size(100, 300),
          painter: CyPainter(),
        ),
      ),
    );

    await expectLater(
      find.byType(CustomPaint),
      matchesGoldenFile('goldens/cy_painter.png'),
    );
  });
}
