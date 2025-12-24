import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils.dart';
import 'svg_element_painter.dart';

void main() {
  testWidgets('SvgElementPainter renders correctly', (WidgetTester tester) async {
    await testSvgPainter(
      tester: tester,
      painter: SvgElementPainter(),
      goldenName: 'svg_element_painter.png',
    );
  });
}
