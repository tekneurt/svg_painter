import 'package:svg_painter/src/base/result.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/svg_conversion/converters/svg_to_painting.dart';
import 'package:svg_painter/src/svg_model/attributes/svg_stroke_attributes.dart';
import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgToPainting', () {
    test('resolves absolute lengths correctly', () {
      // Arrange
      const SvgCircle circle = SvgCircle(
        cx: SvgLength(10.0),
        cy: SvgLength(20.0),
        r: SvgLength(5.0),
      );

      // Act
      final Result<List<PaintCommand>> result = circle.toPaintCommands();

      // Assert
      expect(result, isA<Success<List<PaintCommand>>>());
      final List<PaintCommand> commands = (result as Success<List<PaintCommand>>).value;
      expect(commands, hasLength(1));
      expect(commands.first, isA<DrawCircle>());
      final DrawCircle drawCircle = commands.first as DrawCircle;
      expect(drawCircle.cx, 10.0);
      expect(drawCircle.cy, 20.0);
      expect(drawCircle.radius, 5.0);
    });

    test('resolves percentages relative to SvgRoot viewBox', () {
      // Arrange
      const SvgRoot root = SvgRoot(
        viewBox: SvgViewBox(0, 0, 200, 300),
        children: <SvgElement>[
          SvgCircle(
            cx: SvgPercentage(50.0), // 50% of 200 = 100
            cy: SvgPercentage(20.0), // 20% of 300 = 60
            r: SvgPercentage(10.0), // 10% of normalized diagonal
          ),
        ],
      );

      // Act
      final Result<List<PaintCommand>> result = root.toPaintCommands();

      // Assert
      expect(result, isA<Success<List<PaintCommand>>>());
      final List<PaintCommand> commands = (result as Success<List<PaintCommand>>).value;
      final DrawCircle drawCircle = commands.first as DrawCircle;

      expect(drawCircle.cx, 100.0);
      expect(drawCircle.cy, 60.0);
      // Normalized diagonal for 200x300: sqrt(200^2 + 300^2) / sqrt(2) = sqrt(130000) / 1.414...
      // = 360.555 / 1.414... = 254.950...
      // 10% of 254.950... = 25.495...
      expect(drawCircle.radius, closeTo(25.495, 0.001));
    });

    test('resolves colors correctly', () {
      // Arrange
      const SvgCircle circle = SvgCircle(
        cx: SvgLength(10.0),
        cy: SvgLength(20.0),
        r: SvgLength(5),
        fill: SvgRgbColor(255, 255, 0, 0), // Red
        stroke: SvgStrokeAttributes(color: SvgRgbColor(255, 0, 0, 255)), // Blue
      );

      // Act
      final Result<List<PaintCommand>> result = circle.toPaintCommands();

      // Assert
      final DrawCircle drawCircle =
          (result as Success<List<PaintCommand>>).value.first as DrawCircle;
      expect(drawCircle.style.fill?.colorArgb, 0xFFFF0000);
      expect(drawCircle.style.stroke?.colorArgb, 0xFF0000FF);
    });

    test('resolves default colors when null', () {
      // Arrange
      const SvgCircle circle = SvgCircle(cx: SvgLength(10), cy: SvgLength(20), r: SvgLength(5));

      // Act
      final Result<List<PaintCommand>> result = circle.toPaintCommands();

      // Assert
      final DrawCircle drawCircle =
          (result as Success<List<PaintCommand>>).value.first as DrawCircle;
      expect(drawCircle.style.fill?.colorArgb, 0xFF000000); // Default black
      expect(drawCircle.style.stroke, isNull); // Default none
    });

    test('converts SvgEllipse to DrawOval correctly', () {
      // Arrange
      const SvgEllipse ellipse = SvgEllipse(
        cx: SvgLength(100),
        cy: SvgLength(150),
        rx: SvgLength(40),
        ry: SvgLength(20),
        fill: SvgRgbColor(255, 0, 0, 255), // Blue fill
      );

      // Act
      final Result<List<PaintCommand>> result = ellipse.toPaintCommands();

      // Assert
      expect(result, isA<Success<List<PaintCommand>>>());
      final List<PaintCommand> commands = (result as Success<List<PaintCommand>>).value;
      expect(commands, hasLength(1));
      expect(commands.first, isA<DrawOval>());
      final DrawOval drawOval = commands.first as DrawOval;
      expect(drawOval.cx, 100.0);
      expect(drawOval.cy, 150.0);
      expect(drawOval.rx, 40.0);
      expect(drawOval.ry, 20.0);
      expect(drawOval.style.fill?.colorArgb, 0xFF0000FF);
      expect(drawOval.style.stroke, isNull);
    });

    test('resolves SvgEllipse auto values correctly', () {
      // Arrange
      // Case 1: rx=auto, ry=20 -> rx=20, ry=20
      const SvgEllipse ellipse1 = SvgEllipse(
        cx: SvgLength(10),
        cy: SvgLength(20),
        rx: SvgAuto(),
        ry: SvgLength(30),
      );

      // Act
      final DrawOval cmd1 =
          (ellipse1.toPaintCommands() as Success<List<PaintCommand>>).value.first as DrawOval;

      // Assert
      expect(cmd1.rx, 30.0);
      expect(cmd1.ry, 30.0);

      // Arrange
      // Case 2: rx=40, ry=auto -> rx=40, ry=40
      const SvgEllipse ellipse2 = SvgEllipse(
        cx: SvgLength(10),
        cy: SvgLength(20),
        rx: SvgLength(40),
        ry: SvgAuto(),
      );

      // Act
      final DrawOval cmd2 =
          (ellipse2.toPaintCommands() as Success<List<PaintCommand>>).value.first as DrawOval;

      // Assert
      expect(cmd2.rx, 40.0);
      expect(cmd2.ry, 40.0);
    });
  });
}
