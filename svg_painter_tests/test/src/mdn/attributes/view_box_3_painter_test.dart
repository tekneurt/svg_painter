import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils.dart';
import 'view_box_3_painter.dart';

void main() {
  testWidgets('ViewBox3Painter renders correctly', (WidgetTester tester) async {
    await testSvgPainter(
      tester: tester,
      painter: ViewBox3Painter(),
      goldenName: 'view_box_3_painter.png',
    );
  });
}
