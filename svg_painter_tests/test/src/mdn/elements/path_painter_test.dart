import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../test_utils.dart';
import 'path_painter.dart';

void main() {
  testWidgets('PathPainter golden test', (WidgetTester tester) async {
    await testSvgPainter(
      tester: tester,
      painter: const PathPainter(),
      goldenName: 'path_painter.png',
    );
  });
}
