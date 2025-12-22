import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils.dart';
import 'rx_painter.dart';

void main() {
  testWidgets('RxPainter renders correctly', (WidgetTester tester) async {
    await testSvgPainter(
      tester: tester,
      painter: RxPainter(),
      goldenName: 'rx_painter.png',
    );
  });
}
