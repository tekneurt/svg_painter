import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils.dart';
import 'view_box_1_painter.dart';

void main() {
  testWidgets('ViewBox1Painter renders correctly', (WidgetTester tester) async {
    await testSvgPainter(
      tester: tester,
      painter: ViewBox1Painter(),
      goldenName: 'view_box_1_painter.png',
    );
  });
}
