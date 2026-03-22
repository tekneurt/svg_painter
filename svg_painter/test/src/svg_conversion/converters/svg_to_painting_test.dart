import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/svg_conversion/converters/svg_definition_collector.dart';
import 'package:svg_painter/src/svg_conversion/converters/svg_to_painting.dart';
import 'package:svg_painter/src/svg_model/_svg_model.dart';
import 'package:test/test.dart';

void main() {
  group('SvgElementToPaintCommands', () {
    group('SvgRoot initialization', () {
      test('should initialize root context from viewBox', () {
        // Arrange
        const SvgRoot root = SvgRoot(
          children: <SvgElement>[],
          viewportAttributes: SvgViewportAttributes(viewBox: SvgViewBox(0, 0, 200, 100)),
        );

        // Act
        final Result<List<PaintCommand>> result = root.toPaintCommands();

        // Assert
        expect(result, isA<Success<List<PaintCommand>>>());
      });

      test('should fallback to default 100x100 if no dimensions', () {
        // Arrange
        const SvgRoot root = SvgRoot(children: <SvgElement>[]);

        // Act
        final Result<List<PaintCommand>> result = root.toPaintCommands();

        // Assert
        expect(result, isA<Success<List<PaintCommand>>>());
      });

      test('should use explicit width/height if provided', () {
        const SvgRoot root = SvgRoot(
          children: <SvgElement>[],
          width: SvgLength(500),
          height: SvgLength(300),
        );

        final Result<List<PaintCommand>> result = root.toPaintCommands();
        expect(result, isA<Success<List<PaintCommand>>>());
      });
    });

    group('SvgUse', () {
      test('should collect definitions correctly', () {
        const SvgRect target = SvgRect(
          coreAttributes: SvgCoreAttributes(id: 'rect1'),
          x: SvgLength(0),
          y: SvgLength(0),
          width: SvgLength(10),
          height: SvgLength(10),
          rx: SvgLength(0),
          ry: SvgLength(0),
        );
        const SvgRoot root = SvgRoot(children: <SvgElement>[target]);
        final Map<String, SvgElement> defs = <String, SvgElement>{};
        root.collectDefinitions(defs);

        expect(defs.containsKey('rect1'), isTrue);
      });

      test('should return Failure if target ID not found', () {
        // Arrange
        const SvgUse use = SvgUse(
          href: '#missing',
          x: SvgLength(0),
          y: SvgLength(0),
          width: SvgLength(10),
          height: SvgLength(10),
        );
        const SvgRoot root = SvgRoot(children: <SvgElement>[use]);

        // Act
        final Result<List<PaintCommand>> result = root.toPaintCommands();

        // Assert
        expect(result, isA<Failure<List<PaintCommand>>>());
        expect(
          (result as Failure<List<PaintCommand>>).message,
          contains('Could not find definition'),
        );
      });

      test('should resolve target and apply transform', () {
        // Arrange
        const SvgRect target = SvgRect(
          coreAttributes: SvgCoreAttributes(id: 'rect1'),
          x: SvgLength(0),
          y: SvgLength(0),
          width: SvgLength(10),
          height: SvgLength(10),
          rx: SvgLength(0),
          ry: SvgLength(0),
        );
        const SvgUse use = SvgUse(
          href: '#rect1',
          x: SvgLength(50),
          y: SvgLength(50),
          width: SvgLength(10),
          height: SvgLength(10),
        );
        const SvgRoot root = SvgRoot(
          children: <SvgElement>[target, use],
          viewportAttributes: SvgViewportAttributes(viewBox: SvgViewBox(0, 0, 100, 100)),
        );

        // Act
        final Result<List<PaintCommand>> result = root.toPaintCommands();

        if (result is Failure<List<PaintCommand>>) {
          fail('Expected Success but got Failure: ${result.message}');
        }

        // Assert
        final List<PaintCommand> commands = (result as Success<List<PaintCommand>>).value;
        // The root is always a DrawGroup now.
        expect(commands.single, isA<DrawGroup>());
        final DrawGroup rootGroup = commands.single as DrawGroup;

        // 1. DrawRect (original)
        // 2. DrawGroup (via Use) - verify position
        expect(rootGroup.commands.length, 2);

        final DrawGroup useGroup = rootGroup.commands.whereType<DrawGroup>().single;
        expect(useGroup.commands.single, isA<DrawRect>());

        final DrawRect rectInUse = useGroup.commands.single as DrawRect;
        // Coordinates should be 0,0 because translate(50, 50) is in useGroup transform.
        expect(rectInUse.x, 0.0);
        expect(rectInUse.y, 0.0);

        expect(
          useGroup.style.transformAttributes?.operations.any(
            (SvgTransformOperation op) => op is SvgTranslate && op.x == 50.0 && op.y == 50.0,
          ),
          isTrue,
        );
      });
    });

    group('SvgDefs', () {
      test('should only return definition commands', () {
        // Arrange
        const SvgLinearGradient grad = SvgLinearGradient(
          coreAttributes: SvgCoreAttributes(id: 'grad1'),
          x1: SvgLength(0),
          y1: SvgLength(0),
          x2: SvgLength(100),
          y2: SvgLength(0),
          stops: <SvgStop>[],
        );
        const SvgRect rect = SvgRect(
          coreAttributes: SvgCoreAttributes(id: 'rect1'),
          x: SvgLength(0),
          y: SvgLength(0),
          width: SvgLength(10),
          height: SvgLength(10),
          rx: SvgLength(0),
          ry: SvgLength(0),
        );

        const SvgDefs defs = SvgDefs(children: <SvgElement>[grad, rect]);
        const SvgRoot root = SvgRoot(
          children: <SvgElement>[defs],
          viewportAttributes: SvgViewportAttributes(viewBox: SvgViewBox(0, 0, 100, 100)),
        );

        // Act
        final Result<List<PaintCommand>> result = root.toPaintCommands();

        // Assert
        final List<PaintCommand> commands = (result as Success<List<PaintCommand>>).value;
        final DrawGroup rootGroup = commands.single as DrawGroup;

        // Should contain DefineLinearGradient, but NOT DrawRect
        expect(rootGroup.commands.whereType<DefineLinearGradient>().length, 1);
        expect(rootGroup.commands.whereType<DrawRect>().length, 0);
      });

      test('should return radial gradient command when present', () {
        const SvgRadialGradient grad = SvgRadialGradient(
          coreAttributes: SvgCoreAttributes(id: 'rad1'),
          cx: SvgLength(50),
          cy: SvgLength(50),
          r: SvgLength(50),
          fx: SvgLength(50),
          fy: SvgLength(50),
          fr: SvgLength(0),
          stops: <SvgStop>[],
        );
        const SvgDefs defs = SvgDefs(children: <SvgElement>[grad]);
        const SvgRoot root = SvgRoot(
          children: <SvgElement>[defs],
          viewportAttributes: SvgViewportAttributes(viewBox: SvgViewBox(0, 0, 100, 100)),
        );

        final Result<List<PaintCommand>> result = root.toPaintCommands();
        final List<PaintCommand> commands = (result as Success<List<PaintCommand>>).value;
        final DrawGroup rootGroup = commands.single as DrawGroup;

        expect(rootGroup.commands.whereType<DefineRadialGradient>().length, 1);
      });
    });

    group('Transforms', () {
      test('should combine transform attribute with layout attributes (x, y)', () {
        const SvgRect rect = SvgRect(
          coreAttributes: SvgCoreAttributes(id: 'r1'),
          x: SvgLength(10),
          y: SvgLength(20),
          width: SvgLength(100),
          height: SvgLength(100),
          rx: SvgLength(0),
          ry: SvgLength(0),
        );
        const SvgUse use = SvgUse(
          href: '#r1',
          x: SvgLength(5),
          y: SvgLength(5),
          width: SvgAuto(),
          height: SvgAuto(),
          presentationAttributes: SvgPresentationAttributes(
            graphics: SvgGraphicsAttributes(
              transformAttributes: SvgTransformAttributes(<SvgTransformOperation>[SvgScale(2)]),
            ),
          ),
        );
        const SvgRoot root = SvgRoot(
          children: <SvgElement>[rect, use],
          viewportAttributes: SvgViewportAttributes(viewBox: SvgViewBox(0, 0, 500, 500)),
        );

        final Result<List<PaintCommand>> result = root.toPaintCommands();
        final List<PaintCommand> commands = (result as Success<List<PaintCommand>>).value;
        final DrawGroup rootGroup = commands.single as DrawGroup;
        final DrawGroup useGroup = rootGroup.commands.whereType<DrawGroup>().single;

        final List<SvgTransformOperation> ops = useGroup.style.transformAttributes!.operations;
        // For <use>, order is [Translate(x,y), ...transformAttributes]
        expect(ops.length, 2);
        expect(ops[0], isA<SvgTranslate>());
        expect(ops[1], isA<SvgScale>());
      });
    });

    group('Nested SVG', () {
      test('should handle nested SVG with full transform stack', () {
        const SvgRoot nested = SvgRoot(
          children: <SvgElement>[],
          x: SvgLength(10),
          y: SvgLength(20),
          width: SvgLength(200),
          height: SvgLength(100),
          viewportAttributes: SvgViewportAttributes(viewBox: SvgViewBox(0, 0, 100, 50)), // sx = 2, sy = 2
          presentationAttributes: SvgPresentationAttributes(
            graphics: SvgGraphicsAttributes(
              transformAttributes: SvgTransformAttributes(<SvgTransformOperation>[SvgRotate(45)]),
            ),
          ),
        );
        const SvgRoot root = SvgRoot(
          children: <SvgElement>[nested],
          viewportAttributes: SvgViewportAttributes(viewBox: SvgViewBox(0, 0, 500, 500)),
        );

        final Result<List<PaintCommand>> result = root.toPaintCommands();
        final List<PaintCommand> commands = (result as Success<List<PaintCommand>>).value;
        final DrawGroup rootGroup = commands.single as DrawGroup;
        
        // The nested SVG is now represented by an outer viewport group and an inner viewBox group.
        final DrawGroup nestedViewportGroup = rootGroup.commands.whereType<DrawGroup>().single;
        final DrawGroup nestedViewBoxGroup = nestedViewportGroup.commands.whereType<DrawGroup>().single;

        final List<SvgTransformOperation> viewportOps = nestedViewportGroup.style.transformAttributes!.operations;
        // For outer <svg> viewport, order is [...transformAttributes, Translate(x,y)]
        expect(viewportOps.length, 2);
        expect(viewportOps[0], isA<SvgRotate>());
        expect(viewportOps[1], isA<SvgTranslate>());

        final List<SvgTransformOperation> viewBoxOps = nestedViewBoxGroup.style.transformAttributes!.operations;
        // For inner <svg> viewBox, order is [Scale(sx,sy)] (since minX/Y and align are 0 in this test)
        expect(viewBoxOps.length, 1);
        expect(viewBoxOps[0], isA<SvgScale>());
      });
    });

    group('SvgGroup', () {
      test('should use DrawGroup when opacity < 1.0 and multiple children', () {
        const SvgRect rect1 = SvgRect(
          x: SvgLength(0),
          y: SvgLength(0),
          width: SvgLength(10),
          height: SvgLength(10),
          rx: SvgLength(0),
          ry: SvgLength(0),
        );
        const SvgRect rect2 = SvgRect(
          x: SvgLength(20),
          y: SvgLength(0),
          width: SvgLength(10),
          height: SvgLength(10),
          rx: SvgLength(0),
          ry: SvgLength(0),
        );
        const SvgGroup group = SvgGroup(
          children: <SvgElement>[rect1, rect2],
          presentationAttributes: SvgPresentationAttributes(
            graphics: SvgGraphicsAttributes(opacity: SvgPercentage(50)),
          ),
        );
        const SvgRoot root = SvgRoot(children: <SvgElement>[group]);

        final Result<List<PaintCommand>> result = root.toPaintCommands();
        final List<PaintCommand> commands = (result as Success<List<PaintCommand>>).value;
        final DrawGroup rootGroup = commands.single as DrawGroup;

        expect(rootGroup.commands.single, isA<DrawGroup>());
        final DrawGroup drawGroup = rootGroup.commands.single as DrawGroup;
        expect(drawGroup.opacity, 0.5);
        expect(drawGroup.commands.length, 2);
      });

      test('should flatten group when opacity is 1.0', () {
        const SvgRect rect1 = SvgRect(
          x: SvgLength(0),
          y: SvgLength(0),
          width: SvgLength(10),
          height: SvgLength(10),
          rx: SvgLength(0),
          ry: SvgLength(0),
        );
        const SvgGroup group = SvgGroup(
          children: <SvgElement>[rect1],
          presentationAttributes: SvgPresentationAttributes(
            graphics: SvgGraphicsAttributes(opacity: SvgPercentage(100)),
          ),
        );
        const SvgRoot root = SvgRoot(children: <SvgElement>[group]);

        final Result<List<PaintCommand>> result = root.toPaintCommands();
        final List<PaintCommand> commands = (result as Success<List<PaintCommand>>).value;
        final DrawGroup rootGroup = commands.single as DrawGroup;

        expect(rootGroup.commands.single, isA<DrawGroup>());
        final DrawGroup drawGroup = rootGroup.commands.single as DrawGroup;
        expect(drawGroup.opacity, 1.0);
      });
    });

    group('Delegation', () {
      test('should delegate to all element types', () {
        final List<SvgElement> elements = <SvgElement>[
          const SvgCircle(cx: SvgLength(10), cy: SvgLength(10), r: SvgLength(10)),
          const SvgEllipse(cx: SvgLength(10), cy: SvgLength(10), rx: SvgLength(5), ry: SvgLength(5)),
          const SvgLine(x1: SvgLength(0), y1: SvgLength(0), x2: SvgLength(10), y2: SvgLength(10)),
          const SvgRect(x: SvgLength(0), y: SvgLength(0), width: SvgLength(10), height: SvgLength(10), rx: SvgLength(2), ry: SvgLength(2)),
          const SvgPath(d: 'M0,0 L10,10'),

          const SvgPolyline(points: SvgPointList(<double>[0, 0, 10, 10])),
          const SvgPolygon(points: SvgPointList(<double>[0, 0, 10, 10, 0, 10])),
          const SvgText(x: SvgLength(10), y: SvgLength(10), children: <SvgTextContent>[SvgCharacterData('test')]),
        ];


        final SvgRoot root = SvgRoot(children: elements);
        final Result<List<PaintCommand>> result = root.toPaintCommands();
        final List<PaintCommand> commands = (result as Success<List<PaintCommand>>).value;
        final DrawGroup rootGroup = commands.single as DrawGroup;

        // Verify we got commands for each
        expect(rootGroup.commands.length, elements.length);

        expect(rootGroup.commands.whereType<DrawCircle>().length, 1); // Circle
        expect(rootGroup.commands.whereType<DrawOval>().length, 1); // Ellipse
        expect(rootGroup.commands.whereType<DrawLine>().length, 1);
        expect(rootGroup.commands.whereType<DrawRect>().length, 1);
        expect(rootGroup.commands.whereType<DrawPath>().length, 1);
        expect(rootGroup.commands.whereType<DrawPolyline>().length, 1);
        expect(rootGroup.commands.whereType<DrawPolygon>().length, 1);
        expect(rootGroup.commands.whereType<DrawText>().length, 1);
      });

      test('should ignore non-renderable elements', () {
        const SvgRoot root = SvgRoot(
          children: <SvgElement>[
            SvgTitle(content: 'Title'),
            SvgDesc(content: 'Desc'),
            SvgStyle(content: ''),
            SvgIgnoredElement(),
          ],
        );

        final Result<List<PaintCommand>> result = root.toPaintCommands();
        final List<PaintCommand> commands = (result as Success<List<PaintCommand>>).value;
        final DrawGroup rootGroup = commands.single as DrawGroup;

        expect(rootGroup.commands, isEmpty);
      });
    });
  });
}
