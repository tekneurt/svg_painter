import 'package:svg_painter/src/painting_model/styles/painting_style.dart';
import 'package:test/test.dart';

void main() {
  group('PaintingStyle', () {
    test('should return correct string representation when toString() is called', () {
      // Arrange
      const PaintingStyle style = PaintingStyle(
        fill: PaintingFillStyle(colorArgb: 0xFF000000),
        groupOpacity: 0.5,
      );

      // Act
      final String result = style.toString();

      // Assert
      expect(
        result,
        'PaintingStyle(fill: PaintingFillStyle(color: 4278190080, shader: null, opacity: 1.0), stroke: null, text: null, groupOpacity: 0.5)',
      );
    });
  });
}
