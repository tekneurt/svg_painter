import 'package:svg_painter/src/generation/painter_class_generator.dart';
import 'package:svg_painter/src/painting_model/_painting_model.dart';
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
  });
}
