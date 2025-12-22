import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils.dart';
import 'x1_examples_painter.dart';

void main() {
  testWidgets('X1ExamplesPainter renders correctly', (WidgetTester tester) async {
    await testSvgPainter(
      tester: tester,
      painter: X1ExamplesPainter(),
      goldenName: 'x1_examples_painter.png',
    );
  });
}
