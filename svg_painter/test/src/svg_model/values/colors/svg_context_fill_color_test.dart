import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgContextFillColor', () {
    test('should return "context-fill" when toString is called', () {
      // Arrange
      const color = SvgContextFillColor();

      // Act
      final result = color.toString();

      // Assert
      expect(result, 'context-fill');
    });

    test('should support value equality when instances are compared', () {
      // Arrange
      const color1 = SvgContextFillColor();
      const color2 = SvgContextFillColor();

      // Act & Assert
      expect(color1, equals(color2));
      expect(color1.hashCode, equals(color2.hashCode));
    });
  });
}
