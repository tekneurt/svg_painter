import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils.dart';
import 'x2_elements_painter.dart';

void main() {
  testWidgets('X2ElementsPainter renders correctly', (WidgetTester tester) async {
    await testSvgPainter(
      tester: tester,
      painter: X2ElementsPainter(),
      goldenName: 'x2_elements_painter.png',
    );
  });
}
