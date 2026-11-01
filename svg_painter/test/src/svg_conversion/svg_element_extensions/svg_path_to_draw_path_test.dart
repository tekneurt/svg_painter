import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/svg_conversion/converters/svg_painting_context.dart';
import 'package:svg_painter/src/svg_conversion/svg_element_extensions/svg_path_to_draw_path.dart';
import 'package:svg_painter/src/svg_model/attribute_groups/svg_core_attributes.dart';
import 'package:svg_painter/src/svg_model/attribute_groups/svg_presentation_attributes.dart';
import 'package:svg_painter/src/svg_model/attribute_groups/svg_stroke_attributes.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  const grad = SvgLinearGradient(
    coreAttributes: SvgCoreAttributes(id: 'path-grad'),
    gradientUnits: SvgGradientUnits.objectBoundingBox,
    stops: <SvgStop>[
      SvgStop(offset: SvgPercentage(0), stopColor: SvgRgbColor(255, 0, 0, 0)),
      SvgStop(offset: SvgPercentage(100), stopColor: SvgRgbColor(255, 255, 255, 255)),
    ],
  );

  const context = SvgPaintingContext(
    viewBoxWidth: 100,
    viewBoxHeight: 200,
    definitions: {'path-grad': grad},
  );

  group('SvgPathToPaintCommands', () {
    test('should return Success with DrawPath when valid SvgPath is provided', () {
      // Arrange
      const path = SvgPath(d: 'M 10 11 L 20 21');

      // Act
      final Result<List<PaintCommand>> result = path.toPaintCommands(context);

      // Assert
      expect(result, isA<Success<List<PaintCommand>>>());
      final List<PaintCommand> commands = (result as Success<List<PaintCommand>>).value;
      expect(commands, hasLength(1));
      expect(commands.first, isA<DrawPath>());
      final drawPath = commands.first as DrawPath;
      expect(drawPath.operations, hasLength(2));
    });

    test('should return empty list when d attribute is empty', () {
      // Arrange
      const path = SvgPath(d: '');

      // Act
      final Result<List<PaintCommand>> result = path.toPaintCommands(context);

      // Assert
      final List<PaintCommand> commands = (result as Success<List<PaintCommand>>).value;
      expect(commands, isEmpty);
    });

    test(
      'should use fallback solid stroke when horizontal path uses objectBoundingBox gradient with fallback',
      () {
        // Arrange: horizontal path with y=180 across all points and fallback color #00FF00
        const path = SvgPath(
          d: 'M0 180 L480 180',
          presentationAttributes: SvgPresentationAttributes(
            stroke: SvgStrokeAttributes(
              color: SvgPaintReference('path-grad', fallback: SvgRgbColor(255, 0, 255, 0)),
              width: SvgLength(16.0),
            ),
          ),
        );

        // Act
        final Result<List<PaintCommand>> result = path.toPaintCommands(context);

        // Assert
        expect(result, isA<Success<List<PaintCommand>>>());
        final List<PaintCommand> commands = (result as Success<List<PaintCommand>>).value;
        expect(commands, hasLength(1));
        final drawPath = commands.first as DrawPath;
        expect(drawPath.style.stroke?.shaderId, isNull);
        expect(drawPath.style.stroke?.shaderUnits, isNull);
        expect(drawPath.style.stroke?.colorArgb, 0xFF00FF00);
        expect(drawPath.style.stroke?.width, 16.0);
      },
    );

    test(
      'should return empty commands when horizontal path uses objectBoundingBox gradient without fallback',
      () {
        // Arrange: horizontal path with y=180 across all points and NO fallback color
        const path = SvgPath(
          d: 'M0 180 L480 180',
          presentationAttributes: SvgPresentationAttributes(
            stroke: SvgStrokeAttributes(
              color: SvgPaintReference('path-grad'),
              width: SvgLength(18.0),
            ),
          ),
        );

        // Act
        final Result<List<PaintCommand>> result = path.toPaintCommands(context);

        // Assert
        expect(result, isA<Success<List<PaintCommand>>>());
        final List<PaintCommand> commands = (result as Success<List<PaintCommand>>).value;
        expect(commands, isEmpty);
      },
    );
  });
}
