import 'package:flutter_test/flutter_test.dart';
import '../../test_utils.dart';
import 'whitespace_painter.dart';

void main() {
  setUpAll(() async {
    await loadTestFonts();
  });

  testWidgets('Custom Whitespace Normalization', (WidgetTester tester) async {
    await testDualResolutionPainter(
      tester: tester,
      painter: const WhitespacePainter(),
      name: 'whitespace_painter',
      type: SvgTestType.various,
      folder: 'custom',
      tests: defaultGoldenTests,
    );
  });
}
