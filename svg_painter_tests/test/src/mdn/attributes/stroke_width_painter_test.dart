import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils.dart';
import 'stroke_width_painter.dart';

void main() {
  testWidgets('StrokeWidthPainter renders correctly', (WidgetTester tester) async {
    await testSvgPainter(
      tester: tester,
      painter: StrokeWidthPainter(),
      goldenName: 'stroke_width_painter.png',
    );
  });
}
