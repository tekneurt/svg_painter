import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils.dart';
import 'daphnia_painter.dart';

void main() {
  testWidgets('Daphnia Painter', (WidgetTester tester) async {
    await testDualResolutionPainter(
      tester: tester,
      painter: const DaphniaPainter(),
      name: 'daphnia_painter',
      type: SvgTestType.various,
      tests: defaultGoldenTests,
    );
  });
}
