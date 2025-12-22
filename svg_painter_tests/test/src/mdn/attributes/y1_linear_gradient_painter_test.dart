import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils.dart';
import 'y1_linear_gradient_painter.dart';

void main() {
  testWidgets('Y1LinearGradientPainter renders correctly', (WidgetTester tester) async {
    await testSvgPainter(
      tester: tester,
      painter: Y1LinearGradientPainter(),
      goldenName: 'y1_linear_gradient_painter.png',
    );
  });
}
