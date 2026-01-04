import 'package:svg_painter/src/svg_model/svg_element.dart';
import 'package:svg_painter/src/svg_model/svg_value.dart';
import 'package:test/test.dart';

void main() {
  group('SvgLine', () {
    test('should return correct string representation when toString() is called', () {
      // Arrange
      const SvgLine line = SvgLine(
        x1: SvgLength(10.0),
        y1: SvgLength(20.0),
        x2: SvgLength(100.0),
        y2: SvgLength(200.0),
        id: 'l1',
      );

      // Act
      final String result = line.toString();

      // Assert
      expect(result, 'SvgLine(x1: 10.0, y1: 20.0, x2: 100.0, y2: 200.0, id: l1)');
    });
  });
}
