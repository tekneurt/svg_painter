import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test_utils.dart';
import 'attributes/cx_painter.dart';
import 'attributes/cy_painter.dart';
import 'attributes/fill_opacity_painter.dart';
import 'attributes/fill_painter.dart';
import 'attributes/fx_painter.dart';
import 'attributes/fy_painter.dart';
import 'attributes/height_painter.dart';
import 'attributes/opacity_painter.dart';
import 'attributes/path_length_painter.dart';
import 'attributes/points_example_painter.dart';
import 'attributes/points_polygon_painter.dart';
import 'attributes/points_polyline_painter.dart';
import 'attributes/r_painter.dart';
import 'attributes/rx_painter.dart';
import 'attributes/ry_painter.dart';
import 'attributes/stroke_linecap_painter.dart';
import 'attributes/stroke_linejoin_painter.dart';
import 'attributes/stroke_opacity_painter.dart';
import 'attributes/stroke_painter.dart';
import 'attributes/stroke_width_painter.dart';
import 'attributes/style_painter.dart';
import 'attributes/view_box_1_painter.dart';
import 'attributes/view_box_2_painter.dart';
import 'attributes/view_box_3_painter.dart';
import 'attributes/width_painter.dart';
import 'attributes/x1_elements_painter.dart';
import 'attributes/x1_examples_painter.dart';
import 'attributes/x1_linear_gradient_painter.dart';
import 'attributes/x2_elements_painter.dart';
import 'attributes/x2_examples_painter.dart';
import 'attributes/x2_linear_gradient_painter.dart';
import 'attributes/y1_elements_painter.dart';
import 'attributes/y1_examples_painter.dart';
import 'attributes/y1_linear_gradient_painter.dart';
import 'attributes/y2_elements_painter.dart';
import 'attributes/y2_examples_painter.dart';
import 'attributes/y2_linear_gradient_painter.dart';

final List<({CustomPainter painter, String name})> _fixtures =
    <({CustomPainter painter, String name})>[
      (painter: const CxPainter(), name: 'cx_painter'),
      (painter: const CxRadialGradientPainter(), name: 'cx_radial_gradient_painter'),
      (painter: const CyPainter(), name: 'cy_painter'),
      (painter: const CyRadialGradientPainter(), name: 'cy_radial_gradient_painter'),
      (painter: const FillOpacityPainter(), name: 'fill_opacity_painter'),
      (painter: const FillPainter(), name: 'fill_painter'),
      (painter: const FxPainter(), name: 'fx_painter'),
      (painter: const Fy1Painter(), name: 'fy_1_painter'),
      (painter: const Fy2Painter(), name: 'fy_2_painter'),
      (painter: const HeightPainter(), name: 'height_painter'),
        (painter: const OpacityPainter(), name: 'opacity_painter'),
        (painter: const PathLengthPainter(), name: 'path_length_painter'),
        (painter: const PointsExamplePainter(), name: 'points_example_painter'),      (painter: const PointsPolygonPainter(), name: 'points_polygon_painter'),
      (painter: const PointsPolylinePainter(), name: 'points_polyline_painter'),
      (painter: const RPainter(), name: 'r_painter'),
      (painter: const RxPainter(), name: 'rx_painter'),
      (painter: const RyPainter(), name: 'ry_painter'),
      (painter: const StrokeLinecapPainter(), name: 'stroke_linecap_painter'),
      (painter: const StrokeLinecapButtPainter(), name: 'stroke_linecap_butt_painter'),
      (painter: const StrokeLinecapRoundPainter(), name: 'stroke_linecap_round_painter'),
      (painter: const StrokeLinecapSquarePainter(), name: 'stroke_linecap_square_painter'),
      (painter: const StrokeLinejoinPainter(), name: 'stroke_linejoin_painter'),
      (painter: const StrokeLinejoinArcsPainter(), name: 'stroke_linejoin_arcs_painter'),
      (painter: const StrokeLinejoinBevelPainter(), name: 'stroke_linejoin_bevel_painter'),
      (painter: const StrokeLinejoinMiterPainter(), name: 'stroke_linejoin_miter_painter'),
      (painter: const StrokeLinejoinMiterClipPainter(), name: 'stroke_linejoin_miter_clip_painter'),
      (painter: const StrokeLinejoinRoundPainter(), name: 'stroke_linejoin_round_painter'),
      (painter: const StrokeOpacityPainter(), name: 'stroke_opacity_painter'),
      (painter: const StrokePainter(), name: 'stroke_painter'),
      (painter: const StrokeWidthPainter(), name: 'stroke_width_painter'),
      (painter: const StylePainter(), name: 'style_painter'),
      (painter: const ViewBox1Painter(), name: 'view_box_1_painter'),
      (painter: const ViewBox2Painter(), name: 'view_box_2_painter'),
      (painter: const ViewBox3Painter(), name: 'view_box_3_painter'),
      (painter: const WidthPainter(), name: 'width_painter'),
      (painter: const X1ElementsPainter(), name: 'x1_elements_painter'),
      (painter: const X1ExamplesPainter(), name: 'x1_examples_painter'),
      (painter: const X1LinearGradientPainter(), name: 'x1_linear_gradient_painter'),
      (painter: const X2ElementsPainter(), name: 'x2_elements_painter'),
      (painter: const X2ExamplesPainter(), name: 'x2_examples_painter'),
      (painter: const X2LinearGradientPainter(), name: 'x2_linear_gradient_painter'),
      (painter: const Y1ElementsPainter(), name: 'y1_elements_painter'),
      (painter: const Y1ExamplesPainter(), name: 'y1_examples_painter'),
      (painter: const Y1LinearGradientPainter(), name: 'y1_linear_gradient_painter'),
      (painter: const Y2ElementsPainter(), name: 'y2_elements_painter'),
      (painter: const Y2ExamplesPainter(), name: 'y2_examples_painter'),
      (painter: const Y2LinearGradientPainter(), name: 'y2_linear_gradient_painter'),
    ];

void main() {
  setUpAll(() async {
    await loadTestFonts();
  });

  group('MDN Attributes', () {
    for (final ({CustomPainter painter, String name}) fixture in _fixtures) {
      testWidgets(fixture.name, (WidgetTester tester) async {
        await testDualResolutionPainter(
          tester: tester,
          painter: fixture.painter,
          name: fixture.name,
          type: SvgTestType.mdn,
          folder: 'attributes',
        );
      });
    }
  });
}
