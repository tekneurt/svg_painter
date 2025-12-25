import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils.dart';
import 'g_painter.dart';

void main() {
  testWidgets('GPainter renders correctly', (WidgetTester tester) async {
    await testSvgPainter(
      tester: tester,
      painter: const GPainter(),
      goldenName: 'g_painter.png',
    );
  });
}
