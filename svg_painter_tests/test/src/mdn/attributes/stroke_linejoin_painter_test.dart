import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils.dart';
import 'stroke_linejoin_painter.dart';

void main() {
  testWidgets('StrokeLinejoinPainter renders correctly', (WidgetTester tester) async {
    await testSvgPainter(
      tester: tester,
      painter: const StrokeLinejoinPainter(),
      goldenName: 'stroke_linejoin_painter.png',
    );
  });
}
