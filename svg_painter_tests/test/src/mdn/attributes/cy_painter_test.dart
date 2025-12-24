import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils.dart';
import 'cy_painter.dart';

void main() {
  testWidgets('CyPainter renders correctly', (WidgetTester tester) async {
    await testSvgPainter(tester: tester, painter: CyPainter(), goldenName: 'cy_painter.png');
  });
}
