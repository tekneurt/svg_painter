import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/painting_model/_painting_model.dart';
import 'package:svg_painter/src/svg_conversion/converters/svg_painting_context.dart';
import 'package:svg_painter/src/svg_conversion/svg_element_extensions/svg_gradient_to_painting.dart';
import 'package:svg_painter/src/svg_model/_svg_model.dart';
import 'package:test/test.dart';

void main() {
  group('SvgGradientToPainting', () {
    const SvgPaintingContext context = SvgPaintingContext(viewBoxWidth: 100, viewBoxHeight: 100);

    test('SvgLinearGradient should convert to DefineLinearGradient', () {
      const SvgLinearGradient grad = SvgLinearGradient(
        coreAttributes: SvgCoreAttributes(id: 'g1'),
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

      final Result<PaintCommand> result = grad.toPaintCommand(context);

      expect(result, isA<Success<PaintCommand>>());
      final PaintCommand cmd = (result as Success<PaintCommand>).value;
      expect(cmd, isA<DefineLinearGradient>());
      final DefineLinearGradient lgrad = cmd as DefineLinearGradient;
      expect(lgrad.id, 'g1');
      expect(lgrad.stops, hasLength(2));
      expect(lgrad.stops[1].opacity, 0.5);
    });

    test('SvgLinearGradient should preserve gradientTransformAttributes', () {
      const SvgLinearGradient grad = SvgLinearGradient(
        coreAttributes: SvgCoreAttributes(id: 'g-rot-adj'),
        x1: SvgLength(0),
        y1: SvgLength(0),
        x2: SvgLength(0),
        y2: SvgLength(1),
        gradientTransformAttributes: SvgTransformAttributes(<SvgTransformOperation>[SvgRotate(90)]),
        stops: <SvgStop>[
          SvgStop(
            offset: SvgLength(0),
            stopColor: SvgNamedColor(SvgColorName.red),
            stopOpacity: SvgLength(1.0),
          ),
        ],
      );

      final Result<PaintCommand> result = grad.toPaintCommand(context);

      expect(result, isA<Success<PaintCommand>>());
      final PaintCommand cmd = (result as Success<PaintCommand>).value;
      final DefineLinearGradient lgrad = cmd as DefineLinearGradient;
      // Alignments should NOT be baked anymore
      expect(lgrad.x1, closeTo(0, 0.001));
      expect(lgrad.y1, closeTo(0, 0.001));
      expect(lgrad.x2, closeTo(0, 0.001));
      expect(lgrad.y2, closeTo(1, 0.001));
      expect(lgrad.transformAttributes, isNotNull);
      expect(lgrad.transformAttributes!.operations.first, isA<SvgRotate>());
    });

    test('SvgRadialGradient should convert to DefineRadialGradient', () {
      const SvgRadialGradient grad = SvgRadialGradient(
        coreAttributes: SvgCoreAttributes(id: 'rg1'),
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

      final Result<PaintCommand> result = grad.toPaintCommand(context);

      expect(result, isA<Success<PaintCommand>>());
      final PaintCommand cmd = (result as Success<PaintCommand>).value;
      expect(cmd, isA<DefineRadialGradient>());
      final DefineRadialGradient rgrad = cmd as DefineRadialGradient;
      expect(rgrad.id, 'rg1');
      expect(rgrad.cx, 50.0);
    });

    test('SvgRadialGradient should handle focal point defaults correctly', () {
      const SvgRadialGradient gradient = SvgRadialGradient(
        coreAttributes: SvgCoreAttributes(id: 'rg2'),
        cx: SvgPercentage(50),
        cy: SvgPercentage(50),
        r: SvgPercentage(50),
        fx: SvgPercentage(50),
        fy: SvgPercentage(50),
        fr: SvgPercentage(0),
        stops: <SvgStop>[
          SvgStop(
            offset: SvgPercentage(0),
            stopColor: SvgNamedColor(SvgColorName.red),
            stopOpacity: SvgPercentage(100),
          )
        ],
      );

      final Result<PaintCommand> result = gradient.toPaintCommand(context);
      expect(result, isA<Success<PaintCommand>>());
      final PaintCommand cmd = (result as Success<PaintCommand>).value;
      expect(cmd, isA<DefineRadialGradient>());
    });
  });
}
