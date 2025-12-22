import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils.dart';
import 'r_painter.dart';

void main() {
  testWidgets('RPainter renders correctly', (WidgetTester tester) async {
    await testSvgPainter(
      tester: tester,
      painter: RPainter(),
      goldenName: 'r_painter.png',
    );
  });
}
