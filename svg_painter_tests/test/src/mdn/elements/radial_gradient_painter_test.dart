import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils.dart';
import 'radial_gradient_painter.dart';

void main() {
  testWidgets('RadialGradientPainter renders correctly', (WidgetTester tester) async {
    await testSvgPainter(
      tester: tester,
      painter: RadialGradientPainter(),
      goldenName: 'radial_gradient_painter.png',
    );
  });
}
