import 'package:flutter_test/flutter_test.dart';
import '../../test_utils.dart';
import 'use_cases_painter.dart';

void main() {
  setUpAll(() async {
    await loadTestFonts();
  });

  testWidgets('Custom <use> Cases', (WidgetTester tester) async {
    await testDualResolutionPainter(
      tester: tester,
      painter: const UseCasesPainter(),
      name: 'use_cases_painter',
      type: SvgTestType.custom,
      tests: defaultGoldenTests,
    );
  });
}
