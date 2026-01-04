import 'package:svg_painter/src/painting_model/styles/painting_style.dart';
import 'package:test/test.dart';

void main() {
  group('PaintingStyle', () {
    test('should store properties correctly', () {
      // Arrange
      const PaintingFillStyle fill = PaintingFillStyle(colorArgb: 0xFFFF0000);
      const PaintingStrokeStyle stroke = PaintingStrokeStyle(colorArgb: 0xFF0000FF);
      const PaintingTextStyle text = PaintingTextStyle(fontSize: 12.0);
      const double opacity = 0.5;

      // Act
      const PaintingStyle style = PaintingStyle(
        fill: fill,
        stroke: stroke,
        text: text,
        groupOpacity: opacity,
      );

      // Assert
      expect(style.fill, fill);
      expect(style.stroke, stroke);
      expect(style.text, text);
      expect(style.groupOpacity, opacity);
    });

    test('should return correct string representation when toString() is called', () {
      // Arrange
      const PaintingStyle style = PaintingStyle(
        fill: PaintingFillStyle(colorArgb: 0xFFFF0000),
        groupOpacity: 0.8,
      );

      // Act
      final String result = style.toString();

      // Assert
      expect(
        result,
        'PaintingStyle(fill: PaintingFillStyle(color: 4294901760, shader: null, opacity: 1.0), stroke: null, text: null, groupOpacity: 0.8)',
      );
    });
  });

  group('PaintingFillStyle', () {
    test('should store properties correctly', () {
      // Arrange
      const int color = 0xFFFF0000;
      const String shaderId = 'grad1';
      const double opacity = 0.5;

      // Act
      const PaintingFillStyle fill = PaintingFillStyle(
        colorArgb: color,
        shaderId: shaderId,
        opacity: opacity,
      );

      // Assert
      expect(fill.colorArgb, color);
      expect(fill.shaderId, shaderId);
      expect(fill.opacity, opacity);
    });

    test('should return correct string representation when toString() is called', () {
      // Arrange
      const PaintingFillStyle fill = PaintingFillStyle(colorArgb: 0xFFFF0000, opacity: 0.8);

      // Act
      final String result = fill.toString();

      // Assert
      expect(result, 'PaintingFillStyle(color: 4294901760, shader: null, opacity: 0.8)');
    });
  });

  group('PaintingTextStyle', () {
    test('should store properties correctly', () {
      // Arrange
      const double fontSize = 16.0;
      const String fontFamily = 'Roboto';
      const String fontWeight = 'bold';
      const String fontStyle = 'italic';

      // Act
      const PaintingTextStyle text = PaintingTextStyle(
        fontSize: fontSize,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
      );

      // Assert
      expect(text.fontSize, fontSize);
      expect(text.fontFamily, fontFamily);
      expect(text.fontWeight, fontWeight);
      expect(text.fontStyle, fontStyle);
    });

    test('should return correct string representation when toString() is called', () {
      // Arrange
      const PaintingTextStyle text = PaintingTextStyle(fontSize: 14.0, fontFamily: 'Arial');

      // Act
      final String result = text.toString();

      // Assert
      expect(result, 'PaintingTextStyle(size: 14.0, weight: null, style: null, family: Arial)');
    });
  });
}
