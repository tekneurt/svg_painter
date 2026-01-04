import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgRect', () {
    test('should return correct string representation when toString() is called', () {
      // Arrange
      const SvgRect rect = SvgRect(
        x: SvgLength(10.0),
        y: SvgLength(20.0),
        width: SvgLength(100.0),
        height: SvgLength(50.0),
        rx: SvgLength(5.0),
        ry: SvgLength(8.0),
        id: 'r1',
      );

      // Act
      final String result = rect.toString();

      // Assert
      expect(result, 'SvgRect(x: 10.0, y: 20.0, w: 100.0, h: 50.0, rx: 5.0, ry: 8.0, id: r1)');
    });
  });
}
