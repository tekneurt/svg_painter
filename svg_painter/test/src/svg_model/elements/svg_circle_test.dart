import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgCircle', () {
    test('should return correct string representation when toString() is called', () {
      // Arrange
      const SvgCircle circle = SvgCircle(
        cx: SvgLength(10.0),
        cy: SvgLength(20.0),
        r: SvgLength(5.0),
        id: 'c1',
      );

      // Act
      final String result = circle.toString();

      // Assert
      expect(result, 'SvgCircle(cx: 10.0, cy: 20.0, r: 5.0, id: c1)');
    });
  });
}
