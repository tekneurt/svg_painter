import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils.dart';
import 'opacity_painter.dart';

void main() {
  testWidgets('OpacityPainter renders correctly', (WidgetTester tester) async {
    await testSvgPainter(
      tester: tester,
      painter: const OpacityPainter(),
      goldenName: 'opacity_painter.png',
    );
  });
}
