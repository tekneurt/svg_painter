import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils.dart';
import 'use_element_painter.dart';

void main() {
  testWidgets('UseElementPainter renders correctly', (WidgetTester tester) async {
    await testSvgPainter(
      tester: tester,
      painter: UseElementPainter(),
      goldenName: 'use_element_painter.png',
    );
  });
}
