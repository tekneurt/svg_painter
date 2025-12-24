import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils.dart';
import 'line_painter.dart';

void main() {
  testWidgets('LinePainter renders correctly', (WidgetTester tester) async {
    await testSvgPainter(tester: tester, painter: LinePainter(), goldenName: 'line_painter.png');
  });
}
