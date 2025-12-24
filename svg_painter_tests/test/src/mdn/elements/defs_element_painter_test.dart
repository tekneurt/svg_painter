import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils.dart';
import 'defs_element_painter.dart';

void main() {
  testWidgets('DefsElementPainter renders correctly', (WidgetTester tester) async {
    await testSvgPainter(
      tester: tester,
      painter: DefsElementPainter(),
      goldenName: 'defs_element_painter.png',
    );
  });
}
