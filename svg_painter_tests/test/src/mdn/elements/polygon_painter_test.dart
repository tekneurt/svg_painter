import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils.dart';
import 'polygon_painter.dart';

void main() {
  testWidgets('PolygonPainter renders correctly', (WidgetTester tester) async {
    await testSvgPainter(
      tester: tester,
      painter: PolygonPainter(),
      goldenName: 'polygon_painter.png',
    );
  });
}
