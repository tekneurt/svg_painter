import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> testSvgPainter({
  required WidgetTester tester,
  required CustomPainter painter,
  required String goldenName,
  Size size = const Size(100, 100),
}) async {
  await tester.pumpWidget(
    Center(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.red, width: 10),
          color: Colors.grey[200],
        ),
        child: CustomPaint(
          size: size,
          painter: painter,
        ),
      ),
    ),
  );

  await expectLater(
    find.byType(Container),
    matchesGoldenFile('goldens/$goldenName'),
  );
}
