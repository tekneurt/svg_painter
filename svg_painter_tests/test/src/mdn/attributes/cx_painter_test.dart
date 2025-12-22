import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils.dart';
import 'cx_painter.dart';

void main() {
  testWidgets('CxPainter renders correctly', (WidgetTester tester) async {
    await testSvgPainter(
      tester: tester,
      painter: CxPainter(),
      goldenName: 'cx_painter.png',
    );
  });
}
