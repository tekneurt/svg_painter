import 'package:flutter_test/flutter_test.dart';

import '../../test_utils.dart';
import 'hex_color_mapping_painter.dart';

void main() {
  setUpAll(() async {
    await loadTestFonts();
  });

  group('Hex Color Mapping', () {
    testWidgets('should render correctly with hex-mapped colors', (WidgetTester tester) async {
      await testDualResolutionPainter(
        tester: tester,
        painter: const HexColorMappingPainter(),
        name: 'hex_color_mapping_default',
        type: SvgTestType.custom,
        tests: defaultGoldenTests,
      );
    });
  });
}
