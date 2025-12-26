import 'package:flutter_test/flutter_test.dart';

import '../../test_utils.dart';
import 'daphnia_painter.dart';

void main() {
  testWidgets('DaphniaPainter renders correctly', (WidgetTester tester) async {
    await testSvgPainter(
      tester: tester,
      painter: const DaphniaPainter(),
      goldenName: 'daphnia_painter.png',
    );
  });
}
