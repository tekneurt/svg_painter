import 'package:flutter_test/flutter_test.dart';

import '../../../test_utils.dart';
import 'io_painter.dart';

void main() {
  testWidgets('IoPainter loads from file and generates correct output', (
    WidgetTester tester,
  ) async {
    await testDualResolutionPainter(
      tester: tester,
      painter: const IoPainter(),
      name: 'io_painter',
      type: SvgTestType.various,
      tests: defaultGoldenTests,
    );
  });
}
