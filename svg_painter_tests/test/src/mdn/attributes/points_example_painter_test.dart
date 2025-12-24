import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils.dart';
import 'points_example_painter.dart';

void main() {
  testWidgets('PointsExamplePainter renders correctly', (WidgetTester tester) async {
    await testSvgPainter(
      tester: tester,
      painter: PointsExamplePainter(),
      goldenName: 'points_example_painter.png',
    );
  });
}
