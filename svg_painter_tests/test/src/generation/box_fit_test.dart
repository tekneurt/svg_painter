import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:svg_painter_annotation/svg_painter_annotation.dart';

part 'box_fit_test.g.dart';

@SvgCodePainter(
  '''
<svg viewBox="0 0 100 50" width="100" height="50">
  <rect width="100" height="50" fill="blue" />
  <circle cx="25" cy="25" r="20" fill="red" />
  <circle cx="75" cy="25" r="20" fill="green" />
</svg>
''',
)
class BoxFitTestPainter extends _$BoxFitTestPainter {
  const BoxFitTestPainter({super.fit});
}

Future<void> _assertBoxFitGolden({
  required WidgetTester tester,
  required BoxFit fit,
  required Size containerSize,
  required String goldenName,
}) async {
  tester.view.devicePixelRatio = 1.0;
  tester.view.physicalSize = Size(containerSize.width + 20, containerSize.height + 20);

  await tester.pumpWidget(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(
        child: Container(
          width: containerSize.width,
          height: containerSize.height,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black87, width: 2),
            color: Colors.grey[200],
          ),
          clipBehavior: Clip.hardEdge,
          child: BoxFitTestPainterWidget(fit: fit),
        ),
      ),
    ),
  );
  await tester.pumpAndSettle();

  await expectLater(
    find.byType(Container),
    matchesGoldenFile('goldens/$goldenName.png'),
  );

  tester.view.resetDevicePixelRatio();
  tester.view.resetPhysicalSize();
}

void main() {
  test('BoxFitTestPainter should be reachable', () {
    expect(const BoxFitTestPainter(), isNotNull);
  });

  group('BoxFit Validation', () {
    testWidgets('should pillarbox when fit is BoxFit.contain in a landscape container', (
      WidgetTester tester,
    ) async {
      // Arrange
      const BoxFit fit = .contain;
      const containerSize = Size(200, 60);

      // Act & Assert
      await _assertBoxFitGolden(
        tester: tester,
        fit: fit,
        containerSize: containerSize,
        goldenName: 'box_fit_contain',
      );
    });

    testWidgets('should overflow vertically when fit is BoxFit.fitWidth in a landscape container', (
      WidgetTester tester,
    ) async {
      // Arrange
      const BoxFit fit = .fitWidth;
      const containerSize = Size(200, 60);

      // Act & Assert
      await _assertBoxFitGolden(
        tester: tester,
        fit: fit,
        containerSize: containerSize,
        goldenName: 'box_fit_fitWidth',
      );
    });

    testWidgets('should crop sides when fit is BoxFit.cover in a square container', (
      WidgetTester tester,
    ) async {
      // Arrange
      const BoxFit fit = .cover;
      const containerSize = Size(100, 100);

      // Act & Assert
      await _assertBoxFitGolden(
        tester: tester,
        fit: fit,
        containerSize: containerSize,
        goldenName: 'box_fit_cover',
      );
    });

    testWidgets('should match height and crop sides when fit is BoxFit.fitHeight in a portrait container', (
      WidgetTester tester,
    ) async {
      // Arrange
      const BoxFit fit = .fitHeight;
      const containerSize = Size(80, 120);

      // Act & Assert
      await _assertBoxFitGolden(
        tester: tester,
        fit: fit,
        containerSize: containerSize,
        goldenName: 'box_fit_fitHeight',
      );
    });

    testWidgets('should distort circles into vertical ellipses when fit is BoxFit.fill in a square container', (
      WidgetTester tester,
    ) async {
      // Arrange
      const BoxFit fit = .fill;
      const containerSize = Size(120, 120);

      // Act & Assert
      await _assertBoxFitGolden(
        tester: tester,
        fit: fit,
        containerSize: containerSize,
        goldenName: 'box_fit_fill',
      );
    });

    testWidgets('should maintain native size and overflow when fit is BoxFit.none in an undersized container', (
      WidgetTester tester,
    ) async {
      // Arrange
      const BoxFit fit = .none;
      const containerSize = Size(70, 40);

      // Act & Assert
      await _assertBoxFitGolden(
        tester: tester,
        fit: fit,
        containerSize: containerSize,
        goldenName: 'box_fit_none',
      );
    });

    testWidgets('should downscale to fit when fit is BoxFit.scaleDown in an undersized container', (
      WidgetTester tester,
    ) async {
      // Arrange
      const BoxFit fit = .scaleDown;
      const containerSize = Size(70, 40);

      // Act & Assert
      await _assertBoxFitGolden(
        tester: tester,
        fit: fit,
        containerSize: containerSize,
        goldenName: 'box_fit_scaleDown_smaller',
      );
    });

    testWidgets('should not upscale when fit is BoxFit.scaleDown in an oversized container', (
      WidgetTester tester,
    ) async {
      // Arrange
      const BoxFit fit = .scaleDown;
      const containerSize = Size(150, 150);

      // Act & Assert
      await _assertBoxFitGolden(
        tester: tester,
        fit: fit,
        containerSize: containerSize,
        goldenName: 'box_fit_scaleDown_larger',
      );
    });
  });
}
