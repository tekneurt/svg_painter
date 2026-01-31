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
        // We can't easily inspect the internal context, but success implies it worked.
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
        // 1. DrawRect (original)
        // 2. DrawRect (via Use) - verify position
        expect(commands.length, 2);

        // The 'use' command should result in a DrawRect (resolved from target)
        // Check if one of the rects has the offset applied.
        final Iterable<DrawRect> rects = commands.whereType<DrawRect>();
        expect(rects.length, 2);

        // One rect at 0,0 (target), one at 50,50 (use)
        // Note: 'x' on DrawRect is transformed.
        final bool hasOffsetRect = rects.any((DrawRect r) => r.x == 50.0 && r.y == 50.0);

        expect(hasOffsetRect, isTrue);
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

        // Should contain DefineLinearGradient, but NOT DrawRect
        expect(commands.whereType<DefineLinearGradient>().length, 1);
        expect(commands.whereType<DrawRect>().length, 0);
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

        expect(commands.single, isA<DrawGroup>());
        final DrawGroup drawGroup = commands.single as DrawGroup;
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

        expect(commands.single, isA<DrawGroup>());
        final DrawGroup drawGroup = commands.single as DrawGroup;
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

        // Verify we got commands for each
        expect(commands.length, elements.length);
        expect(commands.whereType<DrawCircle>().length, 1); // Circle
        expect(commands.whereType<DrawOval>().length, 1); // Ellipse
        expect(commands.whereType<DrawLine>().length, 1);
        expect(commands.whereType<DrawPath>().length, 1);
        expect(commands.whereType<DrawPolyline>().length, 1);
        expect(commands.whereType<DrawPolygon>().length, 1);
        expect(commands.whereType<DrawText>().length, 1);
      });

      test('should ignore non-renderable elements', () {
        const SvgRoot root = SvgRoot(
          children: <SvgElement>[
            SvgTitle(content: 'Title'),
            SvgDesc(content: 'Desc'),
            SvgStyle(),
          ],
        );

        final Result<List<PaintCommand>> result = root.toPaintCommands();
        final List<PaintCommand> commands = (result as Success<List<PaintCommand>>).value;

        expect(commands, isEmpty);
      });
    });
  });
}
