import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgContextStrokeColor', () {
    test('should return "context-stroke" when toString is called', () {
      // Arrange
      const color = SvgContextStrokeColor();

      // Act
      final result = color.toString();

      // Assert
      expect(result, 'context-stroke');
    });

    test('should support value equality when instances are compared', () {
      // Arrange
      const color1 = SvgContextStrokeColor();
      const color2 = SvgContextStrokeColor();

      // Act & Assert
      expect(color1, equals(color2));
      expect(color1.hashCode, equals(color2.hashCode));
    });
  });
}
