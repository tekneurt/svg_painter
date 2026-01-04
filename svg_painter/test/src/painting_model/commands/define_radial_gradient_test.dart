import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:test/test.dart';

void main() {
  group('DefineRadialGradient', () {
    test('should return correct string representation when toString() is called', () {
      // Arrange
      const DefineRadialGradient command = DefineRadialGradient(
        id: 'rad1',
        cx: 0.1,
        cy: 0.2,
        radius: 0.3,
        fx: 0.4,
        fy: 0.5,
        focalRadius: 0.05,
        stops: <GradientStop>[GradientStop(0.0, 0xFFFFFFFF)],
      );

      // Act
      final String result = command.toString();

      // Assert
      expect(result, 'DefineRadialGradient(id: rad1, stops: 1)');
    });
  });
}
