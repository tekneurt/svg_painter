import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils.dart';
import 'polyline_painter.dart';

void main() {
  testWidgets('PolylinePainter renders correctly', (WidgetTester tester) async {
    await testSvgPainter(
      tester: tester,
      painter: PolylinePainter(),
      goldenName: 'polyline_painter.png',
    );
  });
}
