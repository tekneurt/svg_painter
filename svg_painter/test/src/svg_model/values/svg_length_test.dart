import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgLength', () {
    test('should return correct string representation for unit none', () {
      // Arrange
      const SvgLength length = SvgLength(10.0);

      // Act
      final String result = length.toString();

      // Assert
      expect(result, '10.0');
    });

    test('should return correct string representation for unit px', () {
      // Arrange
      const SvgLength length = SvgLength(20.0, SvgLengthUnit.px);

      // Act
      final String result = length.toString();

      // Assert
      expect(result, '20.0px');
    });

    test('should return correct string representation for unit cm', () {
      // Arrange
      const SvgLength length = SvgLength(2.5, SvgLengthUnit.cm);

      // Act
      final String result = length.toString();

      // Assert
      expect(result, '2.5cm');
    });
  });
}
