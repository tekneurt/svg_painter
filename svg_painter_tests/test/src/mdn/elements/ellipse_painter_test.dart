import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'ellipse_painter.dart';

void main() {
  testWidgets('MdnEllipsePainter renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      Center(
        child: CustomPaint(
          size: const Size(200, 100),
          painter: MdnEllipsePainter(),
        ),
      ),
    );

    await expectLater(
      find.byType(CustomPaint),
      matchesGoldenFile('goldens/ellipse_painter.png'),
    );
  });
}
