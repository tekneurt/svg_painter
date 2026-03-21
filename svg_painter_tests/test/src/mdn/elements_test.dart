import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test_utils.dart';
import 'elements/circle_painter.dart';
import 'elements/defs_painter.dart';
import 'elements/ellipse_painter.dart';
import 'elements/g_painter.dart';
import 'elements/line_painter.dart';
import 'elements/linear_gradient_painter.dart';
import 'elements/path_painter.dart';
import 'elements/polygon_painter.dart';
import 'elements/polyline_painter.dart';
import 'elements/radial_gradient_painter.dart';
import 'elements/rect_painter.dart';
import 'elements/stop_painter.dart';
import 'elements/style_painter.dart';
import 'elements/svg_painter.dart';
import 'elements/symbol_painter.dart';
import 'elements/text_painter.dart';
import 'elements/use_element_painter.dart';

final List<({CustomPainter painter, String name, Map<GoldenTestType, Set<TargetPlatform>?> tests})> _fixtures =
    <({CustomPainter painter, String name, Map<GoldenTestType, Set<TargetPlatform>?> tests})>[
  (painter: const CirclePainter(), name: 'circle_painter', tests: defaultGoldenTests),
  (painter: const DefsPainter(), name: 'defs_painter', tests: defaultGoldenTests),
  (painter: const EllipsePainter(), name: 'ellipse_painter', tests: defaultGoldenTests),
  (painter: const GPainter(), name: 'g_painter', tests: defaultGoldenTests),
  (painter: const LinePainter(), name: 'line_painter', tests: defaultGoldenTests),
  (painter: const LinearGradient1Painter(), name: 'linear_gradient_1_painter', tests: defaultGoldenTests),
  (painter: const LinearGradient2Painter(), name: 'linear_gradient_2_painter', tests: defaultGoldenTests),
  // path_painter: 7px path anti-aliasing diff on viewBox test (macOS)
  (painter: const PathPainter(), name: 'path_painter', tests: <GoldenTestType, Set<TargetPlatform>?>{
    GoldenTestType.fixed: null,
    GoldenTestType.viewBox: <TargetPlatform>{TargetPlatform.macOS},
  }),
  (painter: const PolygonPainter(), name: 'polygon_painter', tests: defaultGoldenTests),
  (painter: const PolylinePainter(), name: 'polyline_painter', tests: defaultGoldenTests),
  (painter: const RadialGradientPainter(), name: 'radial_gradient_painter', tests: defaultGoldenTests),
  (painter: const RectPainter(), name: 'rect_painter', tests: defaultGoldenTests),
  (painter: const StopPainter(), name: 'stop_painter', tests: defaultGoldenTests),
  (painter: const StyleElementPainter(), name: 'style_element_painter', tests: defaultGoldenTests),
  (painter: const Svg1Painter(), name: 'svg_painter_1', tests: defaultGoldenTests),
  (painter: const Svg2Painter(), name: 'svg_painter_2', tests: defaultGoldenTests),
  (painter: const SymbolPainter(), name: 'symbol_painter', tests: defaultGoldenTests),
  // text_painter: ~1400-1800px text anti-aliasing diff on both tests (macOS)
  (painter: const MdnTextExamplePainter(), name: 'text_painter', tests: <GoldenTestType, Set<TargetPlatform>?>{
    GoldenTestType.fixed: <TargetPlatform>{TargetPlatform.macOS},
    GoldenTestType.viewBox: <TargetPlatform>{TargetPlatform.macOS},
  }),
  (painter: const UseElementPainter(), name: 'use_element_painter', tests: defaultGoldenTests),
];

void main() {
  setUpAll(() async {
    await loadTestFonts();
  });

  group('MDN Elements', () {
    for (final ({CustomPainter painter, String name, Map<GoldenTestType, Set<TargetPlatform>?> tests}) fixture in _fixtures) {
      testWidgets(fixture.name, (WidgetTester tester) async {
        await testDualResolutionPainter(
          tester: tester,
          painter: fixture.painter,
          name: fixture.name,
          type: SvgTestType.mdn,
          folder: 'elements',
          tests: fixture.tests,
        );
      });
    }
  });
}
