import 'package:svg_painter/src/base/_base.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/svg_conversion/converters/svg_painting_context.dart';
import 'package:svg_painter/src/svg_conversion/svg_element_extensions/svg_gradient_to_painting.dart';
import 'package:svg_painter/src/svg_model/_svg_model.dart';
import 'package:test/test.dart';

void main() {
  group('SvgGradientToPainting', () {
    const SvgPaintingContext context = SvgPaintingContext(viewBoxWidth: 100, viewBoxHeight: 100);

    test('should convert SvgLinearGradient to DefineLinearGradient', () {
      // Arrange
      const SvgLinearGradient grad = SvgLinearGradient(
        id: 'g1',
        x1: SvgLength(0),
        y1: SvgLength(0),
        x2: SvgLength(100),
        y2: SvgLength(0),
        stops: <SvgStop>[
          SvgStop(
            offset: SvgLength(0),
            stopColor: SvgNamedColor(SvgColorName.red),
            stopOpacity: SvgLength(1.0),
          ),
          SvgStop(
            offset: SvgLength(1),
            stopColor: SvgNamedColor(SvgColorName.blue),
            stopOpacity: SvgLength(0.5),
          ),
        ],
      );

      // Act
      final Result<PaintCommand> result = grad.toPaintCommand(context);

      // Assert
      expect(result, isA<Success<PaintCommand>>());
      final PaintCommand cmd = (result as Success<PaintCommand>).value;
      expect(cmd, isA<DefineLinearGradient>());
      final DefineLinearGradient lgrad = cmd as DefineLinearGradient;
      expect(lgrad.id, 'g1');
      expect(lgrad.stops, hasLength(2));
      expect(lgrad.stops[1].opacity, 0.5);
    });

    test('should convert SvgRadialGradient to DefineRadialGradient', () {
      // Arrange
      const SvgRadialGradient grad = SvgRadialGradient(
        id: 'rg1',
        cx: SvgLength(50),
        cy: SvgLength(50),
        r: SvgLength(50),
        fx: SvgLength(50),
        fy: SvgLength(50),
        fr: SvgLength(0),
        stops: <SvgStop>[
          SvgStop(
            offset: SvgLength(0),
            stopColor: SvgNamedColor(SvgColorName.black),
            stopOpacity: SvgLength(1.0),
          ),
        ],
      );

      // Act
      final Result<PaintCommand> result = grad.toPaintCommand(context);

      // Assert
      expect(result, isA<Success<PaintCommand>>());
      final PaintCommand cmd = (result as Success<PaintCommand>).value;
      expect(cmd, isA<DefineRadialGradient>());
      final DefineRadialGradient rgrad = cmd as DefineRadialGradient;
      expect(rgrad.id, 'rg1');
      expect(rgrad.cx, 50.0);
    });
  });
}
