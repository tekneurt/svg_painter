import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/painting_model/styles/painting_style.dart';
import 'package:svg_painter/src/svg_conversion/converters/svg_painting_context.dart';
import 'package:svg_painter/src/svg_conversion/svg_element_extensions/svg_gradient_to_painting.dart';
import 'package:svg_painter/src/svg_model/attribute_groups/svg_core_attributes.dart';
import 'package:svg_painter/src/svg_model/attribute_groups/svg_transform_attributes.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_style_sheet.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgGradientToPainting', () {
    const context = SvgPaintingContext(viewBoxWidth: 100, viewBoxHeight: 100);

    test('SvgLinearGradient should convert to DefineLinearGradient', () {
      // Arrange
      const grad = SvgLinearGradient(
        coreAttributes: SvgCoreAttributes(id: 'g1'),
        x1: SvgLength(0),
        y1: SvgLength(0),
        x2: SvgLength(1),
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
      final lgrad = cmd as DefineLinearGradient;
      expect(lgrad.id, 'g1');
      expect(lgrad.x1, 0.0);
      expect(lgrad.x2, 1.0);
      expect(lgrad.stops, hasLength(2));
      expect(lgrad.stops[1].opacity, 0.5);
    });

    test('should resolve unitless numbers as fractions under objectBoundingBox', () {
      // Arrange
      const grad = SvgRadialGradient(
        coreAttributes: SvgCoreAttributes(id: 'rg-fraction'),
        cx: SvgLength(0.5),
        cy: SvgLength(0.5),
        r: SvgLength(0.5),
        fx: SvgLength(0.5),
        fy: SvgLength(0.5),
        fr: SvgLength(0.0),
        stops: <SvgStop>[],
      );

      // Act
      final Result<PaintCommand> result = grad.toPaintCommand(context);

      // Assert
      expect(result, isA<Success<PaintCommand>>());
      final cmd = (result as Success<PaintCommand>).value as DefineRadialGradient;
      expect(cmd.cx, 0.5);
      expect(cmd.cy, 0.5);
      expect(cmd.radius, 0.5);
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

    test('should normalize radial gradient radius by shortest side under userSpaceOnUse', () {
      // Arrange
      const asymmetricContext = SvgPaintingContext(viewBoxWidth: 420, viewBoxHeight: 200);
      const grad = SvgRadialGradient(
        coreAttributes: SvgCoreAttributes(id: 'rg-user'),
        cx: SvgLength(100),
        cy: SvgLength(100),
        r: SvgLength(100),
        fx: SvgLength(100),
        fy: SvgLength(100),
        fr: SvgLength(0),
        stops: <SvgStop>[],
        gradientUnits: SvgGradientUnits.userSpaceOnUse,
      );

      // Act
      final Result<PaintCommand> result = grad.toPaintCommand(asymmetricContext);

      // Assert
      expect(result, isA<Success<PaintCommand>>());
      final cmd = (result as Success<PaintCommand>).value as DefineRadialGradient;
      expect(cmd.cx, closeTo(100 / 420, 0.0001));
      expect(cmd.cy, 0.5);
      expect(cmd.radius, 0.5);
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
        final cmd =
            (grad.toPaintCommand(context) as Success<PaintCommand>).value as DefineLinearGradient;
        expect(cmd.spreadMethod, entry.value);
      }
    });

    test('should resolve stop currentColor from gradient color when gradient defines color', () {
      // Arrange
      const grad = SvgLinearGradient(
        coreAttributes: SvgCoreAttributes(id: 'g-current'),
        color: SvgNamedColor(SvgColorName.green),
        x1: SvgLength(0),
        y1: SvgLength(0),
        x2: SvgLength(1),
        y2: SvgLength(0),
        stops: <SvgStop>[
          SvgStop(
            offset: SvgLength(0.5),
            stopColor: SvgCurrentColor(),
            stopOpacity: SvgLength(1.0),
          ),
        ],
      );

      // Act
      final Result<PaintCommand> result = grad.toPaintCommand(context);

      // Assert
      expect(result, isA<Success<PaintCommand>>());
      final lgrad = (result as Success<PaintCommand>).value as DefineLinearGradient;
      expect(lgrad.stops.first.colorArgb, 0xFF008000);
    });

    test('should resolve stop currentColor from stop color when stop defines color', () {
      // Arrange
      const grad = SvgLinearGradient(
        coreAttributes: SvgCoreAttributes(id: 'g-current-stop'),
        color: SvgNamedColor(SvgColorName.green),
        x1: SvgLength(0),
        y1: SvgLength(0),
        x2: SvgLength(1),
        y2: SvgLength(0),
        stops: <SvgStop>[
          SvgStop(
            offset: SvgLength(0.5),
            stopColor: SvgCurrentColor(),
            stopOpacity: SvgLength(1.0),
            color: SvgNamedColor(SvgColorName.blue),
          ),
        ],
      );

      // Act
      final Result<PaintCommand> result = grad.toPaintCommand(context);

      // Assert
      expect(result, isA<Success<PaintCommand>>());
      final lgrad = (result as Success<PaintCommand>).value as DefineLinearGradient;
      expect(lgrad.stops.first.colorArgb, 0xFF0000FF);
    });

    test('should inherit stops and coordinates through href when referenced gradient has stops', () {
      // Arrange
      const baseGrad = SvgLinearGradient(
        coreAttributes: SvgCoreAttributes(id: 'base'),
        x1: SvgPercentage(10),
        y1: SvgPercentage(20),
        x2: SvgPercentage(90),
        y2: SvgPercentage(80),
        stops: <SvgStop>[
          SvgStop(
            offset: SvgLength(0),
            stopColor: SvgNamedColor(SvgColorName.red),
            stopOpacity: SvgLength(1.0),
          ),
          SvgStop(
            offset: SvgLength(1),
            stopColor: SvgNamedColor(SvgColorName.blue),
            stopOpacity: SvgLength(0.8),
          ),
        ],
      );
      const childGrad = SvgLinearGradient(
        coreAttributes: SvgCoreAttributes(id: 'derived'),
        href: '#base',
        x1: SvgPercentage(25),
        stops: <SvgStop>[],
      );
      const ctx = SvgPaintingContext(
        viewBoxWidth: 100,
        viewBoxHeight: 100,
        definitions: <String, SvgElement>{'base': baseGrad},
      );

      // Act
      final Result<PaintCommand> result = childGrad.toPaintCommand(ctx);

      // Assert
      expect(result, isA<Success<PaintCommand>>());
      final lgrad = (result as Success<PaintCommand>).value as DefineLinearGradient;
      expect(lgrad.id, 'derived');
      expect(lgrad.x1, 0.25);
      expect(lgrad.y1, 0.20);
      expect(lgrad.x2, 0.90);
      expect(lgrad.y2, 0.80);
      expect(lgrad.stops, hasLength(2));
      expect(lgrad.stops[1].opacity, 0.8);
    });

    test('should inherit across multi-level href chain', () {
      // Arrange
      const gradA = SvgLinearGradient(
        coreAttributes: SvgCoreAttributes(id: 'gradA'),
        stops: <SvgStop>[
          SvgStop(
            offset: SvgLength(0),
            stopColor: SvgNamedColor(SvgColorName.black),
            stopOpacity: SvgLength(1.0),
          ),
          SvgStop(
            offset: SvgLength(1),
            stopColor: SvgNamedColor(SvgColorName.white),
            stopOpacity: SvgLength(1.0),
          ),
        ],
        gradientUnits: SvgGradientUnits.userSpaceOnUse,
        spreadMethod: SvgSpreadMethod.repeat,
      );
      const gradB = SvgLinearGradient(
        coreAttributes: SvgCoreAttributes(id: 'gradB'),
        href: '#gradA',
        x1: SvgPercentage(15),
        y1: SvgPercentage(25),
        stops: <SvgStop>[],
      );
      const gradC = SvgLinearGradient(
        coreAttributes: SvgCoreAttributes(id: 'gradC'),
        href: '#gradB',
        x2: SvgPercentage(75),
        y2: SvgPercentage(85),
        stops: <SvgStop>[],
      );
      const ctx = SvgPaintingContext(
        viewBoxWidth: 100,
        viewBoxHeight: 200,
        definitions: <String, SvgElement>{
          'gradA': gradA,
          'gradB': gradB,
        },
      );

      // Act
      final Result<PaintCommand> result = gradC.toPaintCommand(ctx);

      // Assert
      expect(result, isA<Success<PaintCommand>>());
      final lgrad = (result as Success<PaintCommand>).value as DefineLinearGradient;
      expect(lgrad.id, 'gradC');
      expect(lgrad.x1, 0.15);
      expect(lgrad.y1, 0.25);
      expect(lgrad.x2, 0.75);
      expect(lgrad.y2, 0.85);
      expect(lgrad.units, PaintingGradientUnits.userSpaceOnUse);
      expect(lgrad.spreadMethod, PaintingSpreadMethod.repeat);
      expect(lgrad.stops, hasLength(2));
    });

    test('should prevent infinite loop when circular href reference exists', () {
      // Arrange
      const grad1 = SvgLinearGradient(
        coreAttributes: SvgCoreAttributes(id: 'g1'),
        href: '#g2',
        stops: <SvgStop>[],
      );
      const grad2 = SvgLinearGradient(
        coreAttributes: SvgCoreAttributes(id: 'g2'),
        href: '#g1',
        stops: <SvgStop>[],
      );
      const ctx = SvgPaintingContext(
        viewBoxWidth: 100,
        viewBoxHeight: 100,
        definitions: <String, SvgElement>{
          'g1': grad1,
          'g2': grad2,
        },
      );

      // Act
      final Result<PaintCommand> result = grad1.toPaintCommand(ctx);

      // Assert
      expect(result, isA<Success<PaintCommand>>());
      final lgrad = (result as Success<PaintCommand>).value as DefineLinearGradient;
      expect(lgrad.id, 'g1');
      expect(lgrad.stops, isEmpty);
    });

    test('should inherit stops and spreadMethod when radial gradient references linear gradient', () {
      // Arrange
      const linear = SvgLinearGradient(
        coreAttributes: SvgCoreAttributes(id: 'lin'),
        spreadMethod: SvgSpreadMethod.reflect,
        stops: <SvgStop>[
          SvgStop(
            offset: SvgLength(0),
            stopColor: SvgNamedColor(SvgColorName.yellow),
            stopOpacity: SvgLength(1.0),
          ),
          SvgStop(
            offset: SvgLength(1),
            stopColor: SvgNamedColor(SvgColorName.purple),
            stopOpacity: SvgLength(1.0),
          ),
        ],
      );
      const radial = SvgRadialGradient(
        coreAttributes: SvgCoreAttributes(id: 'rad'),
        href: '#lin',
        cx: SvgPercentage(40),
        cy: SvgPercentage(60),
        r: SvgPercentage(30),
        stops: <SvgStop>[],
      );
      const ctx = SvgPaintingContext(
        viewBoxWidth: 100,
        viewBoxHeight: 100,
        definitions: <String, SvgElement>{'lin': linear},
      );

      // Act
      final Result<PaintCommand> result = radial.toPaintCommand(ctx);

      // Assert
      expect(result, isA<Success<PaintCommand>>());
      final rgrad = (result as Success<PaintCommand>).value as DefineRadialGradient;
      expect(rgrad.id, 'rad');
      expect(rgrad.cx, 0.40);
      expect(rgrad.cy, 0.60);
      expect(rgrad.radius, 0.30);
      expect(rgrad.spreadMethod, PaintingSpreadMethod.reflect);
      expect(rgrad.stops, hasLength(2));
    });

    test('should resolve stop-color and stop-opacity from CSS class when stop defines cssClass', () {
      // Arrange
      const grad = SvgLinearGradient(
        coreAttributes: SvgCoreAttributes(id: 'g-css'),
        x1: SvgLength(0),
        y1: SvgLength(0),
        x2: SvgLength(1),
        y2: SvgLength(0),
        stops: <SvgStop>[
          SvgStop(
            offset: SvgLength(0),
            coreAttributes: SvgCoreAttributes(cssClass: 'stop1'),
          ),
          SvgStop(
            offset: SvgLength(1),
            coreAttributes: SvgCoreAttributes(cssClass: 'stop2'),
          ),
        ],
      );
      const ctx = SvgPaintingContext(
        viewBoxWidth: 100,
        viewBoxHeight: 100,
        styleSheet: SvgStyleSheet(<String, Map<String, String>>{
          'stop1': <String, String>{'stop-color': 'red'},
          'stop2': <String, String>{'stop-color': 'black', 'stop-opacity': '0'},
        }),
      );

      // Act
      final Result<PaintCommand> result = grad.toPaintCommand(ctx);

      // Assert
      expect(result, isA<Success<PaintCommand>>());
      final lgrad = (result as Success<PaintCommand>).value as DefineLinearGradient;
      expect(lgrad.stops[0].colorArgb, 0xFFFF0000);
      expect(lgrad.stops[0].opacity, 1.0);
      expect(lgrad.stops[1].colorArgb, 0xFF000000);
      expect(lgrad.stops[1].opacity, 0.0);
    });

    test('should resolve stop-color and stop-opacity from inline style when stop defines inlineStyle', () {
      // Arrange
      const grad = SvgLinearGradient(
        coreAttributes: SvgCoreAttributes(id: 'g-inline'),
        x1: SvgLength(0),
        y1: SvgLength(0),
        x2: SvgLength(1),
        y2: SvgLength(0),
        stops: <SvgStop>[
          SvgStop(
            offset: SvgLength(0.5),
            coreAttributes: SvgCoreAttributes(inlineStyle: 'stop-color: blue; stop-opacity: 0.5;'),
          ),
        ],
      );

      // Act
      final Result<PaintCommand> result = grad.toPaintCommand(context);

      // Assert
      expect(result, isA<Success<PaintCommand>>());
      final lgrad = (result as Success<PaintCommand>).value as DefineLinearGradient;
      expect(lgrad.stops.first.colorArgb, 0xFF0000FF);
      expect(lgrad.stops.first.opacity, 0.5);
    });

    test('should prefer CSS stylesheet over direct presentation attribute on stop', () {
      // Arrange
      const grad = SvgLinearGradient(
        coreAttributes: SvgCoreAttributes(id: 'g-override'),
        x1: SvgLength(0),
        y1: SvgLength(0),
        x2: SvgLength(1),
        y2: SvgLength(0),
        stops: <SvgStop>[
          SvgStop(
            offset: SvgLength(0),
            stopColor: SvgNamedColor(SvgColorName.green),
            stopOpacity: SvgLength(1.0),
            coreAttributes: SvgCoreAttributes(cssClass: 'stopRed'),
          ),
        ],
      );
      const ctx = SvgPaintingContext(
        viewBoxWidth: 100,
        viewBoxHeight: 100,
        styleSheet: SvgStyleSheet(<String, Map<String, String>>{
          'stopRed': <String, String>{'stop-color': 'red', 'stop-opacity': '0.3'},
        }),
      );

      // Act
      final Result<PaintCommand> result = grad.toPaintCommand(ctx);

      // Assert
      expect(result, isA<Success<PaintCommand>>());
      final lgrad = (result as Success<PaintCommand>).value as DefineLinearGradient;
      expect(lgrad.stops.first.colorArgb, 0xFFFF0000);
      expect(lgrad.stops.first.opacity, 0.3);
    });

    test('should resolve stop currentColor from CSS color property', () {
      // Arrange
      const grad = SvgLinearGradient(
        coreAttributes: SvgCoreAttributes(id: 'g-css-current'),
        x1: SvgLength(0),
        y1: SvgLength(0),
        x2: SvgLength(1),
        y2: SvgLength(0),
        stops: <SvgStop>[
          SvgStop(
            offset: SvgLength(0),
            stopColor: SvgCurrentColor(),
            coreAttributes: SvgCoreAttributes(cssClass: 'stopColorProp'),
          ),
        ],
      );
      const ctx = SvgPaintingContext(
        viewBoxWidth: 100,
        viewBoxHeight: 100,
        styleSheet: SvgStyleSheet(<String, Map<String, String>>{
          'stopColorProp': <String, String>{'color': 'purple'},
        }),
      );

      // Act
      final Result<PaintCommand> result = grad.toPaintCommand(ctx);

      // Assert
      expect(result, isA<Success<PaintCommand>>());
      final lgrad = (result as Success<PaintCommand>).value as DefineLinearGradient;
      expect(lgrad.stops.first.colorArgb, 0xFF800080);
    });
  });
}
