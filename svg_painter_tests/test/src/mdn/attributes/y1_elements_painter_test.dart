import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils.dart';
import 'y1_elements_painter.dart';

void main() {
  testWidgets('Y1ElementsPainter renders correctly', (WidgetTester tester) async {
    await testSvgPainter(
      tester: tester,
      painter: Y1ElementsPainter(),
      goldenName: 'y1_elements_painter.png',
    );
  });
}
