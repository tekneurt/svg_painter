import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'circle_painter.dart';

void main() {
  testWidgets('CirclePainter generates correct output', (WidgetTester tester) async {
    await tester.pumpWidget(
      Center(
        child: RepaintBoundary(
          child: CustomPaint(
            size: const Size(100, 100),
            painter: CirclePainter(),
          ),
        ),
      ),
    );

    await expectLater(
      find.byType(CustomPaint),
      matchesGoldenFile('goldens/circle_painter.png'),
    );
  });
}
