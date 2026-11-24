import 'package:svg_painter/src/generation/painter_class_generator.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:svg_painter/src/painting_model/styles/painting_style.dart';
import 'package:test/test.dart';

void main() {
  group('PainterClassGenerator', () {
    const generator = PainterClassGenerator();

    test('should generate a CustomPainter class with basic components', () {
      // Arrange
      const className = 'TestPainter';
      const width = 100.0;
      const height = 100.0;
      final commands = <PaintCommand>[];

      // Act
      final String output = generator.generatePainterClass(
        className: className,
        viewBoxWidth: width,
        viewBoxHeight: height,
        commands: commands,
        generators: {}, // Empty generators for simplicity
      );

      // Assert
      expect(output, contains('class TestPainter extends CustomPainter {'));
      expect(output, contains('Size get viewBox => const Size(100.0, 100.0);'));
      expect(output, contains('void paint(Canvas canvas, Size size) {'));
      expect(output, contains('bool shouldRepaint(covariant TestPainter oldDelegate) {'));
    });

    test('should generate SvgGradientTransform helper with isLinearBoundingBox when linear gradient needs transform', () {
      // Arrange
      const className = 'LinearStretchPainter';
      const width = 200.0;
      const height = 100.0;
      final commands = <PaintCommand>[
        const DefineLinearGradient(
          id: 'lin1',
          x1: 0.1,
          y1: 0.2,
          x2: 0.8,
          y2: 0.9,
          stops: <GradientStop>[],
        ),
        const DrawRect(
          x: 10,
          y: 20,
          width: 180,
          height: 60,
          rx: 0,
          ry: 0,
          style: PaintingStyle(fill: PaintingFillStyle(colorArgb: 0, shaderId: 'lin1')),
        ),
      ];

      // Act
      final String output = generator.generatePainterClass(
        className: className,
        viewBoxWidth: width,
        viewBoxHeight: height,
        commands: commands,
        generators: {},
      );

      // Assert
      expect(output, contains('class _SvgGradientTransform_LinearStretchPainter extends GradientTransform {'));
      expect(output, contains('this.isLinearBoundingBox = false,'));
      expect(output, contains('final bool isLinearBoundingBox;'));
      expect(output, contains('if (isLinearBoundingBox && bounds.width != bounds.height) {'));
    });
  });
}
