import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/painting_model/styles/painting_style.dart';
import 'package:svg_painter/src/svg_painter_generator.dart';
import 'package:test/test.dart';

void main() {
  group('SvgPainterGenerator', () {
    final SvgPainterGenerator generator = SvgPainterGenerator();

    group('generatePainterClass', () {
      test('should generate a CustomPainter class with the correct name and viewBox', () {
        // Arrange
        const String className = 'MyTestPainter';
        const double width = 200.0;
        const double height = 100.0;
        const List<PaintCommand> commands = <PaintCommand>[];

        // Act
        final String output = generator.generatePainterClass(
          className: className,
          viewBoxWidth: width,
          viewBoxHeight: height,
          commands: commands,
        );

        // Assert
        expect(output, contains('class MyTestPainter extends CustomPainter {'));
        expect(output, contains('Size get viewBox => const Size(200.0, 100.0);'));
        expect(output, contains('bool shouldRepaint(covariant MyTestPainter oldDelegate)'));
      });

      test('should include _dashPath method only when commands have dashes', () {
        // Arrange
        const List<PaintCommand> commandsWithDashes = <PaintCommand>[
          DrawCircle(
            cx: 0,
            cy: 0,
            radius: 5,
            style: PaintingStyle(
              stroke: PaintingStrokeStyle(colorArgb: 0xFF000000, dashArray: <double>[2, 2]),
            ),
          ),
        ];
        const List<PaintCommand> commandsWithoutDashes = <PaintCommand>[
          DrawCircle(cx: 0, cy: 0, radius: 5, style: PaintingStyle()),
        ];

        // Act
        final String outputWithDashes = generator.generatePainterClass(
          className: 'DashPainter',
          viewBoxWidth: 100,
          viewBoxHeight: 100,
          commands: commandsWithDashes,
        );
        final String outputWithoutDashes = generator.generatePainterClass(
          className: 'NoDashPainter',
          viewBoxWidth: 100,
          viewBoxHeight: 100,
          commands: commandsWithoutDashes,
        );

        // Assert
        expect(outputWithDashes, contains('Path _dashPath(Path source'));
        expect(outputWithoutDashes, isNot(contains('Path _dashPath(Path source')));
      });

      test('should generate code for drawing commands', () {
        // Arrange
        const List<PaintCommand> commands = <PaintCommand>[
          DrawCircle(
            cx: 10,
            cy: 20,
            radius: 5,
            style: PaintingStyle(fill: PaintingFillStyle(colorArgb: 0xFF000000)),
          ),
        ];

        // Act
        final String output = generator.generatePainterClass(
          className: 'DrawPainter',
          viewBoxWidth: 100,
          viewBoxHeight: 100,
          commands: commands,
        );

        // Assert
        expect(output, contains('canvas.drawCircle(const Offset(10.0, 20.0), 5.0, paint);'));
      });
    });
  });
}
