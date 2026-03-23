import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/painting_model/_painting_model.dart';
import 'package:svg_painter/src/svg_conversion/converters/svg_painting_context.dart';
import 'package:svg_painter/src/svg_conversion/svg_element_extensions/svg_gradient_to_painting.dart';
import 'package:svg_painter/src/svg_model/_svg_model.dart';
import 'package:test/test.dart';

void main() {
  group('SvgGradientToPainting', () {
    const context = SvgPaintingContext(viewBoxWidth: 100, viewBoxHeight: 100);

    test('SvgLinearGradient should convert to DefineLinearGradient', () {
      const grad = SvgLinearGradient(
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
      final lgrad = cmd as DefineLinearGradient;
      expect(lgrad.id, 'g1');
      expect(lgrad.stops, hasLength(2));
      expect(lgrad.stops[1].opacity, 0.5);
    });

    test('SvgLinearGradient should preserve gradientTransformAttributes', () {
      const grad = SvgLinearGradient(
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
      final lgrad = cmd as DefineLinearGradient;
      expect(lgrad.x1, closeTo(0, 0.001));
      expect(lgrad.y1, closeTo(0, 0.001));
      expect(lgrad.x2, closeTo(0, 0.001));
      expect(lgrad.y2, closeTo(1, 0.001));
      expect(lgrad.transformAttributes, isNotNull);
      expect(lgrad.transformAttributes!.operations.first, isA<SvgRotate>());
    });

    test('SvgRadialGradient should convert to DefineRadialGradient', () {
      const grad = SvgRadialGradient(
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
      final rgrad = cmd as DefineRadialGradient;
      expect(rgrad.id, 'rg1');
      expect(rgrad.cx, 50.0);
    });

    test('should handle userSpaceOnUse units', () {
      const grad = SvgLinearGradient(
        coreAttributes: SvgCoreAttributes(id: 'g'),
        x1: SvgLength(10),
        y1: SvgLength(10),
        x2: SvgLength(50),
        y2: SvgLength(10),
        stops: [],
        gradientUnits: SvgGradientUnits.userSpaceOnUse,
      );

      final Result<PaintCommand> result = grad.toPaintCommand(context);
      final cmd = (result as Success<PaintCommand>).value as DefineLinearGradient;

      expect(cmd.units, PaintingGradientUnits.userSpaceOnUse);
      expect(cmd.x1, 0.1);
    });

    test('should handle all spreadMethod values', () {
      final Map<SvgSpreadMethod, PaintingSpreadMethod> map = {
        SvgSpreadMethod.pad: PaintingSpreadMethod.pad,
        SvgSpreadMethod.reflect: PaintingSpreadMethod.reflect,
        SvgSpreadMethod.repeat: PaintingSpreadMethod.repeat,
      };

      for (final MapEntry<SvgSpreadMethod, PaintingSpreadMethod> entry in map.entries) {
        final grad = SvgLinearGradient(
          coreAttributes: const SvgCoreAttributes(id: 'g'),
          x1: const SvgLength(0),
          y1: const SvgLength(0),
          x2: const SvgLength(1),
          y2: const SvgLength(0),
          stops: const [],
          spreadMethod: entry.key,
        );
        final cmd = (grad.toPaintCommand(context) as Success<PaintCommand>).value as DefineLinearGradient;
        expect(cmd.spreadMethod, entry.value);
      }
    });
  });
}
