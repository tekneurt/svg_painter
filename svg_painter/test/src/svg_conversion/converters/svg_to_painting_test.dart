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
        const SvgRoot root = SvgRoot(children: <SvgElement>[], viewBox: SvgViewBox(0, 0, 200, 100));

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
          id: 'rect1',
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
          id: 'rect1',
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
          viewBox: SvgViewBox(0, 0, 100, 100),
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
          id: 'grad1',
          x1: SvgLength(0),
          y1: SvgLength(0),
          x2: SvgLength(100),
          y2: SvgLength(0),
          stops: <SvgStop>[],
        );
        const SvgRect rect = SvgRect(
          id: 'rect1',
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
          viewBox: SvgViewBox(0, 0, 100, 100),
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
          opacity: SvgPercentage(50),
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
        const SvgGroup group = SvgGroup(children: <SvgElement>[rect1], opacity: SvgPercentage(100));
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
          const SvgCircle(cx: SvgLength(0), cy: SvgLength(0), r: SvgLength(10)),
          const SvgEllipse(cx: SvgLength(0), cy: SvgLength(0), rx: SvgLength(10), ry: SvgLength(5)),
          const SvgLine(x1: SvgLength(0), y1: SvgLength(0), x2: SvgLength(10), y2: SvgLength(10)),
          const SvgPath(d: 'M0 0 L10 10'),
          const SvgPolyline(points: SvgPointList(<double>[0, 0, 10, 10])),
          const SvgPolygon(points: SvgPointList(<double>[0, 0, 10, 10, 0, 10])),
          const SvgText(x: SvgLength(0), y: SvgLength(0), text: 'Test'),
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
            SvgStyle(),
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
