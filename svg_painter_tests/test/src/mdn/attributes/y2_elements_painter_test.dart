import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils.dart';
import 'y2_elements_painter.dart';

void main() {
  testWidgets('Y2ElementsPainter renders correctly', (WidgetTester tester) async {
    await testSvgPainter(
      tester: tester,
      painter: Y2ElementsPainter(),
      goldenName: 'y2_elements_painter.png',
    );
  });
}
