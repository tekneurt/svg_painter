import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:test/test.dart';

void main() {
  group('DefineLinearGradient', () {
    test('should return correct string representation when toString() is called', () {
      // Arrange
      const DefineLinearGradient command = DefineLinearGradient(
        id: 'grad1',
        x1: 0.1,
        y1: 0.2,
        x2: 0.3,
        y2: 0.4,
        stops: <GradientStop>[GradientStop(0.0, 0xFFFFFFFF), GradientStop(1.0, 0xFF000000)],
      );

      // Act
      final String result = command.toString();

      // Assert
      expect(result, 'DefineLinearGradient(id: grad1, stops: 2)');
    });

    test('GradientStop should return correct string representation', () {
      // Arrange
      const GradientStop stop = GradientStop(0.5, 0xFFFF0000);

      // Act & Assert
      expect(stop.toString(), 'GradientStop(offset: 0.5, color: 4294901760)');
    });
  });
}
