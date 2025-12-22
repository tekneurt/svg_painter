import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils.dart';
import 'rect_painter.dart';

void main() {
  testWidgets('RectPainter renders correctly', (WidgetTester tester) async {
    await testSvgPainter(
      tester: tester,
      painter: RectPainter(),
      goldenName: 'rect_painter.png',
    );
  });
}
