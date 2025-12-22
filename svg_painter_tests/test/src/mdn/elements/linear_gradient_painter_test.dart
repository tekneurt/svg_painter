import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils.dart';
import 'linear_gradient_painter.dart';

void main() {
  testWidgets('LinearGradientPainter renders correctly', (WidgetTester tester) async {
    await testSvgPainter(
      tester: tester,
      painter: LinearGradientPainter(),
      goldenName: 'linear_gradient_painter.png',
    );
  });
}
