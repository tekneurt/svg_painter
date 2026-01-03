import 'package:svg_painter/src/generation/_generation.dart';
import 'package:svg_painter/src/painting_model/_painting_model.dart';
import 'package:test/test.dart';

void main() {
  const List<GradientStop> stops = <GradientStop>[
    GradientStop(0.0, 0xFFFF0000), // Red
    GradientStop(1.0, 0xFF0000FF), // Blue
  ];

  group('LinearGradientGenerator', () {
    test('should generate LinearGradient definition correctly', () {
      // Arrange
      const LinearGradientGenerator generator = LinearGradientGenerator();
      const DefineLinearGradient command = DefineLinearGradient(
        id: 'grad1',
        x1: 0.0,
        y1: 0.0,
        x2: 1.0,
        y2: 0.0,
        stops: stops,
      );
      final StringBuffer buffer = StringBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      final String output = buffer.toString();
      // (0.0 * 2 - 1) = -1.0
      // (1.0 * 2 - 1) = 1.0
      expect(output, contains('final Gradient _grad_grad1 = LinearGradient('));
      expect(output, contains('begin: Alignment(-1.0, -1.0)'));
      expect(output, contains('end: Alignment(1.0, -1.0)'));
      expect(output, contains('colors: [Color(0xFFFF0000), Color(0xFF0000FF)]'));
      expect(output, contains('stops: [0.0, 1.0]'));
    });

    test('should handle transform if provided', () {
      // Arrange
      const LinearGradientGenerator generator = LinearGradientGenerator();
      const DefineLinearGradient command = DefineLinearGradient(
        id: 'grad2',
        x1: 0.0,
        y1: 0.0,
        x2: 1.0,
        y2: 0.0,
        stops: stops,
        transform: 'rotate(90)',
      );
      final StringBuffer buffer = StringBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      final String output = buffer.toString();
      expect(output, contains('transform: const GradientRotation(3.141592653589793 / 2)'));
    });
  });
}
