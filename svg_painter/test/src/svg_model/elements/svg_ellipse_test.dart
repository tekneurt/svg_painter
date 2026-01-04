import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgEllipse', () {
    test('should return correct string representation when toString() is called', () {
      // Arrange
      const SvgEllipse ellipse = SvgEllipse(
        cx: SvgLength(50.0),
        cy: SvgLength(60.0),
        rx: SvgLength(30.0),
        ry: SvgLength(20.0),
        id: 'e1',
      );

      // Act
      final String result = ellipse.toString();

      // Assert
      expect(result, 'SvgEllipse(cx: 50.0, cy: 60.0, rx: 30.0, ry: 20.0, id: e1)');
    });
  });
}
