import 'package:svg_painter/src/generation/radial_gradient_generator.dart';
import 'package:svg_painter/src/painting_model/_painting_model.dart';
import 'package:test/test.dart';

void main() {
  const List<GradientStop> stops = <GradientStop>[
    GradientStop(0.0, 0xFFFF0000), // Red
    GradientStop(1.0, 0xFF0000FF), // Blue
  ];

  group('RadialGradientGenerator', () {
    test('should generate RadialGradient definition correctly', () {
      // Arrange
      const RadialGradientGenerator generator = RadialGradientGenerator();
      const DefineRadialGradient command = DefineRadialGradient(
        id: 'rad1',
        cx: 0.1,
        cy: 0.2,
        radius: 0.3,
        fx: 0.4,
        fy: 0.5,
        focalRadius: 0.05,
        stops: stops,
      );
      final StringBuffer buffer = StringBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      final String output = buffer.toString();
      expect(output, contains('final Gradient _grad_rad1 = RadialGradient('));
      expect(output, contains('center: Alignment(-0.8, -0.6)'));
      expect(output, contains('radius: 0.3'));
      expect(output, contains('focal: Alignment(-0.19999999999999996, 0.0)'));
      expect(output, contains('focalRadius: 0.05'));
    });
  });
}
