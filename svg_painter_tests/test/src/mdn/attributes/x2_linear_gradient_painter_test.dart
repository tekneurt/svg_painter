import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils.dart';
import 'x2_linear_gradient_painter.dart';

void main() {
  testWidgets('X2LinearGradientPainter renders correctly', (WidgetTester tester) async {
    await testSvgPainter(
      tester: tester,
      painter: X2LinearGradientPainter(),
      goldenName: 'x2_linear_gradient_painter.png',
    );
  });
}
