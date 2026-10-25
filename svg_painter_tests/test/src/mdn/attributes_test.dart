import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test_utils.dart';
import 'attributes/class_painter.dart';
import 'attributes/clip_path_painter.dart';
import 'attributes/clip_path_units_painter.dart';
import 'attributes/color_painter.dart';
import 'attributes/cx_painter.dart';
import 'attributes/cy_painter.dart';
import 'attributes/d_painter.dart';
import 'attributes/decoding_painter.dart';
import 'attributes/display_painter.dart';
import 'attributes/dx_painter.dart';
import 'attributes/dy_painter.dart';
import 'attributes/fill_context_fill_painter.dart';
import 'attributes/fill_opacity_painter.dart';
import 'attributes/fill_painter.dart';
import 'attributes/fill_rule_evenodd_painter.dart';
import 'attributes/fill_rule_nonzero_painter.dart';
import 'attributes/fill_rule_painter.dart';
import 'attributes/filter_painter.dart';
import 'attributes/flood_color_attribute_painter.dart';
import 'attributes/flood_opacity_attribute_painter.dart';
import 'attributes/font_family_painter.dart';
import 'attributes/font_size_painter.dart';
import 'attributes/font_style_painter.dart';
import 'attributes/font_weight_painter.dart';
import 'attributes/fr_painter.dart';
import 'attributes/fx_painter.dart';
import 'attributes/fy_painter.dart';
import 'attributes/gradient_transform_painter.dart';
import 'attributes/height_painter.dart';
import 'attributes/href_a_painter.dart';
import 'attributes/href_image_painter.dart';
import 'attributes/id_painter.dart';
import 'attributes/marker_end_painter.dart';
import 'attributes/marker_mid_painter.dart';
import 'attributes/marker_start_painter.dart';
import 'attributes/mask_content_units_painter.dart';
import 'attributes/mask_painter.dart';
import 'attributes/mask_units_painter.dart';
import 'attributes/media_painter.dart';
import 'attributes/offset_component_transfer_painter.dart';
import 'attributes/offset_gradient_stop_painter.dart';
import 'attributes/opacity_painter.dart';
import 'attributes/orient_painter.dart';
import 'attributes/overflow_painter.dart';
import 'attributes/paint_order_painter.dart';
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
import 'attributes/start_offset_painter.dart';
import 'attributes/std_deviation_painter.dart';
import 'attributes/stroke_context_stroke_painter.dart';
import 'attributes/stroke_dasharray_painter.dart';
import 'attributes/stroke_dashoffset_painter.dart';
import 'attributes/stroke_linecap_painter.dart';
import 'attributes/stroke_linejoin_painter.dart';
import 'attributes/stroke_miterlimit_painter.dart';
import 'attributes/stroke_opacity_painter.dart';
import 'attributes/stroke_painter.dart';
import 'attributes/stroke_width_painter.dart';
import 'attributes/style_painter.dart';
import 'attributes/text_anchor_painter.dart';
import 'attributes/transform_2_painter.dart';
import 'attributes/transform_matrix_painter.dart';
import 'attributes/transform_painter.dart';
import 'attributes/transform_rotate_painter.dart';
import 'attributes/transform_scale_painter.dart';
import 'attributes/transform_skew_x_painter.dart';
import 'attributes/transform_skew_y_painter.dart';
import 'attributes/transform_translate_painter.dart';
import 'attributes/vector_effect_painter.dart';
import 'attributes/view_box_1_painter.dart';
import 'attributes/view_box_2_painter.dart';
import 'attributes/view_box_3_painter.dart';
import 'attributes/visibility_painter.dart';
import 'attributes/width_painter.dart';
import 'attributes/x1_examples_painter.dart';
import 'attributes/x1_line_painter.dart';
import 'attributes/x1_linear_gradient_painter.dart';
import 'attributes/x2_examples_painter.dart';
import 'attributes/x2_line_painter.dart';
import 'attributes/x2_linear_gradient_painter.dart';
import 'attributes/x_examples_painter.dart';
import 'attributes/x_text_painter.dart';
import 'attributes/x_tspan_painter.dart';
import 'attributes/xlink_href_painter.dart';
import 'attributes/xml_space_painter.dart';
import 'attributes/y1_examples_painter.dart';
import 'attributes/y1_line_painter.dart';
import 'attributes/y1_linear_gradient_painter.dart';
import 'attributes/y2_examples_painter.dart';
import 'attributes/y2_line_painter.dart';
import 'attributes/y2_linear_gradient_painter.dart';
import 'attributes/y_examples_painter.dart';
import 'attributes/y_text_painter.dart';
import 'attributes/y_tspan_painter.dart';

final List<({CustomPainter painter, String name, Map<GoldenTestType, Set<TargetPlatform>?> tests})>
_fixtures =
    <({CustomPainter painter, String name, Map<GoldenTestType, Set<TargetPlatform>?> tests})>[
      (painter: const ClassPainter(), name: 'class_painter', tests: defaultGoldenTests),
      (
        painter: const ClipPathAttributePainter(),
        name: 'clip_path_attribute_painter',
        tests: defaultGoldenTests,
      ),
      (
        painter: const ClipPathUnitsPainter(),
        name: 'clip_path_units_painter',
        tests: defaultGoldenTests,
      ),
      (painter: const ColorPainter(), name: 'color_painter', tests: defaultGoldenTests),
      (painter: const CxPainter(), name: 'cx_painter', tests: defaultGoldenTests),
      (
        painter: const CyPainter(),
        name: 'cy_painter',
        tests: <GoldenTestType, Set<TargetPlatform>?>{
          GoldenTestType.fixed: null,
          GoldenTestType.viewBox: <TargetPlatform>{TargetPlatform.macOS},
        },
      ),
      (painter: const DClosePathPainter(), name: 'd_close_path_painter', tests: defaultGoldenTests),
      (
        painter: const DCubicBezierPainter(),
        name: 'd_cubic_bezier_painter',
        tests: defaultGoldenTests,
      ),
      (
        painter: const DEllipticalArcPainter(),
        name: 'd_elliptical_arc_painter',
        tests: defaultGoldenTests,
      ),
      (painter: const DExamplePainter(), name: 'd_example_painter', tests: defaultGoldenTests),
      (painter: const DLineToPainter(), name: 'd_line_to_painter', tests: defaultGoldenTests),
      (painter: const DMoveToPainter(), name: 'd_move_to_painter', tests: defaultGoldenTests),
      (
        painter: const DQuadraticBezierPainter(),
        name: 'd_quadratic_bezier_painter',
        tests: defaultGoldenTests,
      ),
      (painter: const DisplayPainter(), name: 'display_painter', tests: defaultGoldenTests),
      (painter: const DxPainter(), name: 'dx_painter', tests: macOsOverrideGoldenTests),
      (painter: const Dx2Painter(), name: 'dx_2_painter', tests: defaultGoldenTests),
      (painter: const DyPainter(), name: 'dy_painter', tests: macOsOverrideGoldenTests),
      (painter: const Dy2Painter(), name: 'dy_2_painter', tests: defaultGoldenTests),
      (
        painter: const FillOpacityPainter(),
        name: 'fill_opacity_painter',
        tests: defaultGoldenTests,
      ),
      (painter: const FillPainter(), name: 'fill_painter', tests: defaultGoldenTests),
      (
        painter: const FillContextFillPainter(),
        name: 'fill_context_fill_painter',
        tests: defaultGoldenTests,
      ),
      (painter: const FillRulePainter(), name: 'fill_rule_painter', tests: defaultGoldenTests),
      (
        painter: const FillRuleNonzeroPainter(),
        name: 'fill_rule_nonzero_painter',
        tests: defaultGoldenTests,
      ),
      (
        painter: const FillRuleEvenoddPainter(),
        name: 'fill_rule_evenodd_painter',
        tests: defaultGoldenTests,
      ),
      (painter: const FilterPainter(), name: 'filter_painter', tests: defaultGoldenTests),
      (
        painter: const FloodColorAttributePainter(),
        name: 'flood_color_attribute_painter',
        tests: defaultGoldenTests,
      ),
      (
        painter: const FloodOpacityAttributePainter(),
        name: 'flood_opacity_attribute_painter',
        tests: defaultGoldenTests,
      ),
      (
        painter: const FontFamilyPainter(),
        name: 'font_family_painter',
        tests: macOsOverrideGoldenTests,
      ),
      (
        painter: const FontSizePainter(),
        name: 'font_size_painter',
        tests: macOsOverrideGoldenTests,
      ),
      (
        painter: const FontStylePainter(),
        name: 'font_style_painter',
        tests: macOsOverrideGoldenTests,
      ),
      (
        painter: const FontWeightPainter(),
        name: 'font_weight_painter',
        tests: macOsOverrideGoldenTests,
      ),
      (
        painter: const Fr1Painter(),
        name: 'fr_1_painter',
        tests: defaultGoldenTests,
      ),
      (
        painter: const Fr2Painter(),
        name: 'fr_2_painter',
        tests: defaultGoldenTests,
      ),
      (painter: const FxPainter(), name: 'fx_painter', tests: defaultGoldenTests),
      (
        painter: const Fy1Painter(),
        name: 'fy_1_painter',
        tests: macOsViewBoxOverrideGoldenTests,
      ),
      (
        painter: const Fy2Painter(),
        name: 'fy_2_painter',
        tests: macOsOverrideGoldenTests,
      ),
      (painter: const HeightPainter(), name: 'height_painter', tests: defaultGoldenTests),
      (painter: const HrefAPainter(), name: 'href_a_painter', tests: defaultGoldenTests),
      (painter: const IdPainter(), name: 'id_painter', tests: defaultGoldenTests),
      (painter: const MarkerEndPainter(), name: 'marker_end_painter', tests: defaultGoldenTests),
      (painter: const MarkerMidPainter(), name: 'marker_mid_painter', tests: defaultGoldenTests),
      (
        painter: const MarkerStartPainter(),
        name: 'marker_start_painter',
        tests: defaultGoldenTests,
      ),
      (
        painter: const MaskAttributePainter(),
        name: 'mask_attribute_painter',
        tests: macOsOverrideGoldenTests,
      ),
      (
        painter: const MaskContentUnitsPainter(),
        name: 'mask_content_units_painter',
        tests: defaultGoldenTests,
      ),
      (
        painter: const MaskUnitsPainter(),
        name: 'mask_units_painter',
        tests: defaultGoldenTests,
      ),
      (painter: const MediaPainter(), name: 'media_painter', tests: defaultGoldenTests),
      (
        painter: const OffsetGradientStopPainter(),
        name: 'offset_gradient_stop_painter',
        tests: defaultGoldenTests,
      ),
      (
        painter: const OffsetComponentTransferPainter(),
        name: 'offset_component_transfer_painter',
        tests: defaultGoldenTests,
      ),
      (painter: const OpacityPainter(), name: 'opacity_painter', tests: defaultGoldenTests),
      (painter: const OrientPainter(), name: 'orient_painter', tests: defaultGoldenTests),
      (painter: const OverflowPainter(), name: 'overflow_painter', tests: defaultGoldenTests),
      (
        painter: const PaintOrderPainter(),
        name: 'paint_order_painter',
        tests: macOsOverrideGoldenTests,
      ),
      (painter: const PathLengthPainter(), name: 'path_length_painter', tests: defaultGoldenTests),
      (
        painter: const PointsExamplePainter(),
        name: 'points_example_painter',
        tests: defaultGoldenTests,
      ),
      (
        painter: const PointsPolygonPainter(),
        name: 'points_polygon_painter',
        tests: defaultGoldenTests,
      ),
      (
        painter: const PointsPolylinePainter(),
        name: 'points_polyline_painter',
        tests: defaultGoldenTests,
      ),
      (
        painter: const PreserveAspectRatio1Painter(),
        name: 'preserve_aspect_ratio_1_painter',
        tests: defaultGoldenTests,
      ),
      (
        painter: const PreserveAspectRatio2Painter(),
        name: 'preserve_aspect_ratio_2_painter',
        tests: defaultGoldenTests,
      ),
      (
        painter: const PreserveAspectRatio3Painter(),
        name: 'preserve_aspect_ratio_3_painter',
        tests: defaultGoldenTests,
      ),
      (
        painter: const PreserveAspectRatio4Painter(),
        name: 'preserve_aspect_ratio_4_painter',
        tests: defaultGoldenTests,
      ),
      (
        painter: const PreserveAspectRatio5Painter(),
        name: 'preserve_aspect_ratio_5_painter',
        tests: defaultGoldenTests,
      ),
      (
        painter: const RPainter(),
        name: 'r_painter',
        tests: <GoldenTestType, Set<TargetPlatform>?>{
          GoldenTestType.fixed: <TargetPlatform>{TargetPlatform.macOS},
          GoldenTestType.viewBox: null,
        },
      ),
      (painter: const RyPainter(), name: 'ry_painter', tests: defaultGoldenTests),
      (
        painter: const SpreadMethod1Painter(),
        name: 'spread_method_1_painter',
        tests: defaultGoldenTests,
      ),
      (
        painter: const SpreadMethod2Painter(),
        name: 'spread_method_2_painter',
        tests: <GoldenTestType, Set<TargetPlatform>?>{
          GoldenTestType.fixed: <TargetPlatform>{TargetPlatform.macOS},
          GoldenTestType.viewBox: <TargetPlatform>{TargetPlatform.macOS},
        },
      ),
      (
        painter: const StartOffsetPainter(),
        name: 'start_offset_painter',
        tests: macOsOverrideGoldenTests,
      ),
      (
        painter: const StdDeviationPainter(),
        name: 'std_deviation_painter',
        tests: defaultGoldenTests,
      ),
      (
        painter: const StrokeDasharrayPainter(),
        name: 'stroke_dasharray_painter',
        tests: defaultGoldenTests,
      ),
      (
        painter: const StrokeDashoffsetPainter(),
        name: 'stroke_dashoffset_painter',
        tests: defaultGoldenTests,
      ),
      (painter: const StrokeLinecapPainter(), name: 'stroke_linecap', tests: defaultGoldenTests),
      (painter: const StrokeLinejoinPainter(), name: 'stroke_linejoin', tests: defaultGoldenTests),
      (
        painter: const StrokeMiterlimitPainter(),
        name: 'stroke_miterlimit',
        tests: defaultGoldenTests,
      ),
      (painter: const StrokeOpacityPainter(), name: 'stroke_opacity', tests: defaultGoldenTests),
      (painter: const StrokePainter(), name: 'stroke_painter', tests: defaultGoldenTests),
      (
        painter: const StrokeContextStrokePainter(),
        name: 'stroke_context_stroke_painter',
        tests: defaultGoldenTests,
      ),
      (
        painter: const StrokeWidthPainter(),
        name: 'stroke_width_painter',
        tests: defaultGoldenTests,
      ),
      (painter: const StylePainter(), name: 'style_painter', tests: defaultGoldenTests),
      (
        painter: const TextAnchorPainter(),
        name: 'text_anchor_painter',
        tests: macOsOverrideGoldenTests,
      ),
      (
        painter: const TransformPainter(),
        name: 'transform_painter',
        tests: defaultGoldenTests,
      ),
      (
        painter: const Transform2Painter(),
        name: 'transform_2_painter',
        tests: defaultGoldenTests,
      ),
      (
        painter: const TransformMatrixPainter(),
        name: 'transform_matrix_painter',
        tests: defaultGoldenTests,
      ),
      (
        painter: const TransformRotatePainter(),
        name: 'transform_rotate_painter',
        tests: defaultGoldenTests,
      ),
      (
        painter: const TransformScalePainter(),
        name: 'transform_scale_painter',
        tests: defaultGoldenTests,
      ),
      (
        painter: const TransformSkewXPainter(),
        name: 'transform_skew_x_painter',
        tests: defaultGoldenTests,
      ),
      (
        painter: const TransformSkewYPainter(),
        name: 'transform_skew_y_painter',
        tests: defaultGoldenTests,
      ),
      (
        painter: const TransformTranslatePainter(),
        name: 'transform_translate_painter',
        tests: defaultGoldenTests,
      ),
      (
        painter: const VectorEffectPainter(),
        name: 'vector_effect_painter',
        tests: defaultGoldenTests,
      ),
      (painter: const ViewBox1Painter(), name: 'view_box_1_painter', tests: defaultGoldenTests),
      (painter: const ViewBox2Painter(), name: 'view_box_2_painter', tests: defaultGoldenTests),
      (painter: const ViewBox3Painter(), name: 'view_box_3_painter', tests: defaultGoldenTests),
      (painter: const VisibilityPainter(), name: 'visibility_painter', tests: defaultGoldenTests),
      (
        painter: const GradientTransformPainter(),
        name: 'gradient_transform_painter',
        tests: defaultGoldenTests,
      ),
      (painter: const WidthPainter(), name: 'width_painter', tests: defaultGoldenTests),
      (painter: const X1ExamplesPainter(), name: 'x1_examples_painter', tests: defaultGoldenTests),
      (painter: const X1LinePainter(), name: 'x1_line_painter', tests: defaultGoldenTests),
      (
        painter: const X1LinearGradientPainter(),
        name: 'x1_linear_gradient_painter',
        tests: defaultGoldenTests,
      ),
      (painter: const X2ExamplesPainter(), name: 'x2_examples_painter', tests: defaultGoldenTests),
      (painter: const X2LinePainter(), name: 'x2_line_painter', tests: defaultGoldenTests),
      (
        painter: const X2LinearGradientPainter(),
        name: 'x2_linear_gradient_painter',
        tests: defaultGoldenTests,
      ),
      (painter: const Y1ExamplesPainter(), name: 'y1_examples_painter', tests: defaultGoldenTests),
      (painter: const Y1LinePainter(), name: 'y1_line_painter', tests: defaultGoldenTests),
      (
        painter: const Y1LinearGradientPainter(),
        name: 'y1_linear_gradient_painter',
        tests: defaultGoldenTests,
      ),
      (painter: const XExamplesPainter(), name: 'x_examples_painter', tests: defaultGoldenTests),
      (painter: const XTextPainter(), name: 'x_text_painter', tests: defaultGoldenTests),
      (painter: const XTspanPainter(), name: 'x_tspan_painter', tests: defaultGoldenTests),
      (painter: const YExamplesPainter(), name: 'y_examples_painter', tests: defaultGoldenTests),
      (painter: const YTextPainter(), name: 'y_text_painter', tests: defaultGoldenTests),
      (painter: const YTspanPainter(), name: 'y_tspan_painter', tests: defaultGoldenTests),
      (painter: const Y2ExamplesPainter(), name: 'y2_examples_painter', tests: defaultGoldenTests),
      (painter: const Y2LinePainter(), name: 'y2_line_painter', tests: defaultGoldenTests),
      (
        painter: const Y2LinearGradientPainter(),
        name: 'y2_linear_gradient_painter',
        tests: defaultGoldenTests,
      ),
      (
        painter: const XlinkHrefPainter(),
        name: 'xlink_href_painter',
        tests: defaultGoldenTests,
      ),
      (
        painter: const XmlSpacePainter(),
        name: 'xml_space_painter',
        tests: macOsOverrideGoldenTests,
      ),
    ];

void main() {
  setUpAll(() async {
    await loadTestFonts();
  });

  group('MDN Attributes', () {
    for (final ({
          CustomPainter painter,
          String name,
          Map<GoldenTestType, Set<TargetPlatform>?> tests,
        })
        fixture
        in _fixtures) {
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

    testWidgets('media_painter (width: 600)', (WidgetTester tester) async {
      await testSvgPainter(
        tester: tester,
        painter: const MediaPainter(),
        goldenName: 'media_painter_w600.png',
        goldenPath: 'attributes/goldens',
        size: const Size(600, 550),
      );
    });

    testWidgets('media_painter (width: 800)', (WidgetTester tester) async {
      await testSvgPainter(
        tester: tester,
        painter: const MediaPainter(),
        goldenName: 'media_painter_w800.png',
        goldenPath: 'attributes/goldens',
        size: const Size(800, 600),
      );
    });

    testWidgets('decoding_painter', (WidgetTester tester) async {
      await testDualResolutionWidget(
        tester: tester,
        widget: const DecodingPainterWidget(),
        name: 'decoding_painter',
        type: SvgTestType.mdn,
        folder: 'attributes',
        tests: defaultGoldenTests,
        nativeSize: const Size(200, 200),
      );
    });

    testWidgets('href_image_painter', (WidgetTester tester) async {
      await testDualResolutionWidget(
        tester: tester,
        widget: const HrefImagePainterWidget(),
        name: 'href_image_painter',
        type: SvgTestType.mdn,
        folder: 'attributes',
        tests: defaultGoldenTests,
        nativeSize: const Size(100, 100),
      );
    });
  });
}
