import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils.dart';
import 'y1_examples_painter.dart';

void main() {
  testWidgets('Y1ExamplesPainter renders correctly', (WidgetTester tester) async {
    await testSvgPainter(
      tester: tester,
      painter: Y1ExamplesPainter(),
      goldenName: 'y1_examples_painter.png',
    );
  });
}
