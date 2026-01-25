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
import 'elements/svg_painter.dart';
import 'elements/text_painter.dart';
import 'elements/use_element_painter.dart';

final List<({CustomPainter painter, String name})> _fixtures =
    <({CustomPainter painter, String name})>[
      (painter: const CirclePainter(), name: 'circle_painter'),
      (painter: const DefsPainter(), name: 'defs_painter'),
      (painter: const EllipsePainter(), name: 'ellipse_painter'),
      (painter: const GPainter(), name: 'g_painter'),
      (painter: const LinePainter(), name: 'line_painter'),
      (painter: const LinearGradientPainter(), name: 'linear_gradient_painter'),
      (painter: const PathPainter(), name: 'path_painter'),
      (painter: const PolygonPainter(), name: 'polygon_painter'),
      (painter: const PolylinePainter(), name: 'polyline_painter'),
      (painter: const RadialGradientPainter(), name: 'radial_gradient_painter'),
      (painter: const RectPainter(), name: 'rect_painter'),
      (painter: const StopPainter(), name: 'stop_painter'),
      (painter: const Svg1Painter(), name: 'svg_painter_1'),
      (painter: const Svg2Painter(), name: 'svg_painter_2'),
      (painter: const MdnTextExamplePainter(), name: 'text_painter'),
      (painter: const UseElementPainter(), name: 'use_element_painter'),
    ];

void main() {
  setUpAll(() async {
    await loadTestFonts();
  });

  group('MDN Elements', () {
    for (final fixture in _fixtures) {
      testWidgets(fixture.name, (WidgetTester tester) async {
        await testDualResolutionPainter(
          tester: tester,
          painter: fixture.painter,
          name: fixture.name,
          type: SvgTestType.mdn,
          folder: 'elements',
        );
      });
    }
  });
}
