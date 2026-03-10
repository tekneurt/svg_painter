import 'package:svg_painter/src/painting_model/styles/painting_style.dart';
import 'package:test/test.dart';

void main() {
  group('PaintingTextStyle', () {
    test('should return correct string representation when toString() is called', () {
      // Arrange
      const PaintingTextStyle style = PaintingTextStyle(
        fontSize: 16.0,
        fontFamily: 'Roboto',
        fontWeight: PaintingFontWeight.bold,
        fontStyle: PaintingFontStyle.italic,
      );

      // Act
      final String result = style.toString();

      // Assert
      expect(
        result,
        'PaintingTextStyle(size: 16.0, weight: PaintingFontWeight.bold, style: PaintingFontStyle.italic, family: Roboto)',
      );
    });
  });
}
