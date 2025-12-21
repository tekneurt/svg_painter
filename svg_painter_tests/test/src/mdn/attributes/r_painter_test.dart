import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'r_painter.dart';

void main() {
  testWidgets('RPainter renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      Center(
        child: CustomPaint(
          size: const Size(300, 200),
          painter: RPainter(),
        ),
      ),
    );

    await expectLater(
      find.byType(CustomPaint),
      matchesGoldenFile('goldens/r_painter.png'),
    );
  });
}
