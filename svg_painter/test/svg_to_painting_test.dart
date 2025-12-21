import 'package:svg_painter/src/base/_base.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/svg_conversion/converters/svg_to_painting.dart';
import 'package:svg_painter/src/svg_model/_svg_model.dart';
import 'package:test/test.dart';

void main() {
  group('SvgToPainting', () {
    test('resolves absolute lengths correctly', () {
      const SvgCircle circle = SvgCircle(
        cx: SvgLength(10.0),
        cy: SvgLength(20.0),
        r: SvgLength(5.0),
      );

      final Result<List<PaintCommand>> result = circle.toPaintCommands();

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
      const SvgRoot root = SvgRoot(
        viewBox: SvgViewBox(0, 0, 200, 100),
        children: <SvgElement>[
          SvgCircle(
            cx: SvgPercentage(50.0), // 50% of 200 = 100
            cy: SvgPercentage(20.0), // 20% of 100 = 20
            r: SvgPercentage(10.0),  // 10% of normalized diagonal
          ),
        ],
      );

      final Result<List<PaintCommand>> result = root.toPaintCommands();

      expect(result, isA<Success<List<PaintCommand>>>());
      final List<PaintCommand> commands = (result as Success<List<PaintCommand>>).value;
      final DrawCircle drawCircle = commands.first as DrawCircle;

      expect(drawCircle.cx, 100.0);
      expect(drawCircle.cy, 20.0);
      // Normalized diagonal for 200x100: sqrt(200^2 + 100^2) / sqrt(2) = sqrt(50000) / 1.414...
      // = 223.606 / 1.414... = 158.113...
      // 10% of 158.113... = 15.8113...
      expect(drawCircle.radius, closeTo(15.8113, 0.0001));
    });

    test('resolves colors correctly', () {
      const SvgCircle circle = SvgCircle(
        cx: SvgLength(0),
        cy: SvgLength(0),
        r: SvgLength(0),
        fill: SvgRgbColor(255, 255, 0, 0), // Red
        stroke: SvgRgbColor(255, 0, 0, 255), // Blue
      );

      final Result<List<PaintCommand>> result = circle.toPaintCommands();
      final DrawCircle drawCircle = (result as Success<List<PaintCommand>>).value.first as DrawCircle;

      expect(drawCircle.fillColorArgb, 0xFFFF0000);
      expect(drawCircle.strokeColorArgb, 0xFF0000FF);
    });

    test('resolves default colors when null', () {
      const SvgCircle circle = SvgCircle(
        cx: SvgLength(0),
        cy: SvgLength(0),
        r: SvgLength(0),
        fill: null,
        stroke: null,
      );

      final Result<List<PaintCommand>> result = circle.toPaintCommands();
      final DrawCircle drawCircle = (result as Success<List<PaintCommand>>).value.first as DrawCircle;

      expect(drawCircle.fillColorArgb, 0xFF000000); // Default black
      expect(drawCircle.strokeColorArgb, 0x00000000); // Default none
    });

    test('converts SvgEllipse to DrawOval correctly', () {
      const SvgEllipse ellipse = SvgEllipse(
        cx: SvgLength(100),
        cy: SvgLength(50),
        rx: SvgLength(40),
        ry: SvgLength(20),
        fill: SvgRgbColor(255, 0, 0, 255), // Blue fill
      );

      final Result<List<PaintCommand>> result = ellipse.toPaintCommands();

      expect(result, isA<Success<List<PaintCommand>>>());
      final List<PaintCommand> commands = (result as Success<List<PaintCommand>>).value;
      
      expect(commands, hasLength(1));
      expect(commands.first, isA<DrawOval>());
      
      final DrawOval drawOval = commands.first as DrawOval;
      expect(drawOval.cx, 100.0);
      expect(drawOval.cy, 50.0);
      expect(drawOval.rx, 40.0);
      expect(drawOval.ry, 20.0);
      expect(drawOval.fillColorArgb, 0xFF0000FF);
      expect(drawOval.strokeColorArgb, 0x00000000); // Default none
      expect(drawOval.strokeWidth, 1.0); // Default
    });

    test('resolves SvgEllipse auto values correctly', () {
      // Case 1: rx=auto, ry=20 -> rx=20, ry=20
      final SvgEllipse ellipse1 = SvgEllipse(
        cx: const SvgLength(0),
        cy: const SvgLength(0),
        rx: const SvgAuto(),
        ry: const SvgLength(20),
      );
      final DrawOval cmd1 =
          (ellipse1.toPaintCommands() as Success<List<PaintCommand>>).value.first as DrawOval;
      expect(cmd1.rx, 20.0);
      expect(cmd1.ry, 20.0);

      // Case 2: rx=30, ry=auto -> rx=30, ry=30
      final SvgEllipse ellipse2 = SvgEllipse(
        cx: const SvgLength(0),
        cy: const SvgLength(0),
        rx: const SvgLength(30),
        ry: const SvgAuto(),
      );
      final DrawOval cmd2 =
          (ellipse2.toPaintCommands() as Success<List<PaintCommand>>).value.first as DrawOval;
      expect(cmd2.rx, 30.0);
      expect(cmd2.ry, 30.0);

      // Case 3: rx=auto, ry=auto -> rx=0, ry=0
      final SvgEllipse ellipse3 = SvgEllipse(
        cx: const SvgLength(0),
        cy: const SvgLength(0),
        rx: const SvgAuto(),
        ry: const SvgAuto(),
      );
      final DrawOval cmd3 =
          (ellipse3.toPaintCommands() as Success<List<PaintCommand>>).value.first as DrawOval;
      expect(cmd3.rx, 0.0);
      expect(cmd3.ry, 0.0);
    });
  });
}
