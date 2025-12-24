import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils.dart';
import 'points_polygon_painter.dart';

void main() {
  testWidgets('PointsPolygonPainter renders correctly', (WidgetTester tester) async {
    await testSvgPainter(
      tester: tester,
      painter: PointsPolygonPainter(),
      goldenName: 'points_polygon_painter.png',
    );
  });
}
