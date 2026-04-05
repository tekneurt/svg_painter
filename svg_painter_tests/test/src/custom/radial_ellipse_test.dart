import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../test_utils.dart';
import 'radial_ellipse_painter.dart';

void main() {
  setUpAll(() async {
    await loadTestFonts();
  });

  testWidgets('Custom Elliptical Radial Gradient', (WidgetTester tester) async {
    await testDualResolutionPainter(
      tester: tester,
      painter: const RadialEllipsePainter(),
      name: 'radial_ellipse_painter',
      type: SvgTestType.custom,
      tests: <GoldenTestType, Set<TargetPlatform>?>{
        GoldenTestType.fixed: null,
        GoldenTestType.viewBox: <TargetPlatform>{TargetPlatform.macOS},
      },
    );
  });
}
