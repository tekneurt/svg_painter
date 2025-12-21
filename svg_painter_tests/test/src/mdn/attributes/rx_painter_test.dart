import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'rx_painter.dart';

void main() {
  testWidgets('RxPainter renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      Center(
        child: CustomPaint(
          size: const Size(300, 200),
          painter: RxPainter(),
        ),
      ),
    );

    await expectLater(
      find.byType(CustomPaint),
      matchesGoldenFile('goldens/rx_painter.png'),
    );
  });
}
