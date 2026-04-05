import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test_utils.dart';
import 'alpha_transparency_dice/alpha_transparency_dice_painter.dart';
import 'lenna/lenna_painter.dart';

final List<({
  CustomPainter? painter,
  Widget? widget,
  Size? nativeSize,
  String name,
  Map<GoldenTestType, Set<TargetPlatform>?> tests
})> _fixtures = <({
  CustomPainter? painter,
  Widget? widget,
  Size? nativeSize,
  String name,
  Map<GoldenTestType, Set<TargetPlatform>?> tests
})>[
  (
    painter: null,
    widget: const AlphaTransparencyDicePainterWidget(),
    nativeSize: const Size(200, 200),
    name: 'alpha_transparency_dice',
    tests: defaultGoldenTests
  ),
  (
    painter: null,
    widget: const AlphaTransparencyDiceTransformedPainterWidget(),
    nativeSize: const Size(200, 200),
    name: 'alpha_transparency_dice_transformed',
    tests: defaultGoldenTests
  ),
  (
    painter: null,
    widget: const AlphaTransparencyDiceDataUriPainterWidget(),
    nativeSize: const Size(100, 100),
    name: 'alpha_transparency_dice_data_uri',
    tests: defaultGoldenTests
  ),
  (
    painter: null,
    widget: const LennaPainterWidget(),
    nativeSize: const Size(200, 200),
    name: 'lenna',
    tests: defaultGoldenTests
  ),
  (
    painter: null,
    widget: const LennaTransformedPainterWidget(),
    nativeSize: const Size(200, 200),
    name: 'lenna_transformed',
    tests: defaultGoldenTests
  ),
  (
    painter: null,
    widget: const LennaDataUriPainterWidget(),
    nativeSize: const Size(100, 100),
    name: 'lenna_data_uri',
    tests: defaultGoldenTests
  ),
];

void main() {
  setUpAll(() async {
    await loadTestFonts();
  });

  group('Various Elements', () {
    for (final ({
      CustomPainter? painter,
      Widget? widget,
      Size? nativeSize,
      String name,
      Map<GoldenTestType, Set<TargetPlatform>?> tests
    }) fixture in _fixtures) {
      testWidgets(fixture.name, (WidgetTester tester) async {
        final String folder = switch (fixture.name) {
          'alpha_transparency_dice' ||
          'alpha_transparency_dice_transformed' ||
          'alpha_transparency_dice_data_uri' =>
            'alpha_transparency_dice',
          'lenna' || 'lenna_transformed' || 'lenna_data_uri' => 'lenna',
          _ => fixture.name,
        };
        if (fixture.widget != null) {
          await testDualResolutionWidget(
            tester: tester,
            widget: fixture.widget!,
            name: fixture.name,
            type: SvgTestType.various,
            folder: folder,
            tests: fixture.tests,
            nativeSize: fixture.nativeSize!,
          );
        } else {
          await testDualResolutionPainter(
            tester: tester,
            painter: fixture.painter!,
            name: fixture.name,
            type: SvgTestType.various,
            folder: folder,
            tests: fixture.tests,
          );
        }
      });
    }
  });
}
