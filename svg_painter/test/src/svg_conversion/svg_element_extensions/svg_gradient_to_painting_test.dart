import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/svg_conversion/converters/svg_painting_context.dart';
import 'package:svg_painter/src/svg_conversion/svg_element_extensions/svg_gradient_to_painting.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  const SvgPaintingContext context = SvgPaintingContext(
    viewBoxWidth: 100,
    viewBoxHeight: 100,
  );

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
        stopOpacity: SvgLength(1.0),
      ),
    ];

    test('should return Success with DefineLinearGradient when SvgLinearGradient is provided', () {
      // Arrange
      const SvgLinearGradient grad = SvgLinearGradient(
        id: 'grad1',
        x1: SvgLength(0.0),
        y1: SvgLength(0.0),
        x2: SvgLength(100.0),
        y2: SvgLength(0.0),
        stops: stops,
      );

      // Act
      final Result<DefineLinearGradient> result = grad.toPaintCommand(context);

      // Assert
      expect(result, isA<Success<DefineLinearGradient>>());
      final DefineLinearGradient cmd = (result as Success<DefineLinearGradient>).value;
      expect(cmd.id, 'grad1');
      expect(cmd.stops, hasLength(2));
    });

    test('should return Success with DefineRadialGradient when SvgRadialGradient is provided', () {
      // Arrange
      const SvgRadialGradient grad = SvgRadialGradient(
        id: 'rad1',
        cx: SvgLength(50.0),
        cy: SvgLength(50.0),
        r: SvgLength(50.0),
        fx: SvgLength(50.0),
        fy: SvgLength(50.0),
        fr: SvgLength(0.0),
        stops: stops,
      );

      // Act
      final Result<DefineRadialGradient> result = grad.toPaintCommand(context);

      // Assert
      expect(result, isA<Success<DefineRadialGradient>>());
      final DefineRadialGradient cmd = (result as Success<DefineRadialGradient>).value;
      expect(cmd.id, 'rad1');
    });
  });
}
