import 'package:svg_painter/src/painting_model/styles/painting_style.dart';
import 'package:test/test.dart';

void main() {
  group('PaintingFillStyle', () {
    test('should return correct string representation when toString() is called', () {
      // Arrange
      const PaintingFillStyle style = PaintingFillStyle(colorArgb: 0xFF000000, opacity: 0.5);

      // Act
      final String result = style.toString();

      // Assert
      expect(result, 'PaintingFillStyle(color: 4278190080, shader: null, opacity: 0.5, explicit: true)');
    });
  });
}
