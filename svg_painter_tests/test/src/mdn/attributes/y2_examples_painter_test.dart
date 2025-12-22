import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils.dart';
import 'y2_examples_painter.dart';

void main() {
  testWidgets('Y2ExamplesPainter renders correctly', (WidgetTester tester) async {
    await testSvgPainter(
      tester: tester,
      painter: Y2ExamplesPainter(),
      goldenName: 'y2_examples_painter.png',
    );
  });
}
