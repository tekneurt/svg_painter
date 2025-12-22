import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils.dart';
import 'x1_linear_gradient_painter.dart';

void main() {
  testWidgets('X1LinearGradientPainter renders correctly', (WidgetTester tester) async {
    await testSvgPainter(
      tester: tester,
      painter: X1LinearGradientPainter(),
      goldenName: 'x1_linear_gradient_painter.png',
    );
  });
}
