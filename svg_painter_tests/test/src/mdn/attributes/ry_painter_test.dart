import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils.dart';
import 'ry_painter.dart';

void main() {
  testWidgets('RyPainter renders correctly', (WidgetTester tester) async {
    await testSvgPainter(
      tester: tester,
      painter: RyPainter(),
      goldenName: 'ry_painter.png',
    );
  });
}
