import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils.dart';
import 'width_painter.dart';

void main() {
  testWidgets('WidthPainter renders correctly', (WidgetTester tester) async {
    await testSvgPainter(tester: tester, painter: WidthPainter(), goldenName: 'width_painter.png');
  });
}
