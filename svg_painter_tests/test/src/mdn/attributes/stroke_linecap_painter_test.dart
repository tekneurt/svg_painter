import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils.dart';
import 'stroke_linecap_painter.dart';

void main() {
  testWidgets('StrokeLinecapPainter renders correctly', (WidgetTester tester) async {
    await testSvgPainter(
      tester: tester,
      painter: const StrokeLinecapPainter(),
      goldenName: 'stroke_linecap_painter.png',
    );
  });
}
