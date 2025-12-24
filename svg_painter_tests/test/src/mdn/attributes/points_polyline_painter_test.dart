import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils.dart';
import 'points_polyline_painter.dart';

void main() {
  testWidgets('PointsPolylinePainter renders correctly', (WidgetTester tester) async {
    await testSvgPainter(
      tester: tester,
      painter: PointsPolylinePainter(),
      goldenName: 'points_polyline_painter.png',
    );
  });
}
