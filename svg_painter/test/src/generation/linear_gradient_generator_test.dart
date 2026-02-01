import 'package:svg_painter/src/generation/linear_gradient_generator.dart';
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
        x1: 0.1,
        y1: 0.2,
        x2: 0.3,
        y2: 0.4,
        stops: stops,
      );
      final StringBuffer buffer = StringBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      final String output = buffer.toString();
      expect(output, contains('final Gradient _grad_grad1 = LinearGradient('));
      expect(output, contains('begin: Alignment(-0.8, -0.6)'));
      expect(output, contains('end: Alignment(-0.4, -0.19999999999999996)'));
      expect(output, contains('colors: [const Color(0xFFFF0000), const Color(0xFF0000FF)]'));
      expect(output, contains('stops: [0.0, 1.0]'));
    });
  });
}
