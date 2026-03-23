import 'package:svg_painter/src/painting_model/paint_command.dart';
import 'package:test/test.dart';

void main() {
  group('DefineLinearGradient', () {
    test('should return correct string representation when toString() is called', () {
      // Arrange
      const command = DefineLinearGradient(
        id: 'grad1',
        x1: 0,
        y1: 0,
        x2: 100,
        y2: 0,
        stops: <GradientStop>[
          GradientStop(offset: 0, colorArgb: 0xFF000000),
          GradientStop(offset: 1, colorArgb: 0xFFFFFFFF),
        ],
      );

      // Act
      final result = command.toString();

      // Assert
      expect(result, contains('id: grad1'));
      expect(result, contains('stops: 2'));
    });
  });

  group('GradientStop', () {
    test('should return correct string representation', () {
      const stop = GradientStop(offset: 0.5, colorArgb: 4294901760, opacity: 0.8);
      expect(stop.toString(), 'GradientStop(offset: 0.5, color: 4294901760, opacity: 0.8)');
    });
  });
}
