import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils.dart';
import 'x1_elements_painter.dart';

void main() {
  testWidgets('X1ElementsPainter renders correctly', (WidgetTester tester) async {
    await testSvgPainter(
      tester: tester,
      painter: X1ElementsPainter(),
      goldenName: 'x1_elements_painter.png',
    );
  });
}
