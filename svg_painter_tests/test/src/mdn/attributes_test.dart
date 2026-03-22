import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test_utils.dart';
import 'attributes/cx_painter.dart';
import 'attributes/cy_painter.dart';
import 'attributes/fill_opacity_painter.dart';
import 'attributes/fill_painter.dart';
import 'attributes/fx_painter.dart';
import 'attributes/fy_painter.dart';
import 'attributes/gradient_transform_painter.dart';
import 'attributes/height_painter.dart';
import 'attributes/id_painter.dart';
import 'attributes/opacity_painter.dart';
import 'attributes/path_length_painter.dart';
import 'attributes/points_example_painter.dart';
import 'attributes/points_polygon_painter.dart';
import 'attributes/points_polyline_painter.dart';
import 'attributes/preserve_aspect_ratio_1_painter.dart';
import 'attributes/preserve_aspect_ratio_2_painter.dart';
import 'attributes/preserve_aspect_ratio_3_painter.dart';
import 'attributes/preserve_aspect_ratio_4_painter.dart';
import 'attributes/preserve_aspect_ratio_5_painter.dart';
import 'attributes/r_painter.dart';
import 'attributes/ry_painter.dart';
import 'attributes/spread_method_painter.dart';
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
import 'attributes/x1_examples_painter.dart';
import 'attributes/x1_line_painter.dart';
import 'attributes/x1_linear_gradient_painter.dart';
import 'attributes/x2_examples_painter.dart';
import 'attributes/y1_examples_painter.dart';
import 'attributes/y2_examples_painter.dart';

final List<({CustomPainter painter, String name, Map<GoldenTestType, Set<TargetPlatform>?> tests})> _fixtures =
    <({CustomPainter painter, String name, Map<GoldenTestType, Set<TargetPlatform>?> tests})>[
  (painter: const CxPainter(), name: 'cx_painter', tests: defaultGoldenTests),
  (
    painter: const CyPainter(),
    name: 'cy_painter',
    tests: <GoldenTestType, Set<TargetPlatform>?>{
      GoldenTestType.fixed: null,
      GoldenTestType.viewBox: <TargetPlatform>{TargetPlatform.macOS},
    }
  ),
  (painter: const FillOpacityPainter(), name: 'fill_opacity_painter', tests: defaultGoldenTests),
  (painter: const FillPainter(), name: 'fill_painter', tests: defaultGoldenTests),
  (painter: const FxPainter(), name: 'fx_painter', tests: defaultGoldenTests),
  (
    painter: const Fy1Painter(),
    name: 'fy_1_painter',
    tests: <GoldenTestType, Set<TargetPlatform>?>{
      GoldenTestType.fixed: null,
      GoldenTestType.viewBox: <TargetPlatform>{TargetPlatform.macOS},
    }
  ),
  (
    painter: const Fy2Painter(),
    name: 'fy_2_painter',
    tests: <GoldenTestType, Set<TargetPlatform>?>{
      GoldenTestType.fixed: <TargetPlatform>{TargetPlatform.macOS},
      GoldenTestType.viewBox: <TargetPlatform>{TargetPlatform.macOS},
    }
  ),
  (painter: const HeightPainter(), name: 'height_painter', tests: defaultGoldenTests),
  (painter: const IdPainter(), name: 'id_painter', tests: defaultGoldenTests),
  (painter: const OpacityPainter(), name: 'opacity_painter', tests: defaultGoldenTests),
  (painter: const PathLengthPainter(), name: 'path_length_painter', tests: defaultGoldenTests),
  (painter: const PointsExamplePainter(), name: 'points_example_painter', tests: defaultGoldenTests),
  (painter: const PointsPolygonPainter(), name: 'points_polygon_painter', tests: defaultGoldenTests),
  (painter: const PointsPolylinePainter(), name: 'points_polyline_painter', tests: defaultGoldenTests),
  (
    painter: const PreserveAspectRatio1Painter(),
    name: 'preserve_aspect_ratio_1_painter',
    tests: defaultGoldenTests
  ),
  (
    painter: const PreserveAspectRatio2Painter(),
    name: 'preserve_aspect_ratio_2_painter',
    tests: defaultGoldenTests
  ),
  (
    painter: const PreserveAspectRatio3Painter(),
    name: 'preserve_aspect_ratio_3_painter',
    tests: defaultGoldenTests
  ),
  (
    painter: const PreserveAspectRatio4Painter(),
    name: 'preserve_aspect_ratio_4_painter',
    tests: defaultGoldenTests
  ),
  (
    painter: const PreserveAspectRatio5Painter(),
    name: 'preserve_aspect_ratio_5_painter',
    tests: defaultGoldenTests
  ),
  (
    painter: const RPainter(),
    name: 'r_painter',
    tests: <GoldenTestType, Set<TargetPlatform>?>{
      GoldenTestType.fixed: <TargetPlatform>{TargetPlatform.macOS},
      GoldenTestType.viewBox: null,
    }
  ),
  (painter: const RyPainter(), name: 'ry_painter', tests: defaultGoldenTests),
  (
    painter: const SpreadMethod1Painter(),
    name: 'spread_method_1_painter',
    tests: defaultGoldenTests
  ),
  (
    painter: const SpreadMethod2Painter(),
    name: 'spread_method_2_painter',
    tests: defaultGoldenTests
  ),
  (painter: const StrokeLinecapPainter(), name: 'stroke_linecap_painter', tests: defaultGoldenTests),
  (painter: const StrokeLinejoinPainter(), name: 'stroke_linejoin_painter', tests: defaultGoldenTests),
  (painter: const StrokeOpacityPainter(), name: 'stroke_opacity_painter', tests: defaultGoldenTests),
  (painter: const StrokePainter(), name: 'stroke_painter', tests: defaultGoldenTests),
  (painter: const StrokeWidthPainter(), name: 'stroke_width_painter', tests: defaultGoldenTests),
  (painter: const StylePainter(), name: 'style_painter', tests: defaultGoldenTests),
  (painter: const ViewBox1Painter(), name: 'view_box_1_painter', tests: defaultGoldenTests),
  (painter: const ViewBox2Painter(), name: 'view_box_2_painter', tests: defaultGoldenTests),
  (painter: const ViewBox3Painter(), name: 'view_box_3_painter', tests: defaultGoldenTests),
  (painter: const GradientTransformPainter(), name: 'gradient_transform_painter', tests: defaultGoldenTests),
  (painter: const WidthPainter(), name: 'width_painter', tests: defaultGoldenTests),
  (painter: const X1ExamplesPainter(), name: 'x1_examples_painter', tests: defaultGoldenTests),
  (painter: const X1LinePainter(), name: 'x1_line_painter', tests: defaultGoldenTests),
  (
    painter: const X1LinearGradientPainter(),
    name: 'x1_linear_gradient_painter',
    tests: defaultGoldenTests
  ),
  (painter: const X2ExamplesPainter(), name: 'x2_examples_painter', tests: defaultGoldenTests),
  (painter: const Y1ExamplesPainter(), name: 'y1_examples_painter', tests: defaultGoldenTests),
  (painter: const Y2ExamplesPainter(), name: 'y2_examples_painter', tests: defaultGoldenTests),
];

void main() {
  setUpAll(() async {
    await loadTestFonts();
  });

  group('MDN Attributes', () {
    for (final ({CustomPainter painter, String name, Map<GoldenTestType, Set<TargetPlatform>?> tests}) fixture in _fixtures) {
      testWidgets(fixture.name, (WidgetTester tester) async {
        await testDualResolutionPainter(
          tester: tester,
          painter: fixture.painter,
          name: fixture.name,
          type: SvgTestType.mdn,
          folder: 'attributes',
          tests: fixture.tests,
        );
      });
    }
  });
}
