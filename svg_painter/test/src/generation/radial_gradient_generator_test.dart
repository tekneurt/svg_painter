import 'package:svg_painter/src/generation/radial_gradient_generator.dart';
import 'package:svg_painter/src/painting_model/paint_command.dart';
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
        cx: 0.5,
        cy: 0.5,
        radius: 0.5,
        fx: 0.5,
        fy: 0.5,
        focalRadius: 0.0,
        stops: stops,
      );
      final StringBuffer buffer = StringBuffer();

      // Act
      generator.generate(command, buffer);

      // Assert
      final String output = buffer.toString();
      // (0.5 * 2 - 1) = 0.0
      expect(output, contains('final Gradient _grad_rad1 = RadialGradient('));
      expect(output, contains('center: Alignment(0.0, 0.0)'));
      expect(output, contains('radius: 0.5'));
      expect(output, contains('focal: Alignment(0.0, 0.0)'));
      expect(output, contains('focalRadius: 0.0'));
      expect(output, contains('colors: [Color(0xFFFF0000), Color(0xFF0000FF)]'));
      expect(output, contains('stops: [0.0, 1.0]'));
    });
  });
}
