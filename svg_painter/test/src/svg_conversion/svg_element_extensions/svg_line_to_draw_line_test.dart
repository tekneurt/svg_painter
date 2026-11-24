import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/svg_conversion/converters/svg_painting_context.dart';
import 'package:svg_painter/src/svg_conversion/svg_element_extensions/svg_line_to_draw_line.dart';
import 'package:svg_painter/src/svg_model/attribute_groups/svg_core_attributes.dart';
import 'package:svg_painter/src/svg_model/attribute_groups/svg_presentation_attributes.dart';
import 'package:svg_painter/src/svg_model/attribute_groups/svg_stroke_attributes.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  const grad = SvgLinearGradient(
    coreAttributes: SvgCoreAttributes(id: 'test-grad'),
    gradientUnits: SvgGradientUnits.objectBoundingBox,
    stops: <SvgStop>[
      SvgStop(offset: SvgPercentage(0), stopColor: SvgRgbColor(255, 0, 0, 0)),
      SvgStop(offset: SvgPercentage(100), stopColor: SvgRgbColor(255, 255, 255, 255)),
    ],
  );

  const context = SvgPaintingContext(
    viewBoxWidth: 200,
    viewBoxHeight: 300,
    definitions: {'test-grad': grad},
  );

  group('SvgLineToPaintCommands', () {
    test('should return Success with DrawLine when valid SvgLine is provided', () {
      // Arrange
      const line = SvgLine(
        x1: SvgLength(10.0),
        y1: SvgLength(20.0),
        x2: SvgLength(100.0),
        y2: SvgLength(200.0),
      );

      // Act
      final Result<List<PaintCommand>> result = line.toPaintCommands(context);

      // Assert
      expect(result, isA<Success<List<PaintCommand>>>());
      final List<PaintCommand> commands = (result as Success<List<PaintCommand>>).value;
      expect(commands, hasLength(1));
      expect(commands.first, isA<DrawLine>());
      final drawLine = commands.first as DrawLine;
      expect(drawLine.x1, 10.0);
      expect(drawLine.y1, 20.0);
      expect(drawLine.x2, 100.0);
      expect(drawLine.y2, 200.0);
    });

    test(
      'should use fallback solid stroke when horizontal line uses objectBoundingBox gradient with fallback',
      () {
        // Arrange: horizontal line with y1 == y2 and stroke referencing grad with #00FF00 fallback
        const line = SvgLine(
          x1: SvgLength(15.0),
          y1: SvgLength(45.0),
          x2: SvgLength(185.0),
          y2: SvgLength(45.0),
          presentationAttributes: SvgPresentationAttributes(
            stroke: SvgStrokeAttributes(
              color: SvgPaintReference('test-grad', fallback: SvgRgbColor(255, 0, 255, 0)),
              width: SvgLength(12.0),
            ),
          ),
        );

        // Act
        final Result<List<PaintCommand>> result = line.toPaintCommands(context);

        // Assert
        expect(result, isA<Success<List<PaintCommand>>>());
        final List<PaintCommand> commands = (result as Success<List<PaintCommand>>).value;
        expect(commands, hasLength(1));
        final drawLine = commands.first as DrawLine;
        expect(drawLine.style.stroke?.shaderId, isNull);
        expect(drawLine.style.stroke?.shaderUnits, isNull);
        expect(drawLine.style.stroke?.colorArgb, 0xFF00FF00);
        expect(drawLine.style.stroke?.width, 12.0);
      },
    );

    test(
      'should return empty commands when horizontal line uses objectBoundingBox gradient without fallback',
      () {
        // Arrange: horizontal line with y1 == y2 and stroke referencing grad with NO fallback
        const line = SvgLine(
          x1: SvgLength(25.0),
          y1: SvgLength(55.0),
          x2: SvgLength(175.0),
          y2: SvgLength(55.0),
          presentationAttributes: SvgPresentationAttributes(
            stroke: SvgStrokeAttributes(
              color: SvgPaintReference('test-grad'),
              width: SvgLength(14.0),
            ),
          ),
        );

        // Act
        final Result<List<PaintCommand>> result = line.toPaintCommands(context);

        // Assert
        expect(result, isA<Success<List<PaintCommand>>>());
        final List<PaintCommand> commands = (result as Success<List<PaintCommand>>).value;
        expect(commands, isEmpty);
      },
    );
  });
}
