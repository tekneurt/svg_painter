import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils.dart';
import 'ellipse_painter.dart';

void main() {
  testWidgets('MdnEllipsePainter renders correctly', (WidgetTester tester) async {
    await testSvgPainter(
      tester: tester,
      painter: MdnEllipsePainter(),
      goldenName: 'ellipse_painter.png',
    );
  });
}
