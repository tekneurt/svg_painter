import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils.dart';
import 'y2_linear_gradient_painter.dart';

void main() {
  testWidgets('Y2LinearGradientPainter renders correctly', (WidgetTester tester) async {
    await testSvgPainter(
      tester: tester,
      painter: Y2LinearGradientPainter(),
      goldenName: 'y2_linear_gradient_painter.png',
    );
  });
}
