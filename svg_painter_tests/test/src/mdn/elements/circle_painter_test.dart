import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils.dart';
import 'circle_painter.dart';

void main() {
  testWidgets('CirclePainter renders correctly', (WidgetTester tester) async {
    await testSvgPainter(
      tester: tester,
      painter: CirclePainter(),
      goldenName: 'circle_painter.png',
    );
  });
}
