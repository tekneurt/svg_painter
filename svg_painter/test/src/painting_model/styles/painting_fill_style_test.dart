import 'package:svg_painter/src/painting_model/styles/painting_style.dart';
import 'package:test/test.dart';

void main() {
  group('PaintingFillStyle', () {
    test('should store all properties correctly when initialized', () {
      // Arrange & Act
      // ignore: prefer_const_constructors
      final PaintingFillStyle style = PaintingFillStyle(
        colorArgb: 0xFFFF0000,
        shaderId: 'test-shader',
        opacity: 0.75,
        isExplicit: false,
        isCurrentColor: true,
      );

      // Assert
      expect(style.colorArgb, 0xFFFF0000);
      expect(style.shaderId, 'test-shader');
      expect(style.opacity, 0.75);
      expect(style.isExplicit, isFalse);
      expect(style.isCurrentColor, isTrue);
    });

    test('should return correct string representation when toString() is called', () {
      // Arrange
      // ignore: prefer_const_constructors
      final PaintingFillStyle style = PaintingFillStyle(
        colorArgb: 0xFF000000,
        shaderId: 'grad1',
        opacity: 0.5,
      );

      // Act
      final String result = style.toString();

      // Assert
      expect(
        result,
        'PaintingFillStyle(color: 4278190080, shader: grad1, units: null, opacity: 0.5, explicit: true, currentColor: false)',
      );
    });
  });
}
