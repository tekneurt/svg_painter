import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils.dart';
import 'x2_examples_painter.dart';

void main() {
  testWidgets('X2ExamplesPainter renders correctly', (WidgetTester tester) async {
    await testSvgPainter(
      tester: tester,
      painter: X2ExamplesPainter(),
      goldenName: 'x2_examples_painter.png',
    );
  });
}
