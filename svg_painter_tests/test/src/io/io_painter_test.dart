import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'io_painter.dart';

void main() {
  testWidgets('IoPainter loads from file and generates correct output',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      Center(
        child: RepaintBoundary(
          child: CustomPaint(
            size: const Size(100, 100),
            painter: IoPainter(),
          ),
        ),
      ),
    );

    // Reuse the circle_painter golden since the content is the same
    await expectLater(
      find.byType(CustomPaint),
      matchesGoldenFile('goldens/circle_painter.png'),
    );
  });
}
