import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../test_utils.dart';
import 'gradient_transform_bbox_painter.dart';

void main() {
  setUpAll(() async {
    await loadTestFonts();
  });

  testWidgets('Custom ObjectBoundingBox Gradient Transform', (WidgetTester tester) async {
    await testDualResolutionPainter(
      tester: tester,
      painter: const GradientTransformBboxPainter(),
      name: 'gradient_transform_bbox_painter',
      type: SvgTestType.custom,
      tests: <GoldenTestType, Set<TargetPlatform>?>{
        GoldenTestType.fixed: null,
        GoldenTestType.viewBox: null,
      },
    );
  });
}
