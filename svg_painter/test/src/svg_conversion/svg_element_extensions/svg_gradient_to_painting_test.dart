import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/svg_conversion/converters/svg_painting_context.dart';
import 'package:svg_painter/src/svg_conversion/svg_element_extensions/svg_gradient_to_painting.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  const SvgPaintingContext context = SvgPaintingContext(viewBoxWidth: 100, viewBoxHeight: 200);

  group('SvgGradientToPaintCommand', () {
    const List<SvgStop> stops = <SvgStop>[
      SvgStop(
        offset: SvgLength(0.0),
        stopColor: SvgNamedColor(SvgColorName.white),
        stopOpacity: SvgLength(1.0),
      ),
      SvgStop(
        offset: SvgLength(1.0),
        stopColor: SvgNamedColor(SvgColorName.black),
        stopOpacity: SvgLength(0.5),
      ),
    ];

    test('should return Success with DefineLinearGradient when SvgLinearGradient is provided', () {
      // Arrange
      const SvgLinearGradient grad = SvgLinearGradient(
        id: 'grad1',
        x1: SvgLength(10.0),
        y1: SvgLength(20.0),
        x2: SvgLength(30.0),
        y2: SvgLength(40.0),
        stops: stops,
        gradientTransform: 'scale(2)',
      );

      // Act
      final Result<DefineLinearGradient> result = grad.toPaintCommand(context);

      // Assert
      expect(result, isA<Success<DefineLinearGradient>>());
      final DefineLinearGradient cmd = (result as Success<DefineLinearGradient>).value;
      expect(cmd.id, 'grad1');
      expect(cmd.x1, 10.0);
      expect(cmd.y1, 20.0);
      expect(cmd.x2, 30.0);
      expect(cmd.y2, 40.0);
      expect(cmd.stops, hasLength(2));
      expect(cmd.stops[0].offset, 0.0);
      expect(cmd.stops[0].colorArgb, 0xFFFFFFFF);
      expect(cmd.stops[1].offset, 1.0);
      expect(cmd.stops[1].colorArgb, 0x80000000);
      expect(cmd.transform, 'scale(2)');
    });

    test('should return Success with DefineRadialGradient when SvgRadialGradient is provided', () {
      // Arrange
      const SvgRadialGradient grad = SvgRadialGradient(
        id: 'rad1',
        cx: SvgLength(50.0),
        cy: SvgLength(60.0),
        r: SvgLength(70.0),
        fx: SvgLength(80.0),
        fy: SvgLength(90.0),
        fr: SvgLength(5.0),
        stops: stops,
      );

      // Act
      final Result<DefineRadialGradient> result = grad.toPaintCommand(context);

      // Assert
      expect(result, isA<Success<DefineRadialGradient>>());
      final DefineRadialGradient cmd = (result as Success<DefineRadialGradient>).value;
      expect(cmd.id, 'rad1');
      expect(cmd.cx, 50.0);
      expect(cmd.cy, 60.0);
      expect(cmd.radius, 70.0);
      expect(cmd.fx, 80.0);
      expect(cmd.fy, 90.0);
      expect(cmd.focalRadius, 5.0);
    });
  });
}
