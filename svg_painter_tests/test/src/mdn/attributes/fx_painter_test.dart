import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils.dart';
import 'fx_painter.dart';

void main() {
  testWidgets('FxPainter renders correctly', (WidgetTester tester) async {
    await testSvgPainter(tester: tester, painter: FxPainter(), goldenName: 'fx_painter.png');
  });
}
