import 'package:svg_painter/src/painting_model/styles/painting_style.dart';
import 'package:test/test.dart';

void main() {
  group('PaintingStyle', () {
    test('should store properties correctly', () {
      // Arrange
      const PaintingFillStyle fill = PaintingFillStyle(colorArgb: 0xFFFF0000);
      const PaintingStrokeStyle stroke = PaintingStrokeStyle(colorArgb: 0xFF0000FF);
      const PaintingTextStyle text = PaintingTextStyle(
        fontSize: 12.0,
        fontWeight: PaintingFontWeight.normal,
        fontStyle: PaintingFontStyle.normal,
        fontFamily: 'Roboto',
      );
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
        'PaintingStyle(fill: PaintingFillStyle(color: 4294901760, shader: null, units: null, opacity: 1.0, explicit: true, currentColor: false), stroke: null, text: null, groupOpacity: 0.8, transform: null, clipRect: null)',
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
      fill.toString();

      // Assert
      expect(
        fill.toString(),
        'PaintingFillStyle(color: 4294901760, shader: null, units: null, opacity: 0.8, explicit: true, currentColor: false)',
      );
    });
  });

  group('PaintingTextStyle', () {
    test('should store properties correctly', () {
      // Arrange
      const double fontSize = 16.0;
      const String fontFamily = 'Roboto';
      const PaintingFontWeight fontWeight = PaintingFontWeight.bold;
      const PaintingFontStyle fontStyle = PaintingFontStyle.italic;

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
      const PaintingTextStyle text = PaintingTextStyle(
        fontSize: 14.0,
        fontWeight: PaintingFontWeight.bold,
        fontStyle: PaintingFontStyle.italic,
        fontFamily: 'Arial',
      );

      // Act
      final String result = text.toString();

      // Assert
      expect(
        result,
        'PaintingTextStyle(size: 14.0, weight: PaintingFontWeight.bold, style: PaintingFontStyle.italic, family: Arial)',
      );
    });
  });
}
