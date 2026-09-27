import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgColor', () {
    test('SvgNoneColor should return "none"', () {
      // Arrange & Act
      final result = const SvgNoneColor().toString();
      // Assert
      expect(result, 'none');
    });

    test('SvgCurrentColor should return "currentColor"', () {
      // Arrange & Act
      final result = const SvgCurrentColor().toString();
      // Assert
      expect(result, 'currentColor');
    });

    test('SvgNamedColor should return correct string', () {
      // Arrange & Act
      final result = const SvgNamedColor(SvgColorName.red).toString();
      // Assert
      expect(result, 'SvgNamedColor(red)');
    });

    test('SvgRgbColor should return correct string', () {
      // Arrange & Act
      final result = const SvgRgbColor(255, 255, 0, 0).toString();
      // Assert
      expect(result, 'SvgRgbColor(255, 255, 0, 0)');
    });

    test('SvgHslColor should return correct string', () {
      // Arrange & Act
      final result = const SvgHslColor(1.0, 0.0, 100.0, 50.0).toString();
      // Assert
      expect(result, 'SvgHslColor(1.0, 0.0, 100.0%, 50.0%)');
    });

    test('SvgPaintReference should return correct string', () {
      // Arrange & Act
      final result = const SvgPaintReference('grad1').toString();
      // Assert
      expect(result, 'SvgPaintReference(grad1, fallback: null)');
    });

    test('SvgSystemColor should return correct string', () {
      // Arrange & Act
      final result = const SvgSystemColor(SvgSystemColorName.background).toString();
      // Assert
      expect(result, 'SvgSystemColor(background)');
    });
  });

  group('SvgColorName', () {
    test('fromName should return correct enum for valid names', () {
      // Arrange & Act & Assert
      expect(SvgColorName.fromName('red'), SvgColorName.red);
      expect(SvgColorName.fromName('BLUE'), SvgColorName.blue);
      expect(SvgColorName.fromName('Transparent'), SvgColorName.transparent);
    });

    test('fromName should return null for invalid names', () {
      // Arrange & Act & Assert
      expect(SvgColorName.fromName('blacky'), isNull);
    });
  });

  group('SvgSystemColorName', () {
    test('should return correct enum when name is valid case-insensitively', () {
      // Arrange & Act & Assert
      expect(SvgSystemColorName.fromName('Background'), SvgSystemColorName.background);
      expect(SvgSystemColorName.fromName('WINDOW'), SvgSystemColorName.window);
      expect(SvgSystemColorName.fromName('ThreeDFace'), SvgSystemColorName.threedface);
    });

    test('should return null when name is invalid', () {
      // Arrange & Act & Assert
      expect(SvgSystemColorName.fromName('InvalidColor'), isNull);
    });
  });
}
