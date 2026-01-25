import 'package:flutter_test/flutter_test.dart';
import '../../../test_utils.dart';

import 'render/opacity_painter.dart';

void main() {
  setUpAll(() async {
    await loadTestFonts();
  });

  testWidgets('W3C SVG2 Opacity (nested)', (WidgetTester tester) async {
    await testDualResolutionPainter(
      tester: tester,
      painter: const OpacityPainter(),
      name: 'opacity_painter',
      type: SvgTestType.w3c,
      folder: 'render',
      tests: defaultGoldenTests,
    );
  });
}
