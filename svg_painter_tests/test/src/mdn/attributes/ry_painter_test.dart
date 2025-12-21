import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'ry_painter.dart';

void main() {
  testWidgets('RyPainter renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      Center(
        child: CustomPaint(
          size: const Size(300, 200),
          painter: RyPainter(),
        ),
      ),
    );

    await expectLater(
      find.byType(CustomPaint),
      matchesGoldenFile('goldens/ry_painter.png'),
    );
  });
}
