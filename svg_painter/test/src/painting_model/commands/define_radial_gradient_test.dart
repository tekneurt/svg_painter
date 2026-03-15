import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:test/test.dart';

void main() {
  group('DefineRadialGradient', () {
    test('should return correct string representation when toString() is called', () {
      // Arrange
      const DefineRadialGradient command = DefineRadialGradient(
        id: 'grad1',
        cx: 50,
        cy: 50,
        radius: 100,
        fx: 50,
        fy: 50,
        focalRadius: 0,
        stops: <GradientStop>[GradientStop(offset: 0, colorArgb: 0xFF000000)],
      );

      // Act
      final String result = command.toString();

      // Assert
      expect(result, contains('id: grad1'));
      expect(result, contains('stops: 1'));
    });
  });
}
