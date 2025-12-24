import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils.dart';
import 'height_painter.dart';

void main() {
  testWidgets('HeightPainter renders correctly', (WidgetTester tester) async {
    await testSvgPainter(
      tester: tester,
      painter: HeightPainter(),
      goldenName: 'height_painter.png',
    );
  });
}
