import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils.dart';
import 'style_painter.dart';

void main() {
  testWidgets('StylePainter renders correctly', (WidgetTester tester) async {
    await testSvgPainter(
      tester: tester,
      painter: const StylePainter(),
      goldenName: 'style_painter.png',
    );
  });
}
