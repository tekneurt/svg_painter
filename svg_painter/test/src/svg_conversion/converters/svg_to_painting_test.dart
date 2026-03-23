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
        const root = SvgRoot(
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
        const root = SvgRoot(children: <SvgElement>[]);

        // Act
        final Result<List<PaintCommand>> result = root.toPaintCommands();

        // Assert
        expect(result, isA<Success<List<PaintCommand>>>());
      });

      test('should use explicit width/height if provided', () {
        const root = SvgRoot(
          children: <SvgElement>[],
          width: SvgLength(500),
          height: SvgLength(300),
        );

        final Result<List<PaintCommand>> result = root.toPaintCommands();
        expect(result, isA<Success<List<PaintCommand>>>());
      });

      test('should resolve width/height from percentages and auto', () {
        const root = SvgRoot(
          width: SvgPercentage(50),
          height: SvgAuto(),
          viewportAttributes: SvgViewportAttributes(viewBox: SvgViewBox(0, 0, 100, 100)),
          children: [],
        );
        // Defaults to 100x100 if no context, so 50% = 50
        final result = root.toPaintCommands();
        expect(result, isA<Success<List<PaintCommand>>>());
      });

      test('should hit all preserveAspectRatio alignment cases', () {
        final alignments = SvgPreserveAspectRatioAlignment.values;

        for (final alignment in alignments) {
          final root = SvgRoot(
            viewportAttributes: SvgViewportAttributes(
              viewBox: const SvgViewBox(0, 0, 50, 50),
              preserveAspectRatio: SvgPreserveAspectRatio(alignment: alignment),
            ),
            width: const SvgLength(100),
            height: const SvgLength(100),
            children: [],
          );

          final result = root.toPaintCommands();
          expect(result, isA<Success<List<PaintCommand>>>());
        }
      });

      test('should hit all preserveAspectRatio alignments with slice scaling', () {
        for (final alignment in SvgPreserveAspectRatioAlignment.values) {
          final root = SvgRoot(
            viewportAttributes: SvgViewportAttributes(
              viewBox: const SvgViewBox(0, 0, 100, 50), // Wide viewBox
              preserveAspectRatio: SvgPreserveAspectRatio(
                alignment: alignment,
                scale: SvgPreserveAspectRatioScale.slice,
              ),
            ),
            width: const SvgLength(100),
            height: const SvgLength(100),
            children: [],
          );

          final result = root.toPaintCommands();
          expect(result, isA<Success<List<PaintCommand>>>());
        }
      });

      test('should fallback to 100x100 when everything is null', () {
        const root = SvgRoot(children: []);
        final result = root.toPaintCommands();
        expect(result, isA<Success<List<PaintCommand>>>());
      });
    });

    group('SvgSymbol', () {
      test('should convert to definition commands when requested', () {
        const grad = SvgLinearGradient(
          coreAttributes: SvgCoreAttributes(id: 'grad1'),
          x1: SvgLength(0),
          y1: SvgLength(0),
          x2: SvgLength(100),
          y2: SvgLength(0),
          stops: <SvgStop>[],
        );
        const symbol = SvgSymbol(
          coreAttributes: SvgCoreAttributes(id: 'sym1'),
          children: <SvgElement>[grad],
        );

        // We can't directly call _toPaintCommands(onlyDefinitions: true) from outside,
        // but symbol.toPaintCommands() calls it with true.
        final Result<List<PaintCommand>> result = symbol.toPaintCommands();
        final List<PaintCommand> commands = (result as Success<List<PaintCommand>>).value;

        expect(commands.whereType<DefineLinearGradient>().length, 1);
      });

      test('should hit all alignments in symbol viewport mapping', () {
        for (final alignment in SvgPreserveAspectRatioAlignment.values) {
          const rect = SvgRect(
            x: SvgLength(0), y: SvgLength(0), width: SvgLength(10), height: SvgLength(10),
            rx: SvgLength(0), ry: SvgLength(0),
          );
          final symbol = SvgSymbol(
            coreAttributes: const SvgCoreAttributes(id: 's'),
            viewportAttributes: SvgViewportAttributes(
              viewBox: const SvgViewBox(0, 0, 50, 50),
              preserveAspectRatio: SvgPreserveAspectRatio(alignment: alignment),
            ),
            children: [rect],
          );
          final use = SvgUse(
            href: '#s',
            x: const SvgLength(0), y: const SvgLength(0),
            width: const SvgLength(100), height: const SvgLength(100),
          );
          final root = SvgRoot(children: [symbol, use]);

          expect(root.toPaintCommands(), isA<Success<List<PaintCommand>>>());
        }
      });
    });

    group('SvgUse', () {
      test('should collect definitions correctly', () {
        const target = SvgRect(
          coreAttributes: SvgCoreAttributes(id: 'rect1'),
          x: SvgLength(0),
          y: SvgLength(0),
          width: SvgLength(10),
          height: SvgLength(10),
          rx: SvgLength(0),
          ry: SvgLength(0),
        );
        const root = SvgRoot(children: <SvgElement>[target]);
        final defs = <String, SvgElement>{};
        root.collectDefinitions(defs);

        expect(defs.containsKey('rect1'), isTrue);
      });

      test('should return Failure if target ID not found', () {
        // Arrange
        const use = SvgUse(
          href: '#missing',
          x: SvgLength(0),
          y: SvgLength(0),
          width: SvgAuto(),
          height: SvgAuto(),
        );
        const root = SvgRoot(children: <SvgElement>[use]);

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
        const target = SvgRect(
          coreAttributes: SvgCoreAttributes(id: 'rect1'),
          x: SvgLength(0),
          y: SvgLength(0),
          width: SvgLength(10),
          height: SvgLength(10),
          rx: SvgLength(0),
          ry: SvgLength(0),
        );
        const use = SvgUse(
          href: '#rect1',
          x: SvgLength(50),
          y: SvgLength(50),
          width: SvgAuto(),
          height: SvgAuto(),
        );
        const root = SvgRoot(
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
        final rootGroup = commands.single as DrawGroup;

        // 1. DrawRect (original)
        // 2. DrawGroup (via Use) - verify position
        expect(rootGroup.commands.length, 2);

        final DrawGroup useGroup = rootGroup.commands.whereType<DrawGroup>().single;
        expect(useGroup.commands.single, isA<DrawRect>());

        final rectInUse = useGroup.commands.single as DrawRect;
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
        const grad = SvgLinearGradient(
          coreAttributes: SvgCoreAttributes(id: 'grad1'),
          x1: SvgLength(0),
          y1: SvgLength(0),
          x2: SvgLength(100),
          y2: SvgLength(0),
          stops: <SvgStop>[],
        );
        const rect = SvgRect(
          coreAttributes: SvgCoreAttributes(id: 'rect1'),
          x: SvgLength(0),
          y: SvgLength(0),
          width: SvgLength(10),
          height: SvgLength(10),
          rx: SvgLength(0),
          ry: SvgLength(0),
        );

        const defs = SvgDefs(children: <SvgElement>[grad, rect]);
        const root = SvgRoot(
          children: <SvgElement>[defs],
          viewportAttributes: SvgViewportAttributes(viewBox: SvgViewBox(0, 0, 100, 100)),
        );

        // Act
        final Result<List<PaintCommand>> result = root.toPaintCommands();

        // Assert
        final List<PaintCommand> commands = (result as Success<List<PaintCommand>>).value;
        final rootGroup = commands.single as DrawGroup;

        // Should contain DefineLinearGradient, but NOT DrawRect
        expect(rootGroup.commands.whereType<DefineLinearGradient>().length, 1);
        expect(rootGroup.commands.whereType<DrawRect>().length, 0);
      });

      test('should return radial gradient command when present', () {
        const grad = SvgRadialGradient(
          coreAttributes: SvgCoreAttributes(id: 'rad1'),
          cx: SvgLength(50),
          cy: SvgLength(50),
          r: SvgLength(50),
          fx: SvgLength(50),
          fy: SvgLength(50),
          fr: SvgLength(0),
          stops: <SvgStop>[],
        );
        const defs = SvgDefs(children: <SvgElement>[grad]);
        const root = SvgRoot(
          children: <SvgElement>[defs],
          viewportAttributes: SvgViewportAttributes(viewBox: SvgViewBox(0, 0, 100, 100)),
        );

        final Result<List<PaintCommand>> result = root.toPaintCommands();
        final List<PaintCommand> commands = (result as Success<List<PaintCommand>>).value;
        final rootGroup = commands.single as DrawGroup;

        expect(rootGroup.commands.whereType<DefineRadialGradient>().length, 1);
      });
    });

    group('Transforms', () {
      test('should combine transform attribute with layout attributes (x, y)', () {
        const rect = SvgRect(
          coreAttributes: SvgCoreAttributes(id: 'r1'),
          x: SvgLength(10),
          y: SvgLength(20),
          width: SvgLength(100),
          height: SvgLength(100),
          rx: SvgLength(0),
          ry: SvgLength(0),
        );
        const use = SvgUse(
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
        const root = SvgRoot(
          children: <SvgElement>[rect, use],
          viewportAttributes: SvgViewportAttributes(viewBox: SvgViewBox(0, 0, 500, 500)),
        );

        final Result<List<PaintCommand>> result = root.toPaintCommands();
        final List<PaintCommand> commands = (result as Success<List<PaintCommand>>).value;
        final rootGroup = commands.single as DrawGroup;
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
        const nested = SvgRoot(
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
        const root = SvgRoot(
          children: <SvgElement>[nested],
          viewportAttributes: SvgViewportAttributes(viewBox: SvgViewBox(0, 0, 500, 500)),
        );

        final Result<List<PaintCommand>> result = root.toPaintCommands();
        final List<PaintCommand> commands = (result as Success<List<PaintCommand>>).value;
        final rootGroup = commands.single as DrawGroup;
        
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

      test('should apply clipRect to nested svg with shifted viewBox', () {
        const nested = SvgSvg(
          width: SvgLength(100),
          height: SvgLength(100),
          viewportAttributes: SvgViewportAttributes(
            viewBox: SvgViewBox(10, 10, 50, 50),
          ),
          children: [],
        );
        const root = SvgRoot(children: [nested]);

        final result = root.toPaintCommands();
        final cmds = (result as Success<List<PaintCommand>>).value;
        final rootGroup = cmds.single as DrawGroup;
        final nestedViewportGroup = rootGroup.commands.whereType<DrawGroup>().first;

        expect(nestedViewportGroup.style.clipRect, isNotNull);
      });

      test('should apply clipRect to nested svg when scale is slice', () {
        const root = SvgRoot(
          viewportAttributes: SvgViewportAttributes(
            viewBox: SvgViewBox(0, 0, 100, 100),
            preserveAspectRatio: SvgPreserveAspectRatio(
              alignment: SvgPreserveAspectRatioAlignment.xMidYMid,
              scale: SvgPreserveAspectRatioScale.slice,
            ),
          ),
          width: SvgLength(100),
          height: SvgLength(50),
          children: [],
        );

        final result = root.toPaintCommands();
        final cmds = (result as Success<List<PaintCommand>>).value;
        final drawGroup = cmds.single as DrawGroup;
        expect(drawGroup.style.clipRect, isNotNull);
      });

      test('should resolve width/height to context size when null in nested svg', () {
        const nested = SvgSvg(
          children: [],
          viewportAttributes: SvgViewportAttributes(),
        );
        const root = SvgRoot(
          children: [nested],
          viewportAttributes: SvgViewportAttributes(viewBox: SvgViewBox(0, 0, 500, 500)),
        );

        final result = root.toPaintCommands();
        expect(result, isA<Success<List<PaintCommand>>>());
      });
    });

    group('SvgGroup', () {
      test('should use DrawGroup when opacity < 1.0', () {
        const rect1 = SvgRect(
          x: SvgLength(0),
          y: SvgLength(0),
          width: SvgLength(10),
          height: SvgLength(10),
          rx: SvgLength(0),
          ry: SvgLength(0),
        );
        const rect2 = SvgRect(
          x: SvgLength(20),
          y: SvgLength(0),
          width: SvgLength(10),
          height: SvgLength(10),
          rx: SvgLength(0),
          ry: SvgLength(0),
        );
        const group = SvgGroup(
          children: <SvgElement>[rect1, rect2],
          presentationAttributes: SvgPresentationAttributes(
            graphics: SvgGraphicsAttributes(opacity: SvgPercentage(50)),
          ),
        );
        const root = SvgRoot(children: <SvgElement>[group]);

        final Result<List<PaintCommand>> result = root.toPaintCommands();
        final List<PaintCommand> commands = (result as Success<List<PaintCommand>>).value;
        final rootGroup = commands.single as DrawGroup;

        expect(rootGroup.commands.single, isA<DrawGroup>());
        final drawGroup = rootGroup.commands.single as DrawGroup;
        expect(drawGroup.opacity, 0.5);
        expect(drawGroup.commands.length, 2);
      });

      test('should use DrawGroup even when opacity is 1.0', () {
        const rect1 = SvgRect(
          x: SvgLength(0),
          y: SvgLength(0),
          width: SvgLength(10),
          height: SvgLength(10),
          rx: SvgLength(0),
          ry: SvgLength(0),
        );
        const group = SvgGroup(
          children: <SvgElement>[rect1],
          presentationAttributes: SvgPresentationAttributes(
            graphics: SvgGraphicsAttributes(opacity: SvgPercentage(100)),
          ),
        );
        const root = SvgRoot(children: <SvgElement>[group]);

        final Result<List<PaintCommand>> result = root.toPaintCommands();
        final List<PaintCommand> commands = (result as Success<List<PaintCommand>>).value;
        final rootGroup = commands.single as DrawGroup;

        expect(rootGroup.commands.single, isA<DrawGroup>());
        final drawGroup = rootGroup.commands.single as DrawGroup;
        expect(drawGroup.opacity, 1.0);
      });

      test('should apply group opacity recursively', () {
        const group = SvgGroup(
          children: [
            SvgCircle(cx: SvgLength(0), cy: SvgLength(0), r: SvgLength(5)),
          ],
          presentationAttributes: SvgPresentationAttributes(
            graphics: SvgGraphicsAttributes(opacity: SvgPercentage(50)),
          ),
        );
        const root = SvgRoot(children: [group]);

        final result = root.toPaintCommands();
        final cmds = (result as Success<List<PaintCommand>>).value;
        final rootGroup = cmds.single as DrawGroup;
        final innerGroup = rootGroup.commands.single as DrawGroup;

        expect(innerGroup.opacity, 0.5);
      });
    });

    group('Delegation', () {
      test('should delegate to all element types', () {
        final elements = <SvgElement>[
          const SvgCircle(cx: SvgLength(10), cy: SvgLength(10), r: SvgLength(10)),
          const SvgEllipse(cx: SvgLength(10), cy: SvgLength(10), rx: SvgLength(5), ry: SvgLength(5)),
          const SvgLine(x1: SvgLength(0), y1: SvgLength(0), x2: SvgLength(10), y2: SvgLength(10)),
          const SvgRect(x: SvgLength(0), y: SvgLength(0), width: SvgLength(10), height: SvgLength(10), rx: SvgLength(2), ry: SvgLength(2)),
          const SvgPath(d: 'M0,0 L10,10'),

          const SvgPolyline(points: SvgPointList(<double>[0, 0, 10, 10])),
          const SvgPolygon(points: SvgPointList(<double>[0, 0, 10, 10, 0, 10])),
          const SvgText(x: SvgLength(10), y: SvgLength(10), children: <SvgTextContent>[SvgCharacterData('test')]),
        ];


        final root = SvgRoot(children: elements);
        final Result<List<PaintCommand>> result = root.toPaintCommands();
        final List<PaintCommand> commands = (result as Success<List<PaintCommand>>).value;
        final rootGroup = commands.single as DrawGroup;

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
        const root = SvgRoot(
          children: <SvgElement>[
            SvgTitle(content: 'Title'),
            SvgDesc(content: 'Desc'),
            SvgStyle(content: ''),
            SvgIgnoredElement(),
          ],
        );

        final Result<List<PaintCommand>> result = root.toPaintCommands();
        final List<PaintCommand> commands = (result as Success<List<PaintCommand>>).value;
        final rootGroup = commands.single as DrawGroup;

        expect(rootGroup.commands, isEmpty);
      });
    });
  });
}
