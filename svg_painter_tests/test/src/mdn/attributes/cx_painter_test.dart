import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'cx_painter.dart';

void main() {
  testWidgets('CxPainter renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      Center(
        child: CustomPaint(
          size: const Size(300, 100),
          painter: CxPainter(),
        ),
      ),
    );

    await expectLater(
      find.byType(CustomPaint),
      matchesGoldenFile('goldens/cx_painter.png'),
    );
  });
}
