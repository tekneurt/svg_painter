import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils.dart';
import 'view_box_2_painter.dart';

void main() {
  testWidgets('ViewBox2Painter renders correctly', (WidgetTester tester) async {
    await testSvgPainter(
      tester: tester,
      painter: ViewBox2Painter(),
      goldenName: 'view_box_2_painter.png',
    );
  });
}
